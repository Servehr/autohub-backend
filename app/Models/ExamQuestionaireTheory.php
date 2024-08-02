<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ExamQuestionaireTheory extends Model
{
    use HasFactory;

    protected $table = 'exam_theories';
    protected $guarded=[];

    protected $dates = ['deleted_at'];
}
