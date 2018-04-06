<?php

namespace App\Models;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Collective\Html\Eloquent\FormAccessible;
use App\Models\Category;
use App\Models\PostType;

class Post extends IModel
{
    //
    protected $nameField="title";

    public function PostType()
    {
      return $this->belongsTo("App\Models\PostType");
    }

    public function Category()
    {
      return $this->belongsTo("App\Models\Category");
    }

    public function Tags()
    {
      return $this->belongsToMany('App\Models\Tag');
    }

    public function Files()
    {
      return $this->hasMany("App\Models\File","model_id","id");
    }
    public function MediaFiles()
    {
      return $this->hasMany("App\Models\MediaFile","model_id","id");
    }

}
