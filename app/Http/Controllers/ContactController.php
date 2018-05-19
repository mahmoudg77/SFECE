<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Func;
class ContactController extends Controller
{
    public function index(){
        $page=Func::getPageBySlug('contact-us');
        if($page)
            \App\Models\Visit::log(\App\Models\Post::class,$page->id);
        return view('contactus');
    }
}
