<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;
class IModel extends Model
{

  protected $nameField="name";
  protected $dbFileds=[];

  public function __construct()
  {
      parent::__construct();
      $this->dbFileds=DB::select("describe ".$this->getTable());
  }


  private function filed_exists($name)
  {
    //$this->fields=DB::select("describe ".$this->getTable());
    foreach($this->dbFileds as $key=>$field){
      if($field->Field==$name){
        return true;
      }
    }
    return false;
  }

  public function name()
  {
      if($this->filed_exists($this->nameField)){
        return $this->{$this->nameField};
      }


    foreach($this->dbFileds as $key=>$field){
      if(!strpos("_".$field->Type, 'varchar')===false){
          return $this->{$field->Field};
      }
    }

  }

  public function Creator()
  {
    if($this->filed_exists('created_by')){
      return $this->belongsTo("App\User","created_by","id");
    }
    return new User();
  }

   
}
