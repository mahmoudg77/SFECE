<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\IController;
use Func;
class SettingController extends IController
{

  public function index()
  {
    return view("dashboard.setting.index");
  }
}
