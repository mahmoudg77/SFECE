<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\IController;
use App\Models\Post as IModel;
use App\Models\MediaFile;
use Func;
use Auth;
class PostController extends IController
{
  var $permitionname="المقالات";
  public $model=\App\Models\Post::class;
  protected $viewFolder="dashboard.post";

  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function index()
  {


      $data=request()->get('data');
      if(request()->has("type")){
        $post_type_id=request()->get('type');
        $data=$data->where('post_type_id',request()->get("type"));
      }
      //$data->get();

      return view($this->viewFolder.".index",compact('data','post_type_id'));
  }

  public function edit($id)
  {
    $data=request()->get('data');
    $data=$data->find($id);
    if($data==null){
      return "Unauthorized !";
    }
    return view($this->viewFolder.".edit",compact('data'));
  }
  public function create()
  {
      $post_type_id=request()->get('type');
      return view($this->viewFolder.".create",compact('post_type_id'));
  }
  /**
   * Display the specified resource.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function show($id)
  {
      $data=request()->get('data');
    $data=$data->find($id);
    if($data==null){
      return "Unauthorized !";
    }
       return view($this->viewFolder.".show", compact('data'));
  }


  /**
   * Store a newly created resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @return \Illuminate\Http\Response
   */
  public function store(Request $request)
  {

      $force_filter=$request->get('force_filter');
      //dd($request);

      $data=$request->except(['_token','force_filter']);
      $data['created_by']=Auth::user()->id;
      $data['pub_date']=date('Y-m-d H:i:n');
      $data['is_published']=1;
      $data['slug']=str_slug($data[app()->getLocale()]['title'],'_');



      if($force_filter){
        foreach ($force_filter as $key => $value) {
          if(Func::checkValue($data[$value[0]],$value[1],$value[2])==false){
              return "Unauthorized !";
          }
        }
      }
      $post=IModel::create($data);

      if($request->hasfile('image'))
      {
          $image=$request->file('image');
          //dd($image);
          $imageobj=new MediaFile(['model'=>IModel::class,'id'=>$post->id,'tag'=>'main']);

          //dd($imageobj->upload($image));

      }

      if( $post){
        return  $this->Success("Save Success",$data);
      }else{
        return  $this->Error("Error while save data !!");
      }

  }
  public function update(Request $request,$id)
  {
      //
      $reqData=$request->except(['_token']);

      $reqData['updated_by']=Auth::user()->id;
      //$category['id']=$id;
      //print_r($category);
      $data=request()->get('data');
      //$data=Func::applyForceFilter(IModel::class);
      $data=$data->find($id);
      if($data==null){
          return "Unauthorized !";
      }
      if($data->update($reqData)){
        return  $this->Success("Save Success",$reqData);
      }else{
        return  $this->Error("Error while save data !!");
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
      $data=\request()->get('data');
      $data=$data->find($id);
      if($data==null){
          return "Unauthorized !";
      }


      if($data->destroy($id)){
        return  $this->Success("Delete Success",$data);
      }else{
        return  $this->Error("Error while delete data !!");
      }
  }



}
