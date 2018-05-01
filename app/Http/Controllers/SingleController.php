<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Post;
use App\Models\Category;

class SingleController extends Controller
{
    public function getPostByID($id){
        $singlePost= post::where('id', '=', $id)->first();
        $lastPosts = Post::orderBy('id', 'desc')->take(4)->get();
        $allcats = Category::all();
        
        
        return view('single', compact('singlePost', 'lastPosts', 'allcats'));
    }
}
