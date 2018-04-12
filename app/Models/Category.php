<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\softDeletes;

class Category extends IModel
{
  use softDeletes;
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
