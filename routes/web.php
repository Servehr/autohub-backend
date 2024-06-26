<?php

use App\Http\Controllers\Auth\AdminAuthController;
use App\Http\Controllers\AdminController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified'
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});

Route::get('/category/{filename}', function ($filename) {
    $path = storage_path('app/public/category/' . $filename);

    if (!File::exists($path)) {
        abort(404);
    }
    $file = File::get($path);
    $type = File::mimeType($path);

    $response = Response::make($file, 200);
    $response->header("Content-Type", $type);
    return $response;
})->name('show.category');

Route::get('/sliders/{filename}', function ($filename) {
    $path = storage_path('app/public/sliders/' . $filename);

    if (!File::exists($path)) {
        abort(404);
    }
    $file = File::get($path);
    $type = File::mimeType($path);

    $response = Response::make($file, 200);
    $response->header("Content-Type", $type);
    return $response;
})->name('show.sliders');

Route::get('/avatar/{filename}', function ($filename) {
    $path = storage_path('app/public/avatar/' . $filename);

    if (!File::exists($path)) {
        abort(404);
    }
    $file = File::get($path);
    $type = File::mimeType($path);

    $response = Response::make($file, 200);
    $response->header("Content-Type", $type);
    return $response;
})->name('show.avatar');

Route::get('/product/{filename}', function ($filename) {
    $path = storage_path('app/public/product/' . $filename);

    if (!File::exists($path)) {
        abort(404);
    }
    $file = File::get($path);
    $type = File::mimeType($path);

    $response = Response::make($file, 200);
    $response->header("Content-Type", $type);
    return $response;
})->name('show.product');


Route::get('/swap/{filename}', function ($filename) {
    $path = storage_path('app/public/swap/' . $filename);

    if (!File::exists($path)) {
        abort(404);
    }
    $file = File::get($path);
    $type = File::mimeType($path);

    $response = Response::make($file, 200);
    $response->header("Content-Type", $type);
    return $response;
})->name('show.swap');



// All Admin Routes Starts Here
Route::get('control/login', [AdminAuthController::class, 'getLogin'])->name('adminLogin');
Route::post('control/login', [AdminAuthController::class, 'postLogin'])->name('adminLoginPost');
Route::get('control/logout', [AdminAuthController::class, 'logout'])->name('adminLogout');

Route::group(['prefix' => 'control','middleware' => 'adminauth'], function () {
	// Admin Dashboard
	Route::get('dashboard', [AdminController::class, 'dashboard'])->name('admin.dashboard');

});
// All Admin Routes Ends Here
