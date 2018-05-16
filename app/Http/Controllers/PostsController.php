<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Post;

class PostsController extends Controller
{
    // get last 6 posts in home page 
    public function getLastPosts(){
        
<<<<<<< HEAD
        //$lastPosts = Post::orderBy('id', 'desc')->take(6)->get();
        $lastPosts = Post::where('post_type_id', 2)->orderBy('id', 'desc')->take(6)->get();
=======
        $lastPosts = Post::where('is_published',1)->orderBy('id', 'desc')->take(6)->get();
        //$lastPosts = Post::where('post_type_id', 2)->orderBy('id', 'desc')->take(6)->get();
>>>>>>> 7b19271eb686cd0208de1f75af1d78c579bbe69b
        
        return view('welcome', compact('lastPosts'));
    }
    
}
