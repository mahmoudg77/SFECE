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
        //$relatedPosts = post::where('category_id', $lastPosts->category_id)->get();
        
        // get the related categories id of the $post
//        $related_category_ids = $singlePost->Category()->pluck('Category.id');

        // get the related post of the categories $related_category_ids
//        $related_posts = Post::whereHas('Category', function ($q) use($related_category_ids) {
//                $q->whereIn('category_id', $related_category_ids)
//            })
//            ->where('id', '<>', $singlePost->id)
//            ->take(3)
//            ->get();

        if($singlePost->post_type_id==1){
            return view('page', compact('singlePost', 'lastPosts', 'allcats'));
        }elseif($singlePost->post_type_id==2){
            return view('single', compact('singlePost', 'lastPosts', 'allcats'));
        }

    }
}
