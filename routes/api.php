<?php

use App\Http\Controllers\Api\FrontendController;
use App\Http\Controllers\Api\DashboardController;
use App\Http\Controllers\Api\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/hook/paylony', [\App\Http\Controllers\PaylonyController::class, 'index']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Front pages
Route::controller(FrontendController::class)->group(function () {
    Route::get('/home', 'index');
    Route::get('/product-details/{slug}', 'productDetails');
    Route::get('/product-options', 'options');
    // Route::get('/reset-password', 'resetPassword');
});

// Auth pages
Route::controller(AuthController::class)->group(function () {
    Route::post('/login', 'login');
    Route::post('/register', 'register');
    Route::post('/forgot-password', 'forgotPassword');
    Route::put('/reset-password', 'resetPassword');
});

// User Area
Route::controller(DashboardController::class)->group(function () {
    Route::post('/dashboard', 'dashboard');
});

include __DIR__ .'/app.php';
