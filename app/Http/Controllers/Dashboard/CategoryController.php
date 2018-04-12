<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\IController;
use App\Models\Category;
class CategoryController extends IController
{
  protected $model="App\Models\Category";
  public function index()
  {
    $data=Category::where("id","<>",0)->get();
    return view("dashboard.category.index",compact('data'));
  }
}
