<?php

namespace App\Http\Controllers\Api\Maceos;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Http\Requests\Exam\AddTestQuestionaireRequest;
use App\Http\Requests\Exam\EditTestQuestionaireRequest;
use App\Http\Requests\Exam\DeleteTestQuestionaireRequest;

use App\Models\TestQuestionaire;
use App\Traits\ResponseTrait;

class TestQuestionaireController extends Controller
{   
    use ResponseTrait; 
    //
    public function all_test_questionaire()
    {
        try 
        {
            //code...
            $test_questionaires = TestQuestionaire::get();
            return $this->sendSuccess(true, "All tests questionaireaire retrieved", $test_questionaires, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function create_test_questionaire(AddTestQuestionaireRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();
            $new_test_questionaire = TestQuestionaire::create($input);          
            return $this->sendSuccess(true, "Exam questionaire successfully created", $new_test_questionaire, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function edit_test_questionaire(EditTestQuestionaireRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            $name = $input['name'];
            $description = $input['description'];
            TestQuestionaire::where('id', $id)->update(['name', $name, 'description' => $description]);    
            return $this->sendSuccess(true, "Exam questionaire successfully updated", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function delete_test_questionaire(DeleteTestQuestionaireRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            TestQuestionaire::where('id', $id)->update(['deleted_at' => Carbon::now()]);
            return $this->sendSuccess(true, "Exam questionaire successfully deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

}
