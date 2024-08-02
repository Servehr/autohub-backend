<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class TestQuestionTheory extends Model
{
    use HasFactory;

    protected $table = 'test_theory_questions';
    protected $guarded=[];

    protected $dates = ['deleted_at'];
}
