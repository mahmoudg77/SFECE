<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Redirect;
use Illuminate\Support\Facades\Route;
use URL;
class LanguageController extends Controller
{
    //
    public function index()
    {
      // $url=URL::previous();
      // $url=str_replace(request()->getSchemeAndHttpHost().'/','',$url);
      //
      // if($url==''){
      //  //  $data['title'] = '404';
      //  // $data['name'] = 'Page not found';
      //  return redirect('/'.app()->getLocale().'/');
      // }
      // if($url==app()->getLocale()){
      //   if($url=="en"){
      //     $url='ar';
      //   }else{
      //     $url='en';
      //   }
      // }else{
      //
      //   if(app()->getLocale()=="en"){
			//  $url=preg_replace('/en\//','ar/',$url);
      //
      //   }else{
      //    $url=preg_replace('/ar\//','en/',$url);
      //
      //   }
      // }
      $url=URL::previous();
      $url=str_replace(request()->getSchemeAndHttpHost().'/','',$url);

      $segments = explode('/', $url);

      $locale = $segments[0];

      // If provided Locale not in Available Locale Array

      if ($locale=='en') {
          $segments[0] = 'ar';
          //return Redirect::to(implode('/', $segments));
      }else{
          $segments[0] = 'en';
          //return Redirect::to(implode('/', $segments));
      }


      // Else, Set Current Locale
      app()->setLocale($segments[0]);
//echo $url;
      //return Redirect::to(implode('/', $segments));

     return redirect(implode('/', $segments));
    }
}
