<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'total_mark',
        'status',
    ];

    // Users in this room
    public function users()
    {
        return $this->belongsToMany(User::class, 'room_user')
            ->withPivot('role')
            ->withTimestamps();
    }

    // Only judges in this room
    public function judges()
    {
        return $this->users()->wherePivot('role', 'judge');
    }

    // Only volunteers in this room
    public function volunteers()
    {
        return $this->users()->wherePivot('role', 'volunteer');
    }
    // Projects assigned to this room
    public function projects()
    {
        return $this->hasMany(ProjectRoom::class, 'room_id');
    }

    public function registrations()
    {
        return $this->belongsToMany(Registration::class, 'project_room', 'room_id', 'registrations_id')
                    ->withTimestamps();
    }

}
