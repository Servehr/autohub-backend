<?php

namespace App\Http\Controllers;

use App\Models\GeneralSettings;
use App\Models\Brand;
use App\Models\HomeSlider;
use App\Models\State;
use App\Models\Category;
use App\Models\Product;
// use App\Models\GeneralSettings;
use App\Models\User;
use Livewire\Component;
use Illuminate\Http\Request;
// use Illuminate\Support\Facades\Log;
use Carbon\Carbon;

class FrontendController extends Controller
{
    public function terms(){
        $data['page_title'] = "Terms and Conditions";
        return view('terms', $data);
    }

    // to simulate a test payment
    public function notice(){
        $data['page_title'] = "Terms and Conditions";
        return view('notice', $data);
    }
}
