<?php

namespace App\Models;

use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
class Registration extends Authenticatable
{
    use Sluggable, HasFactory;

    /**
     * Return the sluggable configuration array for this model.
     *
     * @return array
     */
    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'team_name'
            ]
        ];
    }

    protected $guarded = ['id'];

    protected $logName = "Registration";

    public function teamMembers()
    {
        return $this->hasMany(TeamMember::class);
    }

    public function appChallengeCategory()
    {
        return $this->belongsTo(AppChallengeCategory::class, 'category_id', 'id');
    }

    public function appChallengeInfo()
    {
        return $this->belongsTo(AppChallengeInfo::class, 'app_challenge_id', 'id');
    }

    public function zone()
    {
        return $this->belongsTo(Zone::class, 'zone_id', 'id');
    }

    public function scopeFilter($query, array $filter)
    {

    }

    public function projectRooms()
    {
        return $this->hasMany(ProjectRoom::class, 'registrations_id');
    }

    public function rooms()
    {
        return $this->belongsToMany(Room::class, 'project_room', 'registrations_id', 'room_id')
                    ->withTimestamps();
    }

    public function marks()
    {
        return $this->hasMany(Mark::class, 'registration_id');
    }
}
