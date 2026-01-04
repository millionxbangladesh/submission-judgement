<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Zone extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    public function applications()
    {
        return $this->hasMany(Registration::class,'zone_id' ,'code');
    }
}
