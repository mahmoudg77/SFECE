<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Post;

class PostsController extends Controller
{
    // get last 6 posts in home page 
    public function getLastPosts(){
        $lastPosts = Post::orderBy('id', 'desc')->take(6)->get();
        
        return view('welcome', compact('lastPosts'));
    }
    
    public function getPostsByID($id){
        $allPosts = post::where(['category_id', '=', $id], ['post_type_id', '=', 2])->orderBy('id');
        
        return view('page', compact('allPosts'));
    }
}
