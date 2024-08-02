<?php

namespace App\Http\Controllers\Api\Maceos;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;

use App\Http\Requests\Exam\AddExamQuestionRequest;
use App\Http\Requests\Exam\EditExamQuestionRequest;
use App\Http\Requests\Exam\DeleteExamQuestionRequest;

use App\Models\ExamQuestion;
use App\Models\ExamOption;
use App\Models\ExamQuestionTheory;
use App\Traits\ResponseTrait;

class ExamQuestionController extends Controller
{   
    use ResponseTrait;   
    
    // objective

    public function all_exam_question($id)
    {
        try 
        {
            //code...
            $exam_questions = ExamQuestion::select(['exam_questions.question_id', 'exam_questions.exam_questionaire_id', 'exam_options.question',  'exam_options.deleted_at', 'exam_options.id', 'exam_options.option_a', 'exam_options.option_b', 'exam_options.option_c', 'exam_options.option_c', 'exam_options.option_d', 'answer'])
            ->join('exam_options', 'exam_options.id', '=', 'exam_questions.question_id')
            ->where('exam_questions.exam_questionaire_id', '=', $id)
            ->where('exam_options.deleted_at', '=', NULL)
            ->orderBy('exam_options.id', 'DESC')
            ->get();
            // $exam_questions = ExamQuestion::select(['exam_questions.question_id', 'exam_questions.exam_questionaire_id', 'options.question', 'options.id', 'options.option_a', 'options.option_b', 'options.option_c', 'options.option_c', 'options.option_d', 'answer'])
            //       ->join('options', 'options.id', '=', 'exam_questions.question_id')
            //       ->where('exam_questions.exam_questionaire_id', '=', $id)
            //       ->get();

            return $this->sendSuccess(true, "All exams questions retrieved", $exam_questions, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function create_exam_question(Request $request)
    {
            // return $this->sendSuccess(true, "Exam question successfully created", $request->all(), "");
        // try 
        // {
        //     //code...
            $input = $request->all();
            $opt['question'] = $input['question'];
            $opt['option_a'] = $input['option_a'];
            $opt['option_b'] = $input['option_b'];
            $opt['option_c'] = $input['option_c'];
            $opt['option_d'] = $input['option_d'];
            $opt['answer'] = $input['answer'];
            $option = ExamOption::create($opt);

            $exam['exam_questionaire_id'] = $input['exam_questionaire_id'];
            $exam['question_id'] = $option->id;

            $new_exam_question = ExamQuestion::create($exam);   
            return $this->sendSuccess(true, "Exam question successfully created", $new_exam_question, "");
        // } catch (\Throwable $th) {
        //     return $this->sendError('', $th, 500);
        // }
    }

    public function edit_exam_question(Request $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            $question = $input['question'];
            $option_a = $input['option_a'];
            $option_b = $input['option_b'];
            $option_c = $input['option_c'];
            $option_d = $input['option_d'];
            $answer = $input['answer'];
            // return $this->sendSuccess(true, "Exam question successfully created", $input, "");
            ExamOption::where('id', $id)->update(['question' => $question, 'option_a' => $option_a, 'option_b' => $option_b, 'option_c' => $option_c, 'option_d' => $option_d, 'answer' => $answer]);    
            return $this->sendSuccess(true, "Exam question successfully updated", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function delete_exam_question($id)
    {
        try 
        {
            //code...    
            ExamOption::where('id', $id)->update(['deleted_at' => Carbon::now()]);
            return $this->sendSuccess(true, "Exam question successfully deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function test_questions()
    {
        try 
        {
            //code...
            $exam_questions = Option::select(['options.question', 'options.id', 'options.option_a', 'options.option_b', 'options.option_c', 'options.option_d', 'answer'])
            ->where('options.deleted_at', '=', NULL)
            ->orderBy('options.id', 'ASC')
            ->get();
            return $this->sendSuccess(true, "All tests questions retrieved", $exam_questions, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    // theory
    public function all_exam_questionaire_theory($id)
    {
        try 
        {
            //code...
            // $test_theory_questions = ExamQuestionTheory::select(['test_questions.question_id', 'test_questions.test_questionaire_id', 'options.question',  'options.deleted_at', 'options.id', 'options.option_a', 'options.option_b', 'options.option_c', 'options.option_c', 'options.option_d', 'answer'])
            // ->join('options', 'options.id', '=', 'test_questions.question_id')
            // ->where('test_questions.test_questionaire_id', '=', $id)
            // ->where('options.deleted_at', '=', NULL)
            // ->orderBy('options.id', 'DESC')
            // ->get();
            $exam_theory_questions = ExamQuestionTheory::where('exam_questionaire_id', $id)->whereNull('deleted_at')->OrderBy('id', 'DESC')->get();
            return $this->sendSuccess(true, "All exam questions retrieved", $exam_theory_questions, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function create_exam_questions_theory(Request $request)
    {
        // return $this->sendSuccess(true, "Exam theory question successfully created", $request->all(), "");
        // try 
        // {
            //code...
            $input = $request->all();
            $new_exam_theory_question = ExamQuestionTheory::create($input); 
            return $this->sendSuccess(true, "Exam theory question successfully created", $new_exam_theory_question, "");
        // } catch (\Throwable $th) {
        //     return $this->sendError('', $th, 500);
        // }
    }

    public function edit_exam_theory_question(Request $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            $question = $input['question'];
            ExamQuestionTheory::where('id', $id)->update(['question' => $question ]);    
            return $this->sendSuccess(true, "Exam theory question successfully updated", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function delete_test_theory_question($id)
    {
        // return $this->sendSuccess(true, "Exam question successfully deleted", (int)$id, "£");
        try 
        {
            //code...
            $theId = (int)$id;
            ExamQuestionTheory::where('id', $id)->update(['deleted_at' => Carbon::now()]);
            return $this->sendSuccess(true, "Exam theory question successfully deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function exam_theory_questions()
    {
        try 
        {
            //code...
            $test_questions = Option::select(['options.question', 'options.id', 'options.option_a', 'options.option_b', 'options.option_c', 'options.option_d', 'answer'])
            ->where('options.deleted_at', '=', NULL)
            ->orderBy('options.id', 'ASC')
            ->get();
            return $this->sendSuccess(true, "All exam questions retrieved", $test_questions, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }
    
}

