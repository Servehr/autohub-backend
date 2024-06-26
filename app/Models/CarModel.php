<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CarModel extends Model
{
    protected $table = 'model';
    protected $guarded=[];

    public function state(){
        return $this->belongsTo('App\Models\CarMake','make_id','id');
    }
}
