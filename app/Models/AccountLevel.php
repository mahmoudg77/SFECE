<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AccountLevel extends Model
{
    //
    
    public function Roles()
    {
      return explode(',', $this->role);
    }
    public function hasRole($value='')
    {
      return in_array($value, $this->Roles());
    }
    public function hasRoles($arrRoles)
    {

      foreach ((array)$arrRoles as $key => $role) {
         return in_array($role, $this->Roles());
      }
      return false;
    }
    public function Accounts()
    {
      return $this->hasMany('App\User');
    }
}
