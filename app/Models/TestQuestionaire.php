<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class TestQuestionaire extends Model
{
    use HasFactory;

    protected $table = 'test_questionaires';
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
