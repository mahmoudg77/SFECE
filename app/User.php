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
        'name', 'email', 'password','country','city','phone','email_token'
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
}
