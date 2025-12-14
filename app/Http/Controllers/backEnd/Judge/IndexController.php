<?php

namespace App\Http\Controllers\backEnd\Judge;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Registration;
use App\Models\Mark;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class IndexController extends Controller
{
    protected $room = 'backEnd.project.judge';

    public function index(Request $request)
    {
        $zones = DB::table('zones')->get();
        $userId = auth()->user()->id;
        $projects = Registration::with(['zone:id,title'])->whereHas('rooms.judges', function ($query) use ($userId) {
            $query->where('users.id', $userId);})->when($request->location, function ($query, $location) {
                return $query->where('zone_id', $location);
            })->select('id','registration_no','team_name','zone_id')->paginate(15);
        return view($this->room . '.index', compact('projects','zones'));
    }

    public function view(Request $request)
    {
        $project =Registration::with(['zone:id,title','appChallengeCategory'])->where('id', $request->id)->select('id','registration_no','team_name','project_name','description','file_link','videolink','project_link','zone_id','category_id')->first();
         $mark = Mark::where('user_id', Auth::id())->where('registration_id', $request->id)->first();
        return view($this->room . '.view', compact('project','mark'));
    }


    public function store(Request $request)
    {
        $request->validate([
            'registration_id' => 'required|exists:registrations,id',
            'influence'       => 'required|integer|min:1|max:20',
            'creativity'      => 'required|integer|min:1|max:20',
            'validity'        => 'required|integer|min:1|max:20',
            'relevance'       => 'required|integer|min:1|max:20',
            'presentation'    => 'required|integer|min:1|max:20',
        ]);

        // Collect values and calculate ratio
        $values = [
            'influence' => $request->influence,
            'creativity' => $request->creativity,
            'validity' => $request->validity,
            'relevance' => $request->relevance,
            'presentation' => $request->presentation,
        ];

        // $ratio = max($values) > 0 ? 20 / max($values) : 1;

        // // Calculate rounded values
        // $round_values = array_map(fn($v) => min($v * $ratio, 20), $values);
        // Merge original and rounded values
        $data = array_merge($values, [
            'round_influence'    => 0.00,
            'round_creativity'   => 0.00,
            'round_validity'     => 0.00,
            'round_relevance'    => 0.00,
            'round_presentation' => 0.00,
        ]);

        // Save or update
        Mark::updateOrCreate(['user_id' => Auth::id(),'registration_id' => $request->registration_id,], $data);

        return response()->json(['message' => 'Marks saved successfully!']);
    }


    public function destroy(Request $request)
    {
        $request->validate([
            'registration_id' => 'required|exists:registrations,id',
        ]);

        Mark::where('user_id', Auth::id())
            ->where('registration_id', $request->registration_id)
            ->delete();

        return response()->json(['message' => 'Marks deleted successfully!']);
    }
}
