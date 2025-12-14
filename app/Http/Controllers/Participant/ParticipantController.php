<?php

namespace App\Http\Controllers\Participant;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;
use Intervention\Image\ImageManagerStatic as Image;
use App\Models\Registration;
use App\Models\AppChallengeCategory;
class ParticipantController extends Controller
{
    public function index()
    {
        return Inertia::render("Participant/Dashboard", [
            'zones' => DB::table('zones')->get(),
            'teamMembers' => auth()->guard('participant')->user()->registration->teamMembers,
            'appChallengeCategory' => AppChallengeCategory::where('status', 'active')->select('id','title')->get(),
            'project_name' => auth()->guard('participant')->user()->registration->project_name,
            'videolink' => auth()->guard('participant')->user()->registration->videolink,
            'description' => auth()->guard('participant')->user()->registration->description,
            'video30s' => auth()->guard('participant')->user()->registration->video30s,
            'video240s' => auth()->guard('participant')->user()->registration->video240s,
            'project_link' => auth()->guard('participant')->user()->registration->project_link,
            'category_id' => auth()->guard('participant')->user()->registration->category_id ,
            'is_female_members' => auth()->guard('participant')->user()->registration->is_female_members,
            'female_members' => auth()->guard('participant')->user()->registration->female_members,
            'nasa_global_team_url' => auth()->guard('participant')->user()->registration->nasa_global_team_url,
            'nasa_data_use' => auth()->guard('participant')->user()->registration->nasa_data_use,
            'filelink' => auth()->guard('participant')->user()->registration->file_link,
        ]);
    }

    public function teamInformationUpdate(Request $request)
    {
        $request->validate([
            'team_name' => 'required|max:200',
            'team_leader_name' => 'required|max:120',
            'team_leader_mobile' => 'required|digits:11',
            'team_leader_email' => 'required|email',
            'location' => 'required',
            'is_female_members' => 'required',
            'female_members' => 'required',
            'image' => 'nullable|mimes:png,jpeg,jpg|max:3400',
            'team_members' => 'required|array',
            'team_members.*.name' => 'required|max:150',
            'team_members.*.email' => 'required|email',
            'team_members.*.mobile' => 'required|digits:11',
        ]);


        $data = array_merge($request->except('team_members'));

        $team_members = $request->team_members;
        $register_user = Registration::where('id', auth()->guard('participant')->user()->registration->id)->first();
        if ($request->hasFile('image')) {
            $compressedImage = Image::make($request->image)->encode('webp', 10);
            $storedPath = 'uploads/group/{$register_user->reg_id}_team_group_image' . uniqid() . '.jpg';
            $compressedImage->save(public_path($storedPath));
            $image=str_replace('uploads/group/', '', $storedPath);
            $data['image'] = $image;
        }
        $register_user->fill($data)->save();
        $register_user->teamMembers()->delete($team_members);
        $register_user->teamMembers()->createMany($team_members);
        return to_route('participant.dashboard');
    }

    public function projectInformationUpdate(Request $request)
    {
        $registrationId = auth()->guard('participant')->user()->registration->id;

        $request->validate([
            'project_name' => 'required|max:200|unique:registrations,project_name,' . $registrationId,
            // 'video_link'   => 'required|url|max:200',
            'description'  => 'required|max:5000',
            'nasa_data_use'  => 'required|max:200',
            'category_id'  => 'required',
            'nasa_global_team_url'  => 'required|url|max:200',
        ]);

        $registerUser = Registration::findOrFail($registrationId);
        $registerUser->fill($request->only([
            'project_name',
            'description',
            'category_id',
            'nasa_data_use',
            'nasa_global_team_url'
        ]));

        // set flags if not already set
        $registerUser->is_nasa_global_team_url_score = 1;
        $registerUser->is_challenge_category_score   = 1;
        $registerUser->is_nasa_data_usage_score   = 5;

        $registerUser->save();

        return redirect()->route('participant.dashboard');
    }

    public function hackathonInformationUpdate(Request $request)
    {
        $registrationId = auth()->guard('participant')->user()->registration->id;

        $request->validate([
            'file_link' => 'nullable|url|max:200',
            'videolink'   => 'nullable|url|max:200',
            'project_link'  => 'nullable|url|max:200',
        ]);

        $registerUser = Registration::findOrFail($registrationId);
        $registerUser->fill($request->only(['file_link', 'video_link', 'project_link']));

        // set flags if not already set
        $registerUser->id_project_link_score = 1;

        $registerUser->save();

        return redirect()->route('participant.dashboard');
    }
}
