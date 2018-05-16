<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','country','city','phone','email_token','account_level_id'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function AccountLevel()
    {
      return $this->belongsTo('App\Models\AccountLevel');
    }
    public function hasRoles($value)
    {
      return $this->AccountLevel->hasRoles($value);
    }
    public function name()
    {
      return $this->name;
    }
    public function allow($ctrl,$action)
    {
      return $this->AccountLevel->allow($ctrl,$action);
    }
    public function hasRole($role)
    {
        return $this->AccountLevel->hasRole($role);
    }
}
