<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Post;
use Func;
use Form;

class PostsController extends Controller
{
    //
    public function __construct()
    {
       Form::component('ymd', 'components.form.date', ['name', 'value', 'attributes']);
    }
    public function index()
    {
      $posts=Post::all();
      return view("posts.index");
    }
    public function edit($id)
    {

      $post=Post::find($id);
       //$request=Request;
      return view("posts.edit",compact('post'));
    }
    public function update($id,Request $data){
        $post=Post::find($id);
        $post->title=$data->input("title");
        $post->body=$data->input("body");
        $post->save();

    }

}
