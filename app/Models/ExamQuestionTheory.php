<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ExamQuestionTheory extends Model
{
    use HasFactory;

    protected $table = 'exam_theory_question';
    protected $guarded=[];

    protected $dates = ['deleted_at'];
}
