<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use \Dimsav\Translatable\Translatable;

class MenuLink extends Model
{
    use Translatable;
    protected $fillable = ['menu_id','customlink','category_id','parent_id','hasSubs'];
    public function Menu()
    {
      return $this->belongsTo("App\Models\Menu");
    }
}


class MenuLinkTranslation extends Model {

    public $timestamps = false;
    protected $fillable = ['title'];

}