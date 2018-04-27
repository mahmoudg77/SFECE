<?php
define('CP_URL', '/dashboard');

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

if (in_array(Request::segment(1), ['ar','en'])) {
    App::setLocale(Request::segment(1));
 }else{
   App::setLocale('en');
 }

Route::group(['prefix' => app()->getLocale()], function()
{
  Route::get('/', function () {
      return view('welcome');
  });//->where('lang', '[ar|en]');

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
    Route::resource('/menu-link','Dashboard\MenuLinkController',['as'=>'cp']);
  });

});
Route::get('/', function () {
    return redirect('/ar');
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
