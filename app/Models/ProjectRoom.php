<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProjectRoom extends Model
{
    use HasFactory;
    protected $table = 'project_room';

    protected $fillable = ['registrations_id', 'room_id'];

    public function room()
    {
        return $this->belongsTo(Room::class, 'room_id');
    }

    public function registration()
    {
        return $this->belongsTo(Registration::class, 'registrations_id');
    }
}
