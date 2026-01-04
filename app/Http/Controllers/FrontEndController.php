<?php

namespace App\Http\Controllers;

use App\Http\Requests\ContactRequest;
use App\Models\AlbumImage;
use App\Models\AppChallengeInfo;
use App\Models\FAQ;
use App\Models\News;
use App\Models\Organizer;
use App\Models\Registration;
use App\Models\Resource;
use App\Models\Partner;
use App\Models\Sponsor;
use App\Models\Zone;
use App\Traits\CommonQueries;
use App\Traits\MailTrait;
use Illuminate\Http\RedirectResponse;
use Inertia\Inertia;
use Inertia\Response;
use App\Models\Universities;
use Illuminate\Http\Request;
use App\Models\User;
class FrontEndController extends Controller
{
    use CommonQueries, MailTrait;


    public function registration(): Response
    {
        return Inertia::render("RegistrationNew", [
            'zones' => $this->getZones(),
            'challengeInfo' => $this->getLatestChallenge(),
            'deadline' => $this->deadline(),
            'universities' => Universities::where('is_active', 1 )->get() ,
            'formatDate' => date('d F, Y', strtotime($this->deadline()['deadline']))
        ]);
    }

    private function deadline(): array
    {
        $config = config('settings');
        $startDate = $this->formatDate($config['start_date']);
        $endDate = $this->formatDate($config['deadline']);
        $currentDate = strtotime(date('d-m-Y'));
        if (strtotime($startDate) > $currentDate) {
            $deadline = [
                'start' => false,
                'deadline' => $startDate
            ];
        } else {
            $deadline = [
                'start' => true,
                'deadline' => $endDate
            ];
        }
        return $deadline;
    }

    protected function formatDate($date): string
    {
        return date('d-m-Y',strtotime($date));
    }

    public function checkEmail()
    {
        return $this->sendMail('sr.dev@basis.org.bd', 'Jarjis', "<h1>Test</h1>");
    }

    public function judgeRegistration(): Response
    {
        return Inertia::render("JudgeMentorRegistration", [
            'deadline' => $this->deadline(),
            'formatDate' => date('d F, Y', strtotime($this->deadline()['deadline'])),
        ]);
    }

    public function judgeRegistrationCreate(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email',
            'organization' => 'required|string|max:255',
            'designation' => 'required|string|max:255',
            'phone' => 'required|digits_between:10,15',
            'password' => 'required|string|min:8',
            'termsAccepted' => 'required|accepted',
        ]);
        $userDataSet = $request->only((new User)->getFillable());
        $userDataSet['password'] = bcrypt($request->password);
        $userDataSet['role'] =  4;
        $userDataSet['role_name'] = 'judge';
        $userId = User::create($userDataSet);
        return to_route('register.judge-mentor')->with('app_id', $userId->id);
    }
}
