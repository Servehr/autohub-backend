<?php

namespace App\Http\Controllers\Api\Maceos;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;

use App\Http\Requests\Test\AddTestQuestionRequest;
use App\Http\Requests\Test\EditTestQuestionRequest;

use App\Models\TestQuestion;
use App\Models\Option;
use App\Models\TestQuestionTheory;

use App\Traits\ResponseTrait;


class TestQuestionController extends Controller
{ 
    use ResponseTrait;   
    //objective
    public function all_test_question($id)
    {
        try 
        {
            //code...
            $test_questions = TestQuestion::select(['test_questions.question_id', 'test_questions.test_questionaire_id', 'options.question',  'options.deleted_at', 'options.id', 'options.option_a', 'options.option_b', 'options.option_c', 'options.option_c', 'options.option_d', 'answer'])
            ->join('options', 'options.id', '=', 'test_questions.question_id')
            ->where('test_questions.test_questionaire_id', '=', $id)
            ->where('options.deleted_at', '=', NULL)
            ->orderBy('options.id', 'DESC')
            ->get();
            // $test_questions = TestQuestion::select(['test_questions.question_id', 'test_questions.test_questionaire_id', 'options.question', 'options.id', 'options.option_a', 'options.option_b', 'options.option_c', 'options.option_c', 'options.option_d', 'answer'])
            //       ->join('options', 'options.id', '=', 'test_questions.question_id')
            //       ->where('test_questions.test_questionaire_id', '=', $id)
            //       ->get();

            return $this->sendSuccess(true, "All tests questions retrieved", $test_questions, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function create_test_question(Request $request)
    {
        try 
        {
            //code...
            $input = $request->all();
            $opt['question'] = $input['question'];
            $opt['option_a'] = $input['option_a'];
            $opt['option_b'] = $input['option_b'];
            $opt['option_c'] = $input['option_c'];
            $opt['option_d'] = $input['option_d'];
            $opt['answer'] = $input['answer'];
            $option = Option::create($opt);
            // return $this->sendSuccess(true, "Test question successfully created", $option, "");

            $test['test_questionaire_id'] = $input['test_questionaire_id'];
            $test['question_id'] = $option->id;

            $new_test_question = TestQuestion::create($test);   

            return $this->sendSuccess(true, "Test question successfully created", $new_test_question, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function edit_test_question(Request $request)
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
            // return $this->sendSuccess(true, "Test question successfully created", $input, "");
           Option::where('id', $id)->update(['question' => $question, 'option_a' => $option_a, 'option_b' => $option_b, 'option_c' => $option_c, 'option_d' => $option_d, 'answer' => $answer]);    
            return $this->sendSuccess(true, "Test question successfully updated", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function delete_test_question($id)
    {
        // return $this->sendSuccess(true, "Test question successfully deleted", (int)$id, "£");
        try 
        {
            //code...
            $theId = (int)$id;
            TestQuestion::where('question_id', $theId)->update(['deleted_at' => Carbon::now()]);
            Option::where('id', $theId)->update(['deleted_at' => Carbon::now()]);
            return $this->sendSuccess(true, "Test question successfully deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function test_questions()
    {
        try 
        {
            //code...
            $test_questions = Option::select(['options.question', 'options.id', 'options.option_a', 'options.option_b', 'options.option_c', 'options.option_d', 'answer'])
            ->where('options.deleted_at', '=', NULL)
            ->orderBy('options.id', 'ASC')
            ->get();
            return $this->sendSuccess(true, "All tests questions retrieved", $test_questions, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    //theory 
    public function all_test_theory_question($id)
    {
        try 
        {
            //code...
            // $test_theory_questions = TestQuestionTheory::select(['test_questions.question_id', 'test_questions.test_questionaire_id', 'options.question',  'options.deleted_at', 'options.id', 'options.option_a', 'options.option_b', 'options.option_c', 'options.option_c', 'options.option_d', 'answer'])
            // ->join('options', 'options.id', '=', 'test_questions.question_id')
            // ->where('test_questions.test_questionaire_id', '=', $id)
            // ->where('options.deleted_at', '=', NULL)
            // ->orderBy('options.id', 'DESC')
            // ->get();
            $test_theory_questions = TestQuestionTheory::where('test_theory_id', $id)->whereNull('deleted_at')->OrderBy('id', 'DESC')->get();
            return $this->sendSuccess(true, "All tests questions retrieved", $test_theory_questions, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function create_test_questions_theory(Request $request)
    {
        // return $this->sendSuccess(true, "Test theory question successfully created", $request->all(), "");
        try 
        {
            //code...
            $input = $request->all();
            $new_test_theory_question = TestQuestionTheory::create($input); 
            return $this->sendSuccess(true, "Test theory question successfully created", $new_test_theory_question, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function edit_test_theory_question(Request $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            $question = $input['question'];
            TestQuestionTheory::where('id', $id)->update(['question' => $question ]);    
            return $this->sendSuccess(true, "Test theory question successfully updated", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function delete_test_theory_question($id)
    {
        // return $this->sendSuccess(true, "Test question successfully deleted", (int)$id, "£");
        try 
        {
            //code...
            $theId = (int)$id;
            TestQuestionTheory::where('id', $id)->update(['deleted_at' => Carbon::now()]);
            return $this->sendSuccess(true, "Test theory question successfully deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function test_theory_questions()
    {
        try 
        {
            //code...
            $test_questions = Option::select(['options.question', 'options.id', 'options.option_a', 'options.option_b', 'options.option_c', 'options.option_d', 'answer'])
            ->where('options.deleted_at', '=', NULL)
            ->orderBy('options.id', 'ASC')
            ->get();
            return $this->sendSuccess(true, "All tests questions retrieved", $test_questions, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }
    

}