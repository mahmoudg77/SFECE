<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comment extends IModel
{
    public function Post()
    {
      return $this->belongsTo('App\Models\Post');
    }

    
}
