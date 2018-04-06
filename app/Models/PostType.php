<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PostType extends IModel
{
    //
    public function Posts()
    {
      return $this->hasMany('App\Models\Post');
    }
}
