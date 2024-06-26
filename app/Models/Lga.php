<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Lga extends Model
{
    protected $table = 'local_governments';
    protected $guarded=[];

    public function state(){
        return $this->belongsTo('App\Models\State','state_id','id');
    }
}
