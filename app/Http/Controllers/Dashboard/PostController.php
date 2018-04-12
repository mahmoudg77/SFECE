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
    public function store(Request $request)
    {
        $data=$request->except(['_token']);
        $data['pub_date']=date('Y-m-d H:i:n');
        $data['is_published']=1;
        $data['created_by']=1;


        if(Post::insert($data)){
          return  Func::Success("Save Success",$data);
        }else{
          return  Func::Error("Error while saving data !!");
        }

    }

}
