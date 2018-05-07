<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\IController;
use App\Models\Post as IModel;
use Func;
use Auth;
class PostController extends IController
{
  var $permitionname="المقالات";
  protected $viewFolder="dashboard.post";

  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function index()
  {


      $data=Func::applyForceFilter(IModel::class);
      if(request()->has("type")){
        $post_type_id=request()->get('type');
        $data=$data->where('post_type_id',request()->get("type"));
      }
      //$data->get();

      return view($this->viewFolder.".index",compact('data','post_type_id'));
  }

  public function edit($id)
  {
    $data=Func::applyForceFilter(IModel::class);
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
      //
       $data=IModel::find($id);
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
      //
      $data=$request->except(['_token']);
      $data['created_by']=Auth::user()->id;
      $data['pub_date']=date('Y-m-d H:i:n');
      $data['is_published']=1;
      $data['slug']=str_slug($data[app()->getLocale()]['title'],'_');


      if(IModel::create($data)){
        return  $this->Success("Save Success",$data);
      }else{
        return  $this->Error("Error while save data !!");
      }

  }
  public function update(Request $request,$id)
  {
      //
      $data=$request->except(['_token']);
      $data['updated_by']=Auth::user()->id;
      //$category['id']=$id;
      //print_r($category);

      if(IModel::findOrFail($id)->update($category)){
        return  $this->Success("Save Success",$category);
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
      $data=IModel::find($id);
      //$data->deleted_by=Auth::user()->id;
      //$data->save();

      if($data->destroy($id)){
        return  $this->Success("Delete Success",$data);
      }else{
        return  $this->Error("Error while delete data !!");
      }
  }



}
