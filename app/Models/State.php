<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class State extends Model
{
    protected $table = 'states';
    protected $guarded=[];

    public function lgas(){
        return $this->hasMany(Lga::class,'state_id', 'id');
    }
}
