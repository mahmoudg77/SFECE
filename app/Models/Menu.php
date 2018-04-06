<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Menu extends IModel
{
    public function Links()
    {
      return $this->hasMany("App\Models\Menu");
    }
    
}
