<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AccountLevel extends IModel
{
    //
    public function Roles()
    {
      return explode(',', $this->role);
    }
    public function hasRole($value='')
    {
      return in_array($value, $this->Roles);
    }
    public function Accounts()
    {
      return $this->hasMany('App\User');
    }
}
