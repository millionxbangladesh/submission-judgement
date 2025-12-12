<?php

namespace App\Http\Controllers;

use App\Http\Requests\NewApplicationRequest;
use App\Models\Registration;
use App\Traits\MailTrait;

class NewRegistrationController extends Controller
{
    use MailTrait;

    /**
     * Handle the incoming request.
     */
    public function __invoke(NewApplicationRequest $request)
    {
        $challengeId = $request->challenge_id;
        $lastRegistration = Registration::where('app_challenge_id', $challengeId) ->selectRaw('MAX(CAST(reg_id AS UNSIGNED)) as max_id')
        ->value('max_id');
        $latestNo = $lastRegistration ? $lastRegistration + 1 : 1;
        $idGenerate = sprintf('%04d', $latestNo);
        $year = date('Y');
        $regNo = "NASA-{$year}-{$idGenerate}";

        $registrations = array_merge($request->except('team_members'), [
            'registration_no' => $regNo,
            'team_member' => count($request->team_members),
            'reg_id' => $idGenerate,
            'zone_id' => $request->location,
            'app_challenge_id' => $challengeId,
            'videolink' => $request->video_link,
            'session' => $year,
            'team_work_score' => 5,
            'user_experience_score' => 5,
        ]);

        if ($request->hasFile('image')) {
            $image = "{$idGenerate}_team_group_image." . $request->image->getClientOriginalExtension();
            $request->image->move(public_path('uploads/group/'), $image);
            $registrations['image'] = $image;
        }
        $resData = Registration::create($registrations);
        $loginInfo = participantCreate($request->team_leader_email, $resData->id);
        $resData->teamMembers()->createMany($request->team_members);
        $this->sendConfirmationMail($request->team_leader_email, $request->team_leader_name, $request->team_name, $regNo,$loginInfo->password);

        return to_route('registration')->with('app_id', $regNo);
    }

    private function sendConfirmationMail(string $email, string $name, string $teamName, string $regNo, $password): void
    {
        $year = date('Y');
        $message = "
            <p>
                Greetings Challenger,<br/><br/>

                Congratulations! 🎉 Your team has been successfully registered for the
                <strong>NASA International Space Apps Challenge {$year}</strong>, organized by BASIS.<br/><br/>

                Below are your login credentials to access the participant portal, where you can manage your team and submit your project:<br/>
                • <strong>Username:</strong> {$email}<br/>
                • <strong>Password:</strong> {$password}<br/>
                • <strong>Portal Link:</strong> <a href='https://nsac.basis.org.bd/login' target='_blank'>https://nsac.basis.org.bd/login</a><br/><br/>

                Use these credentials to log in and:<br/>
                • Manage your team information<br/>
                • Confirm/add team members<br/>
                • Submit your project before the deadline<br/><br/>

                ⚠️ <em>This is an auto-generated email. Please do not reply directly.</em><br/><br/>

                For support, contact us at <strong>+8801733364354 / +8801886886790</strong><br/><br/>

                We look forward to your innovation and wish your team the very best in the challenge! 🚀<br/><br/>
            </p>";

        $this->sendMail($email, $name, $message);
    }
}
