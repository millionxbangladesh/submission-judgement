<?php

namespace App\Http\Controllers\backEnd\Volunteer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Registration;
use Illuminate\Support\Facades\DB;

class VolunteerController extends Controller
{
    protected $room = 'backEnd.project.volunteer';

    public function index(Request $request)
    {
        $zones = DB::table('zones')->get();
        $userId = auth()->user()->id;
        $projects = Registration::with(['zone:id,title'])->whereHas('rooms.volunteers', function ($query) use ($userId) {
            $query->where('users.id', $userId);})->when($request->location, function ($query, $location) {
                return $query->where('zone_id', $location);
            })->select('id','registration_no','team_name','zone_id')->paginate(15);
        return view($this->room . '.index', compact('projects','zones'));
    }

    public function view(Request $request)
    {
        $project =Registration::with(['zone:id,title'])->where('id', $request->id)->select('id','registration_no','team_name','project_name','description','video30s','video240s','project_link','zone_id','category_id')->first();
        return view($this->room . '.view', compact('project'));
    }
}
