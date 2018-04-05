<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PostType extends Model
{
    //
    public function PostType()
    {
      return $this->hasMany("App\Models\Post");
    }
}
