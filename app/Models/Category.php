<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends IModel
{
    //
    public function Posts()
    {
      return $this->hasMany('App\Models\Post');
    }

}