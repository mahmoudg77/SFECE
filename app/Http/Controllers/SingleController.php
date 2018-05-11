<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Post;
use App\Models\Category;

class SingleController extends Controller
{
    public function getPostByID($id){
        $singlePost= post::where('id', '=', $id)->first();
        if(!$singlePost){
            return view('errors.404');
        }
        $lastPosts = Post::orderBy('id', 'desc')->take(4)->get();

        $allcats = Category::all();
        
        return view('single', compact('singlePost', 'lastPosts', 'allcats'));
    }
    
    public function getPostBySlug($slug){

        $singlePost= post::where('slug', $slug)->first();
        if(!$singlePost){
            return view('errors.404');
        }
        $lastPosts = Post::orderBy('id', 'desc')->take(4)->get();
        $allcats = Category::all();
        
        
        $related_posts = Post::where('id', '!=', $singlePost->id)
            ->where('category_id', '=', $singlePost->category_id)->take(3)->get();
        
        if($singlePost->post_type_id==1){
            return view('page', compact('singlePost', 'lastPosts', 'allcats'));
        }elseif($singlePost->post_type_id==2){
            return view('single', compact('singlePost', 'lastPosts', 'allcats', 'related_posts'));
        }

    }
    
    public function getSidebar(){
        $lastPosts = Post::orderBy('id', 'desc')->take(4)->get();
        $allcats = Category::all();
        
        return view('sidebar', compact('lastPosts', 'allcats'));
    }
}
