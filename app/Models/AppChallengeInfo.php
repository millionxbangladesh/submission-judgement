<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class AppChallengeInfo extends Model
{
    use HasFactory;
    protected $guarded = ['id'];

    protected $logName = "AppChallengeInfo";

    public function getRouteKeyName() {
        return 'slug';
    }

    protected static function boot() {
        parent::boot();
        static::creating( function ( $url ) {
            $url->slug = AppChallengeInfo::createSlug( $url->title );
        } );
    }
    private static function createSlug( $name ) {
        $slug  = Str::slug( $name );
        $count = AppChallengeInfo::where( ['slug' => $slug] )->count();
        if ( $count > 0 ) {
            $slug = $slug . $count;
        }
        return $slug;
    }

    public function applications()
    {
        return $this->hasMany(Registration::class,'app_challenge_id','id');
    }
}
