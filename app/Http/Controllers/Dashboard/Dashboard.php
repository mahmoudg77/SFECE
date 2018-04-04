<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;

class Dashboard extends Controller
{
    //
    public function index()
    {
      # code...
      return view("dashboard.dashboard");
    }
}
