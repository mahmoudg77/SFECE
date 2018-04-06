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
Route::resource('/posts','Dashboard\PostController');
Route::resource('/account-level','Dashboard\AccountLevelController');
Route::resource('/post-type','Dashboard\PostTypeController');
Route::resource('/category','Dashboard\CategoryController');
Route::resource('/comment','Dashboard\CommentController');
Route::resource('/file','Dashboard\FileController');
Route::resource('/media-file','Dashboard\MediaFileController');
Route::resource('/tag','Dashboard\TagController');
// Route::get('/posts/edit/{id}','PostsController@edit')->name("Post.edit");
// Route::put('/posts/edit/{id}','PostsController@update')->name("Post.update");

#Auth Routes
Auth::routes();
Route::get('/verifyemail/{token}', 'Auth\RegisterController@verify');

#Socialite Routes
//facebook
Route::get('/facebook','Auth\RegisterController@redirectToProvider');
Route::get('/facebook-callback','Auth\RegisterController@handleProviderCallback');
//twitter
Route::get('/twitter','Auth\RegisterController@redirectToProviderTwitter');
Route::get('/twitter-callback','Auth\RegisterController@handleProviderCallbackTwitter');

#Dashboard Routes
Route::get('/dashboard','Dashboard\DashboardController@index');
