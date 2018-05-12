<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\IController;

class SettingController extends IController
{

  public function index()
  {
    return view("dashboard.setting.index");
  }
}
