<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Ijinle extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $table = 'ijinles';
    protected $guarded=[];

    protected $dates = ['deleted_at'];

    public function states(){
        return $this->hasMany(State::class,'ijinle_id', 'id');
    }


}
