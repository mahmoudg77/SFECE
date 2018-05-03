<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SecGroup extends Model
{
  protected $fillable=['name','groupkey'];

    public function Permissions()
    {
      return belongsToMany('App\Models\SecPermission');
    }
    public function Accounts()
    {
      return belongsToMany('App\Models\User');
    }
}
