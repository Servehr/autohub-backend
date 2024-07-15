<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Asked extends Model
{
    use HasFactory;

    protected $table = 'asked';
    protected $guarded=[];

    protected $dates = ['deleted_at'];

}


// companyName
// companyAddress
// specialization
// yearsIn
// region
// city
// birth
// gender
// academic
