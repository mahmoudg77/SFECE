<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Post;
use Func;
class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $posts=Post::all();
        return view('dashboard.post.index',compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('dashboard.post.create');

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $post=new Post();
        $post->title=$request->input('title');
        $post->category_id=$request->input('category_id');
        $post->post_type_id=$request->input('post_type_id');
        $post->body=$request->input('body');
        $post->created_by=1;
        $post->pub_date=date("Y-m-d H:i:s");
        $post->is_published=1;

        if($post->save()){
          return  Func::Success("Save Success",$post);
        }else{
          return  Func::Error("Error while save data !!");
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $post=Post::find($id);
         return view("dashboard.post.show",compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $post=Post::find($id);
        return view("dashboard.post.edit",compact('post'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $post=Post::find($id);
        $post->title=$request->input('title');
        $post->category_id=$request->input('category_id');
        $post->post_type_id=$request->input('post_type_id');
        $post->body=$request->input('body');
        $post->created_by=1;
        $post->pub_date=date("Y-m-d H:i:s");
        $post->is_published=1;

        if($post->update()){
          return  Func::Success("Save Success",$post);
        }else{
          return  Func::Error("Error while save data !!");
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
          $post=Post::find($id);
          if($post->destroy($id)){
            return  Func::Success("Delete Success",$post);
          }else{
            return  Func::Error("Error while delete data !!");
          }
    }
}
