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
    public function Parent()
    {
      return $this->belongsTo(Category::class,"parent_id");
    }
    public function Chields()
    {
      return $this->hasMany(Category::class,"parent_id");
    }
}
