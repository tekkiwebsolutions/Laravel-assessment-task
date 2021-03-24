<?php

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

Route::get('/adduser/{id}', 'HomeController@addUser')->name('adduser');
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/home/{id}', 'HomeController@blockUnblockUser')->name('blockUnblockUser');
Route::post('/newUserMail', 'HomeController@sendMailUser');
Route::get('/usershome', 'HomeController@userHome');
Route::post('/adduser/complete_registration', 'HomeController@completeRegistration');
Route::get('/userloginview', 'HomeController@userLogin')->name('userloginview');
Route::post('/userlogin', 'HomeController@userLogin')->name('userlogin');

Route::get('{any}', function () {
    return view('vuehome');
})->where('any','.*');