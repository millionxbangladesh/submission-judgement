<?php

namespace App\Http\Controllers\Participant;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;
use Intervention\Image\ImageManagerStatic as Image;
use App\Models\Registration;
use App\Models\AppChallengeCategory;
use App\Models\Universities;
use Illuminate\Validation\Rule;
class ParticipantController extends Controller
{
    public function index()
    {
        return Inertia::render("Participant/Dashboard", [
            'zones' => DB::table('zones')->get(),
            'teamMembers' => auth()->guard('participant')->user()->registration->teamMembers,
            'appChallengeCategory' => AppChallengeCategory::where('status', 'active')->whereNull('parent_id')->select('id','title')->get(),
            'project_name' => auth()->guard('participant')->user()->registration->project_name,
            'description' => auth()->guard('participant')->user()->registration->description,
            'category_id' => auth()->guard('participant')->user()->registration->category_id ,
            'sub_category_id' => auth()->guard('participant')->user()->registration->sub_category_id ,
            'filelink' => auth()->guard('participant')->user()->registration->file_link ,
            'videolink' => auth()->guard('participant')->user()->registration->videolink,
            'project_link' => auth()->guard('participant')->user()->registration->project_link,
            'termsAccepted' => auth()->guard('participant')->user()->registration->termsAccepted ,
            'universities' => Universities::where('is_active', 1 )->get() ,
            'university_id' => auth()->guard('participant')->user()->registration->university_id ?? null,
            'team_type' => auth()->guard('participant')->user()->registration->team_type ?? null,
            'submitDate' => auth()->guard('participant')->user()->registration->submitDate ?? null,
        ]);
    }

    public function getSubCategory(Request $request)
    {
        $subCategory = AppChallengeCategory::where('parent_id', $request->id)->get();
        return $subCategory;
    }

    public function teamInformationUpdate(Request $request)
    {
        $request->validate([
            'team_name' => 'required|max:25|unique:registrations,team_name,' . auth()->guard('participant')->user()->registration->id,
            // 'team_name' => 'required|max:200',
            'team_leader_name' => 'required|max:120',
            'team_leader_mobile' => 'required',
            'team_leader_email' => 'required|email',
            'location' => 'required',
            'university_id' => 'required',
            'team_type' => 'nullable',
            // 'image' => 'nullable|mimes:png,jpeg,jpg|max:3400',
            'team_members' => 'nullable|array',
            'team_members.*.name' => 'required|max:150',
            'team_members.*.email' => 'required|email',
            'team_members.*.mobile' => 'required|digits_between:10,15',
        ]);


        $data = array_merge($request->except('team_members'));

        $team_members = $request->team_members;
        $register_user = Registration::where('id', auth()->guard('participant')->user()->registration->id)->first();
        // if ($request->hasFile('image')) {
        //     $compressedImage = Image::make($request->image)->encode('webp', 10);
        //     $storedPath = 'uploads/group/{$register_user->reg_id}_team_group_image' . uniqid() . '.jpg';
        //     $compressedImage->save(public_path($storedPath));
        //     $image=str_replace('uploads/group/', '', $storedPath);
        //     $data['image'] = $image;
        // }
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
            'description'  => 'required|max:5000',
            'category_id'  => 'required',
            'sub_category_id'  => 'required',
            'file_link' => 'required|url|max:200',
            'videolink'   => 'nullable|url|max:200',
            'project_link'  => 'nullable|url|max:200',
            'termsAccepted'  => 'required',
        ]);

        $registerUser = Registration::findOrFail($registrationId);
        $registerUser->fill($request->only([
            'project_name',
            'description',
            'category_id',
            'sub_category_id',
            'file_link',
            'videolink',
            'project_link',
            'termsAccepted',
            'submitDate'
        ]));

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
            'termsAccepted'  => 'required',
        ]);

        $registerUser = Registration::findOrFail($registrationId);
        $registerUser->fill($request->only(['file_link', 'videolink', 'project_link','termsAccepted']));

        $registerUser->save();

        return redirect()->route('participant.dashboard');
    }
}
