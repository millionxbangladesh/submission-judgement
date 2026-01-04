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
        $lastRegistration = Registration::where('app_challenge_id', 1) ->selectRaw('MAX(CAST(reg_id AS UNSIGNED)) as max_id')
        ->value('max_id');
        $latestNo = $lastRegistration ? $lastRegistration + 1 : 1;
        $idGenerate = sprintf('%04d', $latestNo);
        $year = date('Y');
        $regNo = "MillionX-{$year}-{$idGenerate}";

        $registrations = array_merge($request->except('team_members'), [
            'registration_no' => $regNo,
            'team_member' => count($request->team_members),
            'reg_id' => $idGenerate,
            'zone_id' => $request->location,
            'app_challenge_id' => 1,
            'session' => $year,
        ]);

        $resData = Registration::create($registrations);
        participantCreate($request->team_leader_email,$request->password, $resData->id);
        if($request->team_type === "team"){
            $resData->teamMembers()->createMany($request->team_members);
        }
        // $this->sendConfirmationMail($request->team_leader_email, $request->team_leader_name, $request->team_name, $regNo,$loginInfo->password);

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
