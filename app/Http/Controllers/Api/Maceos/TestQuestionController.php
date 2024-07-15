<?php

namespace App\Http\Controllers\Api\Maceos;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Http\Requests\Exam\AddTestQuestionRequest;
use App\Http\Requests\Exam\EditTestQuestionRequest;
use App\Http\Requests\Exam\DeleteTestQuestionRequest;

use App\Models\TestQuestion;
use App\Traits\ResponseTrait;

class TestQuestionController extends Controller
{ 
    use ResponseTrait;   
    //
    public function all_test_question()
    {
        try 
        {
            //code...
            $test_questions = TestQuestion::get();
            return $this->sendSuccess(true, "All tests questions retrieved", $test_questions, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function create_test_question(AddTestQuestionRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();
            $new_test_question = TestQuestion::create($input);          
            return $this->sendSuccess(true, "Exam question successfully created", $new_test_question, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function edit_test_question(EditTestQuestionRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            $name = $input['name'];
            $description = $input['description'];
            TestQuestion::where('id', $id)->update(['name', $name, 'description' => $description]);    
            return $this->sendSuccess(true, "Exam question successfully updated", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function delete_test_question(DeleteTestQuestionRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            TestQuestion::where('id', $id)->update(['deleted_at' => Carbon::now()]);
            return $this->sendSuccess(true, "Exam question successfully deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

}