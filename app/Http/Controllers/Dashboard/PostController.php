<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\IController;
use App\Models\Post as IModel;
use Func;
use Auth;
class PostController extends IController
{

  protected $viewFolder="dashboard.post";

  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function index()
  {
      if(request()->has("type")){
        $data=IModel::where('post_type_id',request()->get("type"))->get();
      }else{
        $data=IModel::all();
      }

      return view($this->viewFolder.".index",compact('data'));
  }

  public function edit($id)
  {
    $data=IModel::find($id);
    return view($this->viewFolder.".edit",compact('data'));
  }
  public function create()
  {
      return view($this->viewFolder.".create");
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
      $category['created_by']=Auth::user()->id;
      $data['pub_date']=date('Y-m-d H:i:n');
      $data['is_published']=1;


      if(IModel::create($data)){
        return  $this->Success("Save Success",$data);
      }else{
        return  $this->Error("Error while save data !!");
      }

  }
  public function update(Request $request,$id)
  {
      //
      $category=$request->except(['_token']);
      $category['updated_by']=Auth::user()->id;
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
