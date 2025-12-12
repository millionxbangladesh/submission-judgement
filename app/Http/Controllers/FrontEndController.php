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

class FrontEndController extends Controller
{
    use CommonQueries, MailTrait;

    public function index(): Response
    {
        return Inertia::render("Registration", [
            'zones' => $this->getZones(),
            'challengeInfo' => $this->getLatestChallenge(),
            'deadline' => $this->deadline(),
            'formatDate' => date('d F, Y', strtotime($this->deadline()['deadline']))
        ]);
    }

    public function registration(): Response
    {
        return Inertia::render("Registration", [
            'zones' => $this->getZones(),
            'challengeInfo' => $this->getLatestChallenge(),
            'deadline' => $this->deadline(),
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

    public function contact(): Response
    {
        return Inertia::render('Contact');
    }

    public function contactSubmit(ContactRequest $request): RedirectResponse
    {
        $data = $request->validated();
        $this->Contact_Mail($data['name'], $data['email'], "<p>This message is send from NASA Space Apps Challenge Bangladesh Website (https://nsac.basis.org.bd)<br><br>
            <b>Sender Information</b><br>
            Name: {$data['name']}<br>
            Email: {$data['email']}<br>
            Phone number: {$data['number']}<br><br>
            <b>Subject:</b> {$data['subject']}<br>
            <b>Message:</b> {$data['message']}<br>
            ");
        return to_route('contact')->with('success', 'Your message has been sent. We will contact you soon.');
    }

    public function faq(): Response
    {
        return Inertia::render('Faq', [
            'faqs' => FAQ::orderBy('position', 'desc')->whereStatus('active')->get()
        ]);
    }

    public function organizer(): Response
    {
        return Inertia::render('LocalOrganizer', [
            'organizers' => $this->getOrganizer()
        ]);
    }

    public function teamDetails($slug): Response
    {
        $team = Registration::select('id', 'zone_id', 'team_name', 'project_name', 'description', 'team_leader_name', 'image')
            ->with(['teamMembers:id,registration_id,name', 'zone:id,title'])
            ->where('slug', $slug)->firstOrFail();
        return Inertia::render('TeamSingle', compact('team'));
    }

    public function mediaCenter(): Response
    {
        return Inertia::render('MediaCenter', [
            'newses' => News::orderBy('date', 'desc')->select([
                'id', 'title', 'slug', 'date', 'description', 'news_link', 'thumbnail', 'is_redirect'
            ])
                ->where('status', 'PUBLISHED')
                ->get()
        ]);
    }

    public function mentors(): Response
    {
        return Inertia::render('Mentors', [
            'mentors' => Organizer::orderBy('position', 'desc')
                ->where('type', 'Mentor_1')
                ->whereStatus('active')
                ->get(['id', 'name', 'designation', 'image', 'linkedin', 'organization_name'])
        ]);
    }

    public function judges(): Response
    {
        return Inertia::render('Judges', [
            'judges' => Organizer::orderBy('position', 'desc')
                ->where([
                    'type' => 'Judge_1',
                    'status' => 'active'
                ])->get(['id', 'name', 'designation', 'image', 'linkedin', 'organization_name'])
        ]);
    }

    public function localWinner(): Response
    {
        return Inertia::render('LocalWinner', [
            'localWinners' => AppChallengeInfo::select(['id', 'title', 'slug', 'session', 'local_cover'])
                ->withCount(['applications',
                    'applications as champion_count' => function ($query) {
                        $query->where(['level' => 'LOCAL', 'position' => 'first']);
                    },
                    'applications as merit_count' => function ($query) {
                        $query->where('level', 'LOCAL')
                            ->whereNotNull('position')
                            ->where('position', '!=', 'first');
                    }
                ])
                ->whereHas('applications', function ($query) {
                    $query->where('level', 'LOCAL');
                })
                ->orderBy('session', 'desc')
                ->get()
        ]);
    }

    public function localDetails($slug): Response
    {
        $challengeInfo = AppChallengeInfo::select(['id', 'title', 'slug', 'session', 'start_date', 'end_date', 'local_cover', 'local_description'])
            ->where('slug', $slug)
            ->withCount(['applications',
                'applications as champion_count' => fn($q) => $q->where(['level' => 'LOCAL', 'position' => 'first']),
                'applications as merit_count' => fn($q) => $q->where('level', 'LOCAL')
                    ->whereNotNull('position')
                    ->where('position', '!=', 'first'),
            ])->firstOrFail();

        $session = $challengeInfo->session;
        $zones = Zone::select('id', 'title')->with(['applications' => function ($query) use ($session) {
            $query->select('id', 'zone_id', 'team_name', 'position', 'slug')
                ->whereRaw("SUBSTRING_INDEX(SUBSTRING_INDEX(registration_no, '-', -2), '-', 1) = ?", [$session])
                ->where('level', 'LOCAL')->orderBy('position', 'asc');
        }])->whereHas('applications', function ($query) use ($session) {
            $query->where('level', 'LOCAL')
                ->whereRaw("SUBSTRING_INDEX(SUBSTRING_INDEX(registration_no, '-', -2), '-', 1) = ?", [$session]);
        })->get();
        return Inertia::render('LocalSingle', compact('challengeInfo', 'zones'));
    }

    public function globalAchievement(): Response
    {
        return Inertia::render('GlobalAchievement', [
            'globalWinners' => $this->getGlobalAchievements()
        ]);
    }

    public function globalDetails($slug): Response
    {
        $challengeInfo = AppChallengeInfo::select(['id', 'title', 'slug', 'session', 'cover', 'description'])
            ->where('slug', $slug)
            ->withCount([
                'applications',
                'applications as champion_count' => function ($q) {
                    $q->where(['position' => 'first', 'is_global' => 1]);
                },
                'applications as merit_count' => function ($q) {
                    $q->where('is_global', 1)
                        ->whereNotNull('position')
                        ->where('position', '!=', 'first');
                },
            ])->firstOrFail();

        $challengeId = $challengeInfo->id;

        $applications = Registration::select('id', 'team_name', 'project_name', 'image', 'position', 'slug')
            ->where('app_challenge_id', $challengeId)
            ->where('is_global', 1)
            ->whereNotNull('position')
            ->get();

        // Separate champions and merits
        $champions = $applications->filter(fn($application) => $application->position === 'first');
        $merits = $applications->filter(fn($application) => $application->position !== 'first');

        return Inertia::render('GlobalSingle', compact('challengeInfo', 'champions', 'merits'));
    }


    public function schedule(): Response
    {
        return Inertia::render('Schedule', [
            'programSchedules' => $this->getSchedules()
        ]);
    }

    public function documents(): Response
    {
        $documents = Resource::select('id', 'title', 'date', 'image', 'pdf','link')
            ->orderBy('position', 'desc')
            ->whereStatus('active')
            ->get();

        return Inertia::render('Documents', [
            'images' => $documents->filter(fn($document) => $document->image !== null)->values()->toArray(),
            'pdfs' => $documents->filter(fn($document) => $document->pdf !== null)->values()->toArray(),
            'links' => $documents->filter(fn($document) => $document->link !== null)->values()->toArray()
        ]);
    }

    public function checkEmail()
    {
        return $this->sendMail('sr.dev@basis.org.bd', 'Jarjis', "<h1>Test</h1>");
    }
}
