<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Post;

class SingleController extends Controller
{
    public function getPostByID($id){
        $singlePost= post::where('id', '=', $id)->get();
            
        return view('single', compact('singlePost'));
    }
}
