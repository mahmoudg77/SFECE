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
        if(!Auth::user()->allow($ctrl,$action)){
          return redirect('/');
        }
        return $next($request);
    }
}
