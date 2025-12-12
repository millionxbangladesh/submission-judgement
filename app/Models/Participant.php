<?php

namespace App\Models;

use App\Notifications\ParticipantResetPasswordNotification;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Participant extends Authenticatable
{
    use  Notifiable;
    protected $table = 'participants'; // optional if following convention

    protected $fillable = [
        'email',
        'password',
        'registration_id',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    // Relationship to registration (if needed)
    public function registration()
    {
        return $this->belongsTo(Registration::class, 'registration_id');
    }

    public function sendPasswordResetNotification($token)
    {
        $this->notify(new ParticipantResetPasswordNotification($token));
    }
}
