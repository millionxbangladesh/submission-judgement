<?php

namespace App\Traits;

use App\Models\About;
use App\Models\AppChallengeInfo;
use App\Models\Organizer;
use App\Models\Zone;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

trait CommonQueries
{
    public function getGlobalAchievements()
    {
        return AppChallengeInfo::select(['id', 'title', 'slug', 'session', 'cover'])->withCount([
            'applications',
            'applications as champion_count' => function ($query) {
                $query->where(['position' => 'first', 'is_global' => 1]);
            },
            'applications as merit_count' => function ($query) {
                $query->where('is_global', 1)->whereNotNull('position')
                    ->where('position', '!=', 'first');
            }
        ])
            ->whereHas('applications', function ($query) {
                $query->where('is_global', 1);
            })
            ->orderBy('session', 'desc')
            ->get();
    }

    public function getAbout()
    {
        return About::select('title', 'slug', 'description', 'image')
            ->orderBy('position', 'desc')
            ->first();
    }

    public function getSchedules(): Collection
    {
        return DB::table('program_schedules')
            ->select('id', 'date', 'start_time', 'end_time', 'title', 'description')
            ->orderBy('date', 'asc')
            ->get()
            ->groupBy('date');
    }

    public function getOrganizer()
    {
        return Organizer::select('name', 'designation', 'image','role','email','mobile','fb','linkedin','twitter')
            ->orderBy('position', 'desc')
            ->whereNotIn('type', ['Mentor_1', 'Judge_1'])
            ->where('status', 'active')
            ->get();
    }

    public function getZones()
    {
        return Zone::select('id', 'title')->get();
    }

    public function getLatestChallenge()
    {
        return AppChallengeInfo::select('id', 'session', 'title', 'start_date', 'end_date', 'about')->where('status', 'active')->first();
    }

    public function getCategories()
    {
        return Cache::rememberForever('categories', function () {
            return DB::table('app_challenge_categories')->whereStatus('active')->get();
        });
    }
}
