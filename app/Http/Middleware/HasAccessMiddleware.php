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
        if(!Auth::user()->allow($ctrl,$action)){
          return redirect('/');
        }

        return $next($request);
    }
}
