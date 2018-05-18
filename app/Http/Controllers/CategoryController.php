<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Post;
use App\Models\Category;

class CategoryController extends Controller
{
    public function getPostsByCatID($id){
        
        $allPostsByCat = post::where('category_id', '=', $id)->where('is_published',1)->get();
        $categoryName = category::where('id', $id)->first();
        
        $lastPosts = Post::where('post_type_id', 2)->where('is_published', 1)->orderBy('id', 'desc')->take(4)->get();
        $allcats = Category::where('parent_id', '<>',null)->get();
        return view('category', compact('allPostsByCat', 'categoryName', 'lastPosts', 'allcats'));
    }
    
//    public function getPostsByCatID($slug){
//        
//        $allPostsByCat = post::where('slug', '=', $slug)->get();
//        
//        return view('category', compact('allPostsByCat'));
//    }
}
