<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Post;

class PostsController extends Controller
{
    // get last 6 posts in home page 
    public function getLastPosts(){
        
<<<<<<< HEAD
        $lastPosts = Post::where('is_published',1)->where('post_type_id', 2)->orderBy('id', 'desc')->take(6)->get();
=======
        //$lastPosts = Post::orderBy('id', 'desc')->take(6)->get();
>>>>>>> d9bac107b88b2841ff5c00436d5aa83ea50e32d7
        //$lastPosts = Post::where('post_type_id', 2)->orderBy('id', 'desc')->take(6)->get();
        $lastPosts = Post::where('is_published',1)->where('post_type_id', 2)->orderBy('id', 'desc')->take(6)->get();
        
        return view('welcome', compact('lastPosts'));
    }
    
}

?>
