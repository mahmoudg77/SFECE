<?php
define('CP_URL', 'dashboard');

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

if (in_array(Request::segment(1), config('translatable.locales'))) {
   App::setLocale(Request::segment(1));
 }else{
   App::setLocale('ar');
 }
 
/*Route::get('/', function () {
    return redirect('/ar');
});*/

Route::group(['prefix' => app()->getLocale(),'middleware'=>'LanguageSwicher'], function()
{

    Route::get('/','PostsController@getLastPosts');	
    Route::get('/page/{id}','PostsController@getPostsByID');	
//  Route::get('/', function () {
//      return view('welcome');
//  });
  
  
  Route::get('/lang','LanguageController@index')->name('swichlang');

  Route::group(['prefix'=>CP_URL, 'middleware'=>'auth'],function(){
    #Dashboard Routes
    Route::get('/','Dashboard\DashboardController@index')->name('cp.dashboard');
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


	// Authentication Routes...
	Route::get('/login', 'Auth\LoginController@showLoginForm')->name('login');
	Route::post('/login', 'Auth\LoginController@login');
	Route::post('/logout', 'Auth\LoginController@logout')->name('logout');

	// Registration Routes...
	Route::get('/register', 'Auth\RegisterController@showRegistrationForm')->name('register');
	Route::post('/register', 'Auth\RegisterController@register');

	// Password Reset Routes...
	Route::get('/password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
	Route::post('/password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
	Route::get('/password/reset/{token}', 'Auth\ResetPasswordController@showResetForm');
	Route::post('/password/reset', 'Auth\ResetPasswordController@reset')->name('password.reset');

	
	Route::get('/verifyemail/{token}', 'Auth\RegisterController@verify')->name('email.verify');

	#Socialite Routes
	//facebook
	Route::get('/facebook','Auth\RegisterController@redirectToProvider')->name('fp.register');
	Route::get('/facebook-callback','Auth\RegisterController@handleProviderCallback')->name('fp.callback');
	//twitter
	Route::get('/twitter','Auth\RegisterController@redirectToProviderTwitter')->name('tw.register');
	Route::get('/twitter-callback','Auth\RegisterController@handleProviderCallbackTwitter')->name('tw.callback');



});




// Route::get('/posts/edit/{id}','PostsController@edit')->name("Post.edit");
// Route::put('/posts/edit/{id}','PostsController@update')->name("Post.update");

#Auth Routes
//Auth::routes();



