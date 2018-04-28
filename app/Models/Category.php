<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\softDeletes;
use \Dimsav\Translatable\Translatable;

class Category extends Model
{
    use softDeletes;
    use Translatable;
    protected $fillable=['parent_id','created_by'];
    public $translatedAttributes = ['title','description'];

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

// models/CountryTranslation.php
class CategoryTranslation extends Model {

    public $timestamps = false;
    protected $fillable = ['title','description'];

}
