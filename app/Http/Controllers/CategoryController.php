<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Post;
use App\Models\Category;

class CategoryController extends Controller
{
    public function getPostsByCatID($id){
        
        $allPostsByCat = post::where('category_id', '=', $id)->get();
        $categoryName = category::where('id', $id)->first();
        
        return view('category', compact('allPostsByCat', 'categoryName'));
    }
    
//    public function getPostsByCatID($slug){
//        
//        $allPostsByCat = post::where('slug', '=', $slug)->get();
//        
//        return view('category', compact('allPostsByCat'));
//    }
}
