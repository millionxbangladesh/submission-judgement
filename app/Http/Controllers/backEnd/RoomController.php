<?php

namespace App\Http\Controllers\backEnd;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Room;
use App\Models\AppChallengeInfo;
use App\Models\Registration;
use App\Models\ProjectRoom;
use Illuminate\Http\Request;

class RoomController extends Controller
{
    protected $room = 'backEnd.room';

    public function index()
    {
        $rooms = Room::with('judges','volunteers','projects')->paginate(15);
        return view($this->room . '.index', compact('rooms'));
    }

    public function create()
    {
        $volunteers = User::where('role', 3)->where('status', 'active')->get();
        $judges = User::where('role', 4)->where('status', 'active')->get();
        return view($this->room . '.create', compact('volunteers', 'judges'));
    }

    public function edit(Request $request)
    {
        $room = Room::findOrFail($request->id);

        // Get all volunteers and judges
        $volunteers = User::where('role', 3)->where('status', 'active')->get();
        $judges = User::where('role', 4)->where('status', 'active')->get();

        // Get selected user IDs
        $selectedVolunteerIds = $room->users()->wherePivot('role', 'volunteer')->pluck('user_id')->toArray();
        $selectedJudgeIds = $room->users()->wherePivot('role', 'judge')->pluck('user_id')->toArray();

        return view($this->room . '.edit', compact('room', 'volunteers', 'judges', 'selectedVolunteerIds', 'selectedJudgeIds'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'status' => 'required|in:active,inactive',
            'volunteer_id' => 'array',
            'volunteer_id.*' => 'exists:users,id',
            'judge_id' => 'array',
            'judge_id.*' => 'exists:users,id',
        ]);

        // Create the room
        $room = Room::create([
            'name' => $request->name,
            'status' => $request->status,
        ]);

        // Attach volunteers
        if ($request->filled('volunteer_id')) {
            foreach ($request->volunteer_id as $userId) {
                $room->users()->attach($userId, ['role' => 'volunteer']);
            }
        }

        // Attach judges
        if ($request->filled('judge_id')) {
            foreach ($request->judge_id as $userId) {
                $room->users()->attach($userId, ['role' => 'judge']);
            }
        }

        return redirect()->back()->with('success', 'Room created successfully!');
    }

    public function update(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'status' => 'required|in:active,inactive',
            'volunteer_id' => 'array',
            'volunteer_id.*' => 'exists:users,id',
            'judge_id' => 'array',
            'judge_id.*' => 'exists:users,id',
        ]);

        $room = Room::findOrFail($request->id);

        // Update room info
        $room->update([
            'name' => $request->name,
            'status' => $request->status,
        ]);

        // Sync volunteers
        $volunteers = $request->volunteer_id ?? [];
        $room->users()->wherePivot('role', 'volunteer')->detach();
        foreach ($volunteers as $userId) {
            $room->users()->attach($userId, ['role' => 'volunteer']);
        }

        // Sync judges
        $judges = $request->judge_id ?? [];
        $room->users()->wherePivot('role', 'judge')->detach();
        foreach ($judges as $userId) {
            $room->users()->attach($userId, ['role' => 'judge']);
        }

        return redirect()->route('room.index')->with('success', 'Room updated successfully!');
    }

    public function destroy(Request $request)
    {
        $room = Room::findOrFail($request->id);
        $room->delete();
        return response()->json("Room Id " . $request->id . " Successfully Deleted");
    }

    public function createProject(Request $request)
    {
        $AppChallengeInfo = AppChallengeInfo::wherestatus('active')->select('session')->first();
        $projects = Registration::where('session', $AppChallengeInfo->session)->whereDoesntHave('projectRooms')->select('id','team_name','project_name')->get();
        $room = Room::where('id', $request->id)->select('id','name')->first();
        return view($this->room . '.project.create', compact('projects','room'));
    }

    public function storeProject(Request $request)
    {
        $request->validate([
            'room_id' => 'required|exists:rooms,id',
            'project_id' => 'required|array',
            'project_id.*' => 'exists:registrations,id',
        ]);

        $room_id = $request->room_id;
        $project_ids = $request->project_id;

        foreach ($project_ids as $registration_id) {
            ProjectRoom::firstOrCreate([
                'registrations_id' => $registration_id,
                'room_id' => $room_id
            ]);
        }

        return redirect()->route('room.index')->with('success', 'Projects added to room successfully.');
    }

    public function editProject(Request $request)
    {
        $room = Room::select('id','name')->findOrFail($request->id);
        $AppChallengeInfo = AppChallengeInfo::where('status', 'active')->select('session')->first();

        $room_id = $room->id;

        $registrations = Registration::where('session', $AppChallengeInfo->session)
            ->where(function($query) use ($room_id) {
                $query->whereDoesntHave('projectRooms') // not assigned to any room
                    ->orWhereHas('projectRooms', function($q) use ($room_id) {
                        $q->where('room_id', $room_id); // assigned to this room
                    });
            })
            ->select('id', 'team_name', 'project_name')
            ->get();

        $assignedIds = ProjectRoom::where('room_id', $room_id)
            ->pluck('registrations_id')
            ->toArray();

        return view($this->room . '.project.edit', compact('room','registrations','assignedIds'));
    }

    public function updateProject(Request $request)
    {
        $request->validate([
            'room_id' => 'required|exists:rooms,id',
            'project_id' => 'array',
            'project_id.*' => 'exists:registrations,id',
        ]);

        $room_id = $request->room_id;
        $project_ids = $request->project_id ?? [];

        // Remove projects no longer selected
        ProjectRoom::where('room_id', $room_id)
            ->whereNotIn('registrations_id', $project_ids)
            ->delete();

        // Add new projects
        foreach ($project_ids as $registration_id) {
            ProjectRoom::firstOrCreate([
                'room_id' => $room_id,
                'registrations_id' => $registration_id
            ]);
        }

        return redirect()->route('room.index')->with('success', 'Projects updated successfully.');
    }

}
