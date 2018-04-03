<?php

namespace App;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Collective\Html\Eloquent\FormAccessible;

class Post extends Model
{
    //
    use FormAccessible;

    public function PostType()
    {
      return $this->belongsTo("App\PostType");
    }

    public function getTitle()
    {
      return $this->title."ttttt";
    }

}
