<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'products';
    protected $guarded = [];

    public function user(){
        return $this->belongsTo('App\Models\User','user_id','id');
    }

    public function category(){
        return $this->belongsTo('App\Models\Category','category_id','id');
    }

    public function state(){
        return $this->belongsTo('App\Models\State','state_id','id');
    }

    public function lga(){
        return $this->belongsTo('App\Models\Lga','lga_id','id');
    }

    public function make(){
        return $this->belongsTo('App\Models\CarMake','make_id','id');
    }

    public function model(){
        return $this->belongsTo('App\Models\CarModel','model_id','id');
    }

    public function messages(){
        return $this->hasMany(Message::class,'product_id','id')->with('user');
    }

    public function trans(){
        return $this->belongsTo(Transmission::class,'transmission_id','id');
    }

    public function trimD(){
        return $this->belongsTo(Trim::class,'trim','id');
    }

    public function color(){
        return $this->belongsTo(Colour::class,'colour','id');
    }

    public function plan(){
        return $this->belongsTo(Plan::class,'plan_id','id');
    }

    public function images(){
        return $this->hasMany(Images::class,'product_id','id');
    }

    public function condition(){
        return $this->hasOne(Condition::class,'id','condition_id');
    }
}
