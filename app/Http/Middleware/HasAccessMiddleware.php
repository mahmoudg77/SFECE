<?php

namespace App\Http\Middleware;

use Closure;
use Route;
use Auth;
class HasAccessMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        $route=Route::current()->action['uses'];
        $ctrl=explode("@",$route)[0];
        $action=explode("@",$route)[1];
        $obj=new $ctrl;
        //dd($obj->methods);
        if(in_array($action,array_keys($obj->postmethods))){
          $action=$obj->postmethods[$action];
        }

        $perm=Auth::user()->allow($ctrl,$action);
        if($perm==null || count($perm)==0){
          return redirect('/');
        }
        //dd($perm);
        //dd(json_encode(Auth::user()));
        $force_filter=$perm[0]->force_filter;

        //$userdata=json_decode(json_encode(Auth::user()));
        $variables=[
          '@user_id'=>Auth::user()->id,
          '@user_name'=>Auth::user()->name,
          '@user_email'=>Auth::user()->email,
          '@user_level'=>Auth::user()->account_level_id,
          '@user_city'=>Auth::user()->city,
          '@user_country'=>Auth::user()->country,
        ];
        $force_filter=str_replace(array_keys($variables),array_values($variables),$force_filter);

        $whr=json_decode($force_filter);


        $request->attributes->add(['force_filter'=>$whr]);
        //dd($whr);
        return $next($request);
    }
}
