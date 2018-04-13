<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\IController;
use App\Models\Category;
use Auth;
class CategoryController extends IController
{
  protected $model="App\Models\Category";
  public function index()
  {
    $data=Category::where("id","<>",0)->where("parent_id",0)->get();
    return view("dashboard.category.index",compact('data'));
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
      $category=new Category();
      $category->title=$request->input("title");
      $category->description=$request->input("description");
      $category->parent_id=$request->input("parent_id");
      $category->created_by=Auth::user()->id;

      if($category->save()){
        return  $this->Success("Save Success",$category);
      }else{
        return  $this->Error("Error while save data !!");
      }

  }
}
