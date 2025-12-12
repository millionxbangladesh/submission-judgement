<?php

namespace App\Http\Controllers\backEnd;

use App\Exports\RegistrationExport;
use App\Http\Controllers\Controller;
use App\Models\Registration;
use App\Models\TeamMember;
use App\Traits\CommonQueries;
use App\Traits\MailTrait;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Foundation\Application;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Maatwebsite\Excel\Facades\Excel;
use Intervention\Image\ImageManagerStatic as Image;
use Illuminate\Support\Facades\Storage;

class ApplicationController extends Controller
{
    use MailTrait, CommonQueries;

    protected $dir = 'backEnd.application';
    protected array $levels = ['SHORTLIST', 'LOCAL', 'GLOBAL'];

    public function index(Request $request): Factory|View|Application
    {
        $applications = Registration::with('appChallengeCategory:id,title', 'zone')
            ->when($request->date, function ($query, $dates) {
                [$startDate, $endDate] = explode(" - ", $dates);
                $startDate = Carbon::createFromFormat('d/m/Y', $startDate)->startOfDay();
                $endDate = Carbon::createFromFormat('d/m/Y', $endDate)->endOfDay();
                return $query->whereBetween('created_at', [
                    $startDate->toDateTimeString(),
                    $endDate->toDateTimeString()
                ]);
            })
            ->when($request->year, function ($query, $year) {
                return $query->whereRaw("SUBSTRING_INDEX(SUBSTRING_INDEX(registration_no, '-', -2), '-', 1) = ?", [$year]);
            })
            ->when($request->category, function ($query, $category) {
                return $query->where('category_id', $category);
            })
            ->when($request->location, function ($query, $location) {
                return $query->where('zone_id', $location);
            })
            ->when($request->project, function ($query, $project) {
                return $query->where('project_name', 'like', "%{$project}%");
            })
            ->when($request->team_name, function ($query, $team) {
                return $query->where('team_name', 'like', "%{$team}%");
            })
            ->when($request->mobile, function ($query, $mobile) {
                return $query->where('team_leader_mobile', $mobile);
            })
            ->when($request->level, function ($query, $level) {
                if ($level === 'submitted') {
                    $query->whereNull('level');
                } elseif ($level === 'global') {
                    $query->where('is_global', true);
                } else {
                    $query->where('level', $level);
                }
            })
            ->when($request->email, function ($query, $email) {
                return $query->where('team_leader_email', $email);
            })
            ->orderBy('registration_no', 'asc')->paginate()->withQueryString();

        $categories = $this->getCategories();
        $zones = DB::table('zones')->get();
        $positionMap = [
            'first' => 'Champion',
            'second' => '1<sup>st</sup> Merit',
            'third' => '2<sup>nd</sup> Merit',
        ];
        return view("{$this->dir}.index", compact('applications', 'categories', 'zones', 'positionMap'));
    }

    public function show($id): View|Application|Factory|\Illuminate\Contracts\Foundation\Application
    {
        return view("{$this->dir}.show", [
            'app' => Registration::with('appChallengeCategory:id,title', 'zone')->findOrFail($id)
        ]);
    }

    public function excelExport(Request $request)
    {
        $filteredApplications = Registration::with('appChallengeCategory:id,title', 'zone')
            ->when($request->date, function ($query, $dates) {
                [$startDate, $endDate] = explode(" - ", $dates);
                $startDate = Carbon::createFromFormat('d/m/Y', $startDate)->startOfDay();
                $endDate = Carbon::createFromFormat('d/m/Y', $endDate)->endOfDay();
                return $query->whereBetween('created_at', [
                    $startDate->toDateTimeString(),
                    $endDate->toDateTimeString()
                ]);
            })
            ->when($request->year, function ($query, $year) {
                return $query->whereRaw("SUBSTRING_INDEX(SUBSTRING_INDEX(registration_no, '-', -2), '-', 1) = ?", [$year]);
            })
            ->when($request->category, function ($query, $category) {
                return $query->where('category_id', $category);
            })
            ->when($request->location, function ($query, $location) {
                return $query->where('zone_id', $location);
            })
            ->when($request->project, function ($query, $project) {
                return $query->where('project_name', 'like', "%{$project}%");
            })
            ->when($request->team, function ($query, $team) {
                return $query->where('team_name', 'like', "%{$team}%");
            })
            ->when($request->mobile, function ($query, $mobile) {
                return $query->where('team_leader_mobile', $mobile);
            })
            ->when($request->email, function ($query, $email) {
                return $query->where('team_leader_email', $email);
            })
            ->latest()
            ->get();

        return Excel::download(new RegistrationExport($filteredApplications), time() . "_registration.xls", \Maatwebsite\Excel\Excel::XLSX);
    }

