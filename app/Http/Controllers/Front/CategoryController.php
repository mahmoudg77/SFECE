<?php

namespace App\Http\Controllers\Front;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Post;
use App\Models\Category;

class CategoryController extends Controller
{
//    public function getPostsByCatID($id){
//        
//        $allPostsByCat = post::where('category_id', '=', $id)->where('is_published',1)->where('post_type_id', 2)->get();
//        $category = category::where('id', $id)->first();
//        $categoryName= $category->title;
//        $categoryDesc = $category->description;
//        
//        $lastPosts = Post::where('post_type_id', 2)->where('is_published', 1)->orderBy('id', 'desc')->take(4)->get();
//        $allcats = Category::where('parent_id', '<>',null)->get();
//
//        \App\Models\Visit::log(\App\Models\Category::class,$category->id);
//
//        return view('category', compact('allPostsByCat', 'categoryName', 'categoryDesc', 'lastPosts', 'allcats'));
//    }
    
    public function getPostsByCatSlug($slug){
        
        $categories = \App\Models\Category::where('slug', $slug)->first();
        
        $allPostsByCat = $categories->Posts()->where('is_published',1)->where('post_type_id', 2)->get();
        if(!$allPostsByCat){
            return response(view('errors.404'),404);
        }
        
        $categoryName= $categories->title;
        $categoryDesc = $categories->description;
        
        $lastPosts = Post::where('post_type_id', 2)->where('is_published', 1)->orderBy('id', 'desc')->take(4)->get();
        $allcats = Category::where('parent_id', '<>',null)->get();

        \App\Models\Visit::log(\App\Models\Category::class,$categories->id);

        return view('category', compact('allPostsByCat', 'categoryName', 'categories', 'lastPosts', 'allcats'));
    }


    public function getPostsByTag($tag){

        $tagobj=\App\Models\Tag::where('name',$tag)->first();
        if(!$tagobj){
            return response(view('errors.404'),404);
        }

        $allPostsByCat =$tagobj->Posts()->orderBy('id','desc')->get();
        
        $categoryName =$tag;

        $lastPosts = Post::where('post_type_id', 2)->where('is_published', 1)->orderBy('id', 'desc')->take(4)->get();
        $allcats = Category::where('parent_id', '<>',null)->get();

        \App\Models\Visit::log(\App\Models\Tag::class,$tagobj->id);

        return view('category', compact('allPostsByCat', 'categoryName', 'lastPosts', 'allcats'));

    }
}
