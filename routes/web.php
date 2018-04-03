<?php

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
Route::get('/posts','PostsController@index');
Route::get('/posts/edit/{id}','PostsController@edit')->name("Post.edit");
Route::put('/posts/edit/{id}','PostsController@update')->name("Post.update");

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/verifyemail/{token}', 'Auth\RegisterController@verify');


Route::get('/facebook','Auth\RegisterController@redirectToProvider');
Route::get('/facebook-callback','Auth\RegisterController@handleProviderCallback');

Route::get('/twitter','Auth\RegisterController@redirectToProviderTwitter');
Route::get('/twitter-callback','Auth\RegisterController@handleProviderCallbackTwitter');