    public function edit($id)
    {
        return view("{$this->dir}.edit", [
            'app' => Registration::findOrFail($id),
            'challengeCategories' => DB::table('app_challenge_categories')->whereStatus('active')->get(),
            'zones' => DB::table('zones')->whereStatus('active')->get(),
        ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'category' => 'nullable|integer',
            'project_name' => 'required|max:200',
            'video_link' => 'nullable|url|max:200',
            'nasa_link' => 'nullable|url|max:350',
            'description' => 'required',
            'team_name' => 'required|max:200',
            'team_leader_name' => 'required|max:120',
            'team_leader_mobile' => 'required|digits:11',
            'team_leader_email' => 'required|email',
            'location' => 'required',
            'image' => 'nullable|mimes:png,jpeg,jpg|max:3400',
            'team_members' => 'required|array',
            'team_members.*.name' => 'required|max:150',
            'team_members.*.email' => 'required|email',
            'team_members.*.mobile' => 'required|digits:11',
        ]);


        $data = array_merge($request->except('team_members'), [
            'category_id' => $request->category,
            'zone_id' => $request->location,
            'videolink' => $request->video_link,
        ]);

        $team_members = $request->team_members;
        $register_user = Registration::where('id', $id)->first();
        if ($request->hasFile('image')) {
            // $image = "{$register_user->reg_id}_team_group_image." . $request->image->getClientOriginalExtension();
            // $request->image->move(public_path('uploads/group/'), $image);
            $compressedImage = Image::make($request->image)->encode('webp', 10);
            $storedPath = 'uploads/group/{$register_user->reg_id}_team_group_image' . uniqid() . '.jpg';
            $compressedImage->save(public_path($storedPath));
            $image=str_replace('uploads/group/', '', $storedPath);
            $data['image'] = $image;
        }
        $register_user->fill($data)->save();
        $register_user->teamMembers()->delete($team_members);
        $register_user->teamMembers()->createMany($team_members);

        return redirect()->back()->with('success', 'Application has been update.');
    }

    public function makeShortList(Request $request)
    {

        $request->validate([
            'approve_type' => 'required|in:VIRTUAL,PHYSICAL',
            'reg_id' => 'required|integer'
        ]);

        $registration = Registration::find($request->reg_id);
        if ($registration && $registration->level === null) {
            $registration->update([
                'level' => 'SHORTLIST',
                'approve_type' => $request->approve_type
            ]);
          /*  $path = strtolower($request->approve_type) . '.json';
            $mailInfo = json_decode(file_get_contents(public_path("json/$path")), true);*/
            if($request->approve_type==='VIRTUAL'){
                $subject = 'Congratulations! Your Team Has Been Selected for Virtual Participation at NASA Space Apps Challenge Bangladesh 2023';
            }else{
                $subject = 'Congratulations! Your Team Has Been Selected for the In-Person Participation at NASA Space Apps Challenge Bangladesh 2023';
            }
//            $this->sendMail($registration->team_leader_email, $registration->team_leader_name, $subject, $this->emailBody($request->approve_type));
            $message = 'Thank You, Application has been shortlisted.';
        } else {
            $message = 'Sorry, the application is already shortlisted.';
        }

        return response()->json([
            'success' => true,
            'message' => $message
        ]);
    }

    public function changeStatus($id, $status): RedirectResponse
    {
        $registration = Registration::find($id);

        if ($status === 'sort') {
            if ($registration && $registration->level === null) {
                $registration->update(['level' => 'SHORTLIST']);
                $message = 'Application has been shortlisted.';
            } else {
                $message = 'Sorry, the application is already shortlisted.';
            }
        } elseif ($status === 'remove') {
            $registration->update(['level' => null, 'position' => null, 'approve_type' => null]);
            $message = 'Application has been removed from the shortlist.';
        } elseif ($status === 'local') {
            $registration->update(['level' => 'SHORTLIST', 'position' => null]);
            $message = 'Application has been removed from the local winner.';
        } elseif ($status === 'global') {
            $registration->update(['is_global' => false, 'global_position' => null]);
            $message = 'Application has been removed from the global winner.';
        }

        return redirect()->back()->with($registration ? 'success' : 'error', $message);


    }

    public function destroy($id)
    {
        Registration::findOrFail($id)->delete();
        TeamMember::where('registration_id', $id)->delete();
        return redirect()->back()->with('success', 'Application has been deleted.');
    }

