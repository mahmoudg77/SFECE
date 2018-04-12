<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Post;
use Func;
class PostController extends Controller
{
  protected $model="App\Models\Post";
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(request()->has("type")){
          $data=Post::where('post_type_id',request()->get("type"))->get();
        }else{
          $data=Post::all();
        }

        return parent::myview(compact('data'));
    }

}
