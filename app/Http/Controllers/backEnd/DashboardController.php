<?php

namespace App\Http\Controllers\backEnd;

use App\Http\Controllers\Controller;
use App\Models\AppChallengeCategory;
use App\Models\Registration;
use App\Models\TeamMember;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class DashboardController extends Controller
{
    protected string $dir = 'backEnd';

    public function index()
    {
//        $startDate = Carbon::now()->subDays(7)->startOfDay();
//        $endDate = Carbon::now()->endOfDay();

        $members = Registration::select('id', 'registration_no')->when(session()->exists('summaryYear'), function ($query) {
            $query->whereRaw('SUBSTRING(registration_no, 6, 4) = ?', [session('summaryYear')]);
        })->withCount('teamMembers')->get()->sum('team_members_count');

        $registrations = Registration::when(session()->exists('summaryYear'), function ($query) {
            $query->whereRaw('SUBSTRING(registration_no, 6, 4) = ?', [session('summaryYear')]);
        })->count();


        $data = [
//            'sevenDays'=>Registration::whereBetween('created_at', [$startDate, $endDate])->count(),
            'total' => $registrations,
            'totalMembers' => $members + $registrations
        ];

        return view("{$this->dir}.dashboard", compact('data'));
    }

    public function getCategorySummary(): \Illuminate\Http\JsonResponse
    {
        // Execute raw SQL query with join
//        $categorySummary = DB::select("SELECT c.title, COUNT(r.category_id) as total
//                                FROM registrations r
//                                JOIN app_challenge_categories c ON r.category_id = c.id
//                                GROUP BY r.category_id, c.title
//                                ORDER BY total DESC
//                             ");
        $query = DB::table('registrations as r')
            ->join('app_challenge_categories as c', 'r.category_id', '=', 'c.id')
            ->select('c.title', DB::raw('COUNT(r.category_id) as total'))
            ->groupBy('r.category_id', 'c.title')
            ->orderByDesc('total');
        if (session()->exists('summaryYear')) {
            $query->whereRaw('SUBSTRING(r.registration_no, 6, 4) = ?', [session('summaryYear')]);
        }

        $categorySummary = $query->get()->toArray();
// Prepare data for bar chart
        $data = [
            'labels' => array_column($categorySummary, 'title'),
            'datasets' => [
                [
                    'label' => 'Total',
                    'data' => array_column($categorySummary, 'total'),
                    'backgroundColor' => [
                        '#ff6384', '#36a2eb', '#ffce56', '#4bc0c0', '#9966ff', '#ff9f40'
                    ],
                ],
            ],
        ];
        return response()->json($data);

    }


    public function getYearSummary(): \Illuminate\Http\JsonResponse
    {
        /*  $yearSummary = Registration::select(DB::raw('YEAR(created_at) as year'), DB::raw('count(*) as total'))
              ->groupBy('year')
              ->orderBy('year')
              ->get()->toArray();*/

        $yearSummary = Registration::select(DB::raw('SUBSTRING(registration_no, 6, 4) AS year'), DB::raw('COUNT(*) AS total'))
            ->groupBy('year')
            ->get()->toArray();

        $data = [
            'labels' => array_column($yearSummary, 'year'),
            'datasets' => [
                [
                    'label' => 'Total',
                    'data' => array_column($yearSummary, 'total'),
                    'backgroundColor' => ['#36a2eb', '#ffce56', '#4bc0c0', '#9966ff', '#ff9f40']
                ]
            ]
        ];
        return response()->json($data);
    }

    public function getLocationSummary(): \Illuminate\Http\JsonResponse
    {
        $query = DB::table('registrations as r')
            ->join('zones as c', 'r.zone_id', '=', 'c.id')
            ->select('c.title', DB::raw('COUNT(r.zone_id) as total'))
//            ->whereYear('r.created_at', '=', 2022)
            ->groupBy('r.zone_id', 'c.title')
            ->orderByDesc('total');
        if (session()->exists('summaryYear')) {
            $query->whereRaw('SUBSTRING(r.registration_no, 6, 4) = ?', [session('summaryYear')]);
        }

        $locationSummary = $query->get()->toArray();
        $data = [
            'labels' => array_column($locationSummary, 'title'),
            'datasets' => [
                [
                    'data' => array_column($locationSummary, 'total'),
                    'label' => 'Total',
                    'backgroundColor' => '#f87979',
                ]
            ]
        ];

        return response()->json($data);

    }
}
