<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MenuLink extends IModel
{
    public function Menu()
    {
      return $this->belongsTo("App\Models\Menu");
    }
}