    public function makeWinner(Request $request)
    {
        $request->validate([
            'position' => 'required',
            'level' => 'required|in:LOCAL,GLOBAL'
        ]);

        try {

            $levelMap = [
                'LOCAL' => 'SHORTLIST',
                'GLOBAL' => 'LOCAL',
            ];

            $level = $levelMap[$request->level] ?? '';
            $data = Registration::select('id', 'zone_id')->where('level', $level)->find($request->id);

            if (!$data) {
                $msg = 'Sorry, the application is not eligible for the winner.';
                $success = false;
            } else {
                $positionMsgMap = [
                    'first' => 'Sorry, the champion already exists in this division.',
                    'second' => 'Sorry, the first merit already exists in this division.',
                    'third' => 'Sorry, the second merit already exists in this division.',
                ];
                if ($request->level === 'LOCAL') {
                    $isExistWinner = Registration::where(['zone_id' => $data->zone_id, 'position' => $request->position])
                        ->whereRaw("SUBSTRING_INDEX(SUBSTRING_INDEX(registration_no, '-', -2), '-', 1) = ?", [substr($data->registration_no, 5, 4)])
                        ->exists();
                    if ($isExistWinner) {
                        $msg = $positionMsgMap[$request->position];
                        $success = false;
                    } else {
                        Registration::find($request->id)->update([
                            'level' => $request->level,
                            'position' => $request->position
                        ]);
                        $success = true;
                        $msg = 'Congratulations! Local winner has been selected.';
                    }
                } else {
                    $isLocalWinner = Registration::where(['level' => 'LOCAL', 'id' => $request->id])->where('position', '!=', null)->exists();
                    if ($isLocalWinner) {
                        Registration::find($request->id)->update([
                            'global_position' => $request->position,
                            'is_global' => true
                        ]);
                        $success = true;
                        $msg = 'Congratulations! Global winner has been selected.';
                    } else {
                        $success = false;
                        $msg = 'Sorry, The project is not shortlist/local winner.';
                    }


                }
            }
            return response()->json([
                'success' => $success,
                'message' => $msg
            ]);
        } catch (\Exception $e) {
            return response()->json($e->getMessage());
        }

    }

    public function globalWinner($id): RedirectResponse
    {
        $isLocalWinner = Registration::where(['level' => 'LOCAL', 'id' => $id])->where('position', '!=', null)->exists();
        if ($isLocalWinner) {
            Registration::find($id)->update([
                'is_global' => true
            ]);

            return redirect()->back()->with('success', 'The project has been selected for global winner.');
        }
        return redirect()->back()->with('error', 'Sorry, The project is not shortlist/local winner.');
    }


    protected function emailBody($type): string
    {
        if ($type === 'VIRTUAL') {
            $txt = 'virtually from October 6 to October 7, 2023';
        } else {
            $txt = 'in-person at IUB, Dhaka from October 6 to October 7, 2023';
        }
        return '
<p><strong>Dear Team Leaders,</strong></p>

Congratulations from BASIS!<br>

<p>After careful evaluation of all project applications, we are pleased
    to inform you that your project has been shortlisted as one of the excellent projects,
    who will participate at this grand event <strong>' . $txt . '</strong>, where a continuous 36-hour
    hackathon will be held.
</p>

<span style="color:blue">What\'s Next?</span><br>
This is just the beginning of an incredible journey. Here\'s a sneak peek of what to expect:
<ol type="1">
    <li><strong>Team Preparation:</strong> Gather your teammates and start preparing. Brainstorm ideas, plan your approach, and ensure everyone is ready to dive into this exciting experience.
    </li>
    <li><strong>Master the Global Event\'s Procedures and Guidelines.</strong>
        We\'ll provide a comprehensive event outline soon, but we expect you to thoroughly research and become an expert on it. This preparation will help you avoid difficulties and ensure a successful outcome.
    </li>
    <li>
        <strong>Important Links:</strong><br>
        <a href="https://www.spaceappschallenge.org/2023/challenges/" target="_blank">https://www.spaceappschallenge.org/2023/challenges/</a><br>
        <a href="https://www.spaceappschallenge.org/resources/" target="_blank">https://www.spaceappschallenge.org/resources/</a><br>
        <a href="https://www.facebook.com/SpaceAppsChallengeBangladesh/" target="_blank">https://www.facebook.com/SpaceAppsChallengeBangladesh/</a>
    </li>
    <li>
       <strong> Adherence to Instructions:</strong> Strictly adhere to the provided guidelines, which will propel your path towards becoming the next global champions.

    </li>

</ol>
<p>
    For any questions or help, contact us at 16488. Your success is our priority, and we\'re here to support you. Get ready for the exciting NASA Space Apps Challenge Bangladesh 2023!
</p>

Warm regards,

<p>
    <strong>Local Organizer</strong><br>
    NASA Space Apps Challenge Bangladesh 2023
</p>';
    }
}
