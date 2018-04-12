<?php

namespace App\Http\Controllers\Dashboard;
use App\Http\Controllers\IController;
use Illuminate\Http\Request;

class DashboardController extends IController
{
    //
    public function index()
    {
      # code...
      return view("dashboard.dashboard");
    }
}
