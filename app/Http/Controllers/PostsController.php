<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Post;

class PostsController extends Controller
{
    // get last 6 posts in home page 
    public function getLastPosts(){
        $lastPosts = Post::where('is_published',1)->where('post_type_id', 2)->orderBy('id', 'desc')->take(6)->get();
        return view('welcome', compact('lastPosts'));
    }
    
    //save data research to db
    public function store(Request $request)
      {
          $data=$request->except(['_token']);
          $data['created_by']=Auth::user()->id;
          if(in_array('is_published',$data) && $data['is_published']==1){
              $data['pub_date']=date('Y-m-d H:i:n');
          }

          DB::beginTransaction();
          try{
              $post=IModel::create($data);

              if($request->hasfile('attach'))
              {
                  $file=$request->file('attach');
                  $fileobj=new File(['model'=>IModel::class,'id'=>$post->id,'tag'=>'main']);
                  $fileobj->upload($file);
              }

              DB::commit();

              return  Func::Success("Save Success");
          }catch (\Exception $ex){
              DB::rollback();
              return  Func::Error("Error while save data !! ", "/",compact('data'));
          }

      }
}

?>
