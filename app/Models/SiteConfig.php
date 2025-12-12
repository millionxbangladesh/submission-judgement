<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SiteConfig extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'short_title',
        'web',
        'logo',
        'favicon',
        'address',
        'venue',
        'email',
        'mobile',
        'maps',
        'social_fb',
        'social_ig',
        'social_linkedin',
        'social_youtube',
        'social_twitter',
        'copyright',
        'deadline',
        'start_date',
        'video30sstart_date',
        'video30send_date',
        'video240sstart_date',
        'video240send_date',
        'projectlinkstart_date',
        'projectlinkend_date',
    ];
}
