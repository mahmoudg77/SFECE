<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class File extends IModel
{

    public function RelatedObject()
    {
      return $this->belongsTo($this->model_name,'model_id',"id");

    }

}