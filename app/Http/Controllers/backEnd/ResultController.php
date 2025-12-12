<?php

namespace App\Http\Controllers\backEnd;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Registration;
use Illuminate\Support\Facades\DB;
use App\Exports\ResultExport;
use App\Models\Mark;
use Maatwebsite\Excel\Facades\Excel;

class ResultController extends Controller
{
    protected $result = 'backEnd.result';

    public function index(Request $request)
    {
        $teams = Registration::with(['zone:id,title'])->when($request->location, function ($query, $location) {
                return $query->where('zone_id', $location);
            })->where('session', 2025)->whereNotNull('final_score')->orderBy('final_score', 'desc')->paginate(15);

        $zones = DB::table('zones')->select('id', 'title')->get();
        return view($this->result . '.index', compact('teams', 'zones'));
    }

    public function result(Request $request)
    {
        $teams = Registration::with(['zone:id,title'])->when($request->location, function ($query, $location) {
                return $query->where('zone_id', $location);
            })->where('session', 2025)->whereNotNull('final_score')->orderBy('final_score', 'desc')->paginate(15);

        $zones = DB::table('zones')->select('id', 'title')->get();
        return view($this->result . '.result', compact('teams', 'zones'));
    }

    public function show(Request $request)
    {
        $app = Registration::with('appChallengeCategory:id,title', 'zone')->findOrFail($request->id);
        return view($this->result . '.show', compact('app'));
    }

    public function processFinalScores(Request $request)
    {
        // STEP 1: Normalize marks per judge in chunks
        Mark::chunk(1000, function ($judges) {

            // Group by user_id to calculate max scores per judge
            $maxScores = $judges->groupBy('user_id')->map(function ($group) {
                return [
                    'max_influence'    => $group->max('influence'),
                    'max_creativity'   => $group->max('creativity'),
                    'max_validity'     => $group->max('validity'),
                    'max_relevance'    => $group->max('relevance'),
                    'max_presentation' => $group->max('presentation'),
                ];
            });

            // Prepare batch updates
            $updates = [];
            foreach ($maxScores as $userId => $max) {
                $ratios = [
                    'influence'    => $max['max_influence']    > 0 ? 10 / $max['max_influence']    : 0,
                    'creativity'   => $max['max_creativity']   > 0 ? 10 / $max['max_creativity']   : 0,
                    'validity'     => $max['max_validity']     > 0 ? 10 / $max['max_validity']     : 0,
                    'relevance'    => $max['max_relevance']    > 0 ? 10 / $max['max_relevance']    : 0,
                    'presentation' => $max['max_presentation'] > 0 ? 10 / $max['max_presentation'] : 0,
                ];

                foreach ($judges->where('user_id', $userId) as $mark) {
                    $updates[] = [
                        'id'                => $mark->id,
                        'round_influence'   => $mark->influence    * $ratios['influence'],
                        'round_creativity'  => $mark->creativity   * $ratios['creativity'],
                        'round_validity'    => $mark->validity     * $ratios['validity'],
                        'round_relevance'   => $mark->relevance    * $ratios['relevance'],
                        'round_presentation'=> $mark->presentation * $ratios['presentation'],
                        'updated_at'        => now(),
                    ];
                }
            }

            // Batch update existing rows only
            foreach (array_chunk($updates, 500) as $chunk) {
                foreach ($chunk as $u) {
                    Mark::where('id', $u['id'])->update($u);
                }
            }
        });

        // STEP 2: Calculate final scores for teams in chunks
        Registration::with('marks')->where('session', 2025)->chunk(500, function ($teams) {
            $updates = [];

            foreach ($teams as $team) {
                $marks = $team->marks;
                $judgeCount = $marks->count();

                if ($judgeCount > 0) {
                    $averages = [
                        'influence'    => $marks->avg('round_influence'),
                        'creativity'   => $marks->avg('round_creativity'),
                        'validity'     => $marks->avg('round_validity'),
                        'relevance'    => $marks->avg('round_relevance'),
                        'presentation' => $marks->avg('round_presentation'),
                    ];

                    $finalScore = array_sum($averages);
                    $finalScore += (float) $team->team_work_score;
                    $finalScore += (float) $team->user_experience_score;
                    $finalScore += (float) $team->is_nasa_data_usage_score;
                    $finalScore += (float) $team->is_challenge_category_score;
                    $finalScore += (float) $team->id_project_link_score;
                    $finalScore += (float) $team->is_nasa_global_team_url_score;

                    // 5% bonus if female members
                    if ($team->is_female_members == 'yes') {
                        $finalScore += ($finalScore * 5) / 100;
                    }

                    $updates[] = [
                        'id'          => $team->id,
                        'final_score' => round($finalScore, 2),
                    ];
                } else {
                    $updates[] = [
                        'id'          => $team->id,
                        'final_score' => null,
                    ];
                }
            }

            // Batch update teams
            foreach (array_chunk($updates, 200) as $chunk) {
                foreach ($chunk as $u) {
                    Registration::where('id', $u['id'])->update($u);
                }
            }
        });

        return redirect()->route('result.index')->with('success', 'Final scores have been calculated and updated successfully!');
    }

    public function excelExport(Request $request)
    {
        $registrations = Registration::with('teamMembers')->when($request->location, function ($query, $location) {
                return $query->where('zone_id', $location);
            })
            ->where('session', 2025)
            ->orderBy('final_score', 'desc')
            ->first();
        return Excel::download(new ResultExport($registrations), 'results.xlsx');
    }


}
