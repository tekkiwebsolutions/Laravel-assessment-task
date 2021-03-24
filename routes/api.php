<?php

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


// Route::post('/userlogin', 'HomeController@userLogin')->name('userlogin');

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('logins', 'AuthController@login');
Route::group(['middleware' => ['jwt.verify']], function() { 

	Route::post('upload-img', 'AuthController@uploadImg');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');

});
