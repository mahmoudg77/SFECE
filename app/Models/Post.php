<?php

namespace App\Models;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Collective\Html\Eloquent\FormAccessible;
use App\Models\Category;
use App\Models\PostType;
class Post extends Model
{
    //
    use FormAccessible;

    public function PostType()
    {
      return $this->belongsTo("App\Models\PostType");
    }

    public function Category()
    {
      return $this->belongsTo("App\Models\Category");
    }


}
