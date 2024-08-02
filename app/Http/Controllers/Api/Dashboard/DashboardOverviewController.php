<?php

namespace App\Http\Controllers\Api\Dashboard;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;

use App\Traits\ResponseTrait;


class DashboardOverviewController extends Controller
{
    //
    use ResponseTrait; 

    public function overview()
    {        
        try 
        {
            //code...
            // $exams_questionaire = ExamQuestionaire::get();
            
            $overview = collect(
                [
                    ['title' => 'Users', 'figures' => 4, 'icon' => 'sellers'],
                    ['title' => 'Managers', 'figures' => 2, 'icon' => 'managers'],
                    ['title' => 'Staff', 'figures' => 8, 'icon' => 'user'],
                    ['title' => 'Dealers', 'figures' => 120, 'icon' => 'user'],
                    ['title' => 'Transactions', 'figures' => 4, 'icon' => 'finance'],
                    ['title' => 'Ads', 'figures' => 400, 'icon' => 'products'],
                    ['title' => 'Sold', 'figures' => 4, 'icon' => 'requests'],
                    ['title' => 'On-Sales', 'figures' => 410, 'icon' => 'expenses'],
                    ['title' => 'Pending', 'figures' => 3573, 'icon' => 'visitors'],
                    ['title' => 'Expenses', 'figures' => 573, 'icon' => 'ads'],
                    ['title' => 'Request', 'figures' => 24, 'icon' => 'sellers'],
                    ['title' => 'Courses', 'figures' => 9, 'icon' => 'comment']
                ]
            );
            return $this->sendSuccess(true, "overviews", $overview, "");
            
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

}
