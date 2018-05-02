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
    public function getPostBySlug($slug){

        $singlePost= post::where('slug', $slug)->first();
        $lastPosts = Post::orderBy('id', 'desc')->take(4)->get();
        $allcats = Category::all();

        if($singlePost->post_type_id==1){
            return view('single', compact('singlePost', 'lastPosts', 'allcats'));
        }elseif($singlePost->post_type_id==2){
            return view('page', compact('singlePost', 'lastPosts', 'allcats'));
        }

    }
}
