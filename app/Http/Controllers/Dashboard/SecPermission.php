<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\IController;
use App\Models\SecPermission as IModel;
use Func;
use Auth;
class SecPermission extends IController
{
  protected $viewFolder="dashboard.sec.permission";
  public function index()
  {
    if(request()->get('group')==null){
        return "Invalid Request !!";
    }

    $data=IModel::where('sec_group_id',request()->get('group'));
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
      $category=$request->except(['_token']);
      $category['created_by']=Auth::user()->id;

      if(IModel::create($category)){
        return  $this->Success("Save Success",$category);
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
  public function getActionsList()
  {
    $ctrl=request()->get('ctrl');
    if(!isset($ctrl) || $ctrl=='')
        return json_encode(['success'=>false,'message'=>"Invalid request !!"]);
    if(!in_array($ctrl,array_keys(Func::controllers())))
        return json_encode(['success'=>false,'message'=>"Invalid request !!"]);

    $obj=new $ctrl;
    $methods=$obj->methods;
    $newarray=[];
    foreach ($methods as $key => $value) {
      $newarray[]=['key'=>$key,'value'=>$value];
    }
    return json_encode(['success'=>true,'data'=>$newarray]);
  }
}
