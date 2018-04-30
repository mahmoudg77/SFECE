<?php

namespace App\Models;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Collective\Html\Eloquent\FormAccessible;
use \Dimsav\Translatable\Translatable;
use App\Models\Category;
use App\Models\PostType;


class Post extends Model
{
    //
    use Translatable;
    protected $fillable=['pub_date','post_type_id','category_id','is_published','created_by'];
    public $translatedAttributes = ['title','body'];

    public function PostType()
    {
      return $this->belongsTo("App\Models\PostType","post_type_id");
    }

    public function Category()
    {
      return $this->belongsTo("App\Models\Category","category_id");
    }

    public function Tags()
    {
      return $this->belongsToMany("App\Models\Tag");
    }

    public function Files()
    {
      return $this->hasMany("App\Models\File","model_id","id");
    }
    public function MediaFiles()
    {
      return $this->hasMany("App\Models\MediaFile","model_id","id");
    }
    public function Creator()
    {
        return $this->belongsTo("App\User","created_by","id");
    }
}

class PostTranslation extends Model {

    public $timestamps = false;
    protected $fillable = ['title','body'];

}