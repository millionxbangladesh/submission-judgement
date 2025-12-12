<?php

namespace App\Http\Controllers;

use App\Http\Requests\ApplicationRequest;
use App\Models\Registration;
use App\Traits\MailTrait;

class RegistrationController extends Controller
{
    use MailTrait;

    /**
     * Handle the incoming request.
     */
    public function __invoke(ApplicationRequest $request)
    {
        $challengeId = $request->challenge_id;
        $lastRegistration = Registration::where('app_challenge_id', $challengeId)->max('reg_id');
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
        ]);

        if ($request->hasFile('image')) {
            $image = "{$idGenerate}_team_group_image." . $request->image->getClientOriginalExtension();
            $request->image->move(public_path('uploads/group/'), $image);
            $registrations['image'] = $image;
        }
        $resData = Registration::create($registrations);
        $resData->teamMembers()->createMany($request->team_members);
        $this->sendConfirmationMail($request->team_leader_email, $request->team_leader_name, $request->team_name, $regNo);

        return to_route('registration')->with('app_id', $regNo);
    }

    private function sendConfirmationMail(string $email, string $name, string $teamName, string $regNo): void
    {
        $year = date('Y');
        $message = "
            <p>Dear <br/>
            <strong>{$teamName}</strong><br><br>
            We are pleased to inform you that your project has been successfully submitted for NASA Space Apps Challenge Bangladesh {$year}.
            <br><br>
            <strong> Your Registration ID : {$regNo}</strong><br/><br/>
            As we progress with the selection process, we will keep you updated if your project is shortlisted for the Global Hackathon. If you have any further inquiries, please feel free to contact us via email at bsf@basis.org.bd.
            <br/><br/><br/>
            Regards,<br/>
            Team NASA Space Apps Challenge-Bangladesh<br/>
            Organized by BASIS, Supported by BASIS Student's Forum.<br/>
            Website: <a href='https://bsf.basis.org.bd/' target='_blank'>bsf.basis.org.bd</a>
        ";

        $this->sendMail($email, $name, $message);
    }
}
