<?php
define('CP_URL', '/dashboard');
if(request()->lang <> ''){
           app()->setLocale(request()->lang);
  }


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



Route::get('/{lang?}', function ($lang='') {

  if($lang ==''){
             return redirect('/en');
    }
    return view('welcome');
});

Route::group(['prefix'=>CP_URL, 'middleware'=>'auth'],function(){
  Route::resource('/posts','Dashboard\PostController',['as'=>'cp']);
  Route::resource('/account-level','Dashboard\AccountLevelController',['as'=>'cp']);
  Route::resource('/post-type','Dashboard\PostTypeController',['as'=>'cp']);
  Route::resource('/category','Dashboard\CategoryController',['as'=>'cp']);
  Route::resource('/comment','Dashboard\CommentController',['as'=>'cp']);
  Route::resource('/file','Dashboard\FileController',['as'=>'cp']);
  Route::resource('/media-file','Dashboard\MediaFileController',['as'=>'cp']);
  Route::resource('/tag','Dashboard\TagController',['as'=>'cp']);
  Route::resource('/user','Dashboard\UserController',['as'=>'cp']);
  Route::resource('/menu','Dashboard\MenuController',['as'=>'cp']);
});



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
