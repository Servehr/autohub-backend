<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Country extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $table = 'countries';
    protected $guarded=[];

    protected $dates = ['deleted_at'];

    public function states(){
        return $this->hasMany(State::class,'country_id', 'id');
    }


}
