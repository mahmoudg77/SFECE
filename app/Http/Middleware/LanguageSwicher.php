<?php

namespace App\Http\Middleware;
use Redirect;
use Closure;
use App;
class LanguageSwicher
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
      // Make sure current locale exists.
        $locale = $request->segment(1);

        // If provided Locale not in Available Locale Array
        if ( !in_array($locale, config('translatable.locales'))) {

            $segments = $request->segments();
            $segments[0] = config('app.fallback_locale');

            return Redirect::to(implode('/', $segments));
        }


        // Else, Set Current Locale
        App::setLocale($locale);

        return $next($request);
    }
}
