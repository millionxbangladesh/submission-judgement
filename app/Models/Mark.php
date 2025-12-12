<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Mark extends Model
{
    use HasFactory;
    protected $table = 'marks';
    protected $fillable = [
        'user_id',
        'registration_id',
        'influence',
        'creativity',
        'validity',
        'relevance',
        'presentation',
        'round_influence',
        'round_creativity',
        'round_validity',
        'round_relevance',
        'round_presentation'
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function project(): BelongsTo
    {
        return $this->belongsTo(Registration::class);
    }
}
