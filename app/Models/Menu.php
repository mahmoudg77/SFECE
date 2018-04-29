<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use \Dimsav\Translatable\Translatable;

class Menu extends Model
{
    use Translatable;
    protected $fillable=['location'];
    public $translatedAttributes = ['name'];

    public function Links()
    {
      return $this->hasMany("App\Models\MenuLink");
    }

}

class MenuTranslation extends Model {

    public $timestamps = false;
    protected $fillable = ['name'];

}
