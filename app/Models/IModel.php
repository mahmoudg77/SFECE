<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;
class IModel extends Model
{

  protected $nameField="name";
  protected $dbFileds=[];
  protected $fillable=[];
  protected $relationMethods=[];
  protected $fields=[];
  public function __construct()
  {
      parent::__construct();
      $this->dbFileds=DB::select("describe ".$this->getTable());
      if(!count($this->dbFileds)) return;

      //print_r( $this->dbFileds);

      foreach ($this->dbFileds as $key => $field) {
        if(!in_array($field->Field,['created_at','updated_at','deleted_at'])){

         $this->fillable[]=$field->Field;
         $size=count(explode('(',$field->Type))>1?str_replace(')','',explode('(',$field->Type)[1]):0;
         $this->fields[$field->Field]=[
           'name'=>ucwords(str_replace("_"," ",$field->Field)),
           'type'=>$field->Type,
           'model'=>"",
           'forgkey'=>"",
           'size'=>$size,
           'null'=>$field->Null
         ];
        }
      }

      //get relations data
      // $this->relationMethods=get_class_methods(get_called_class());
      // foreach($this->relationMethods as $item){
      //     if($item=="getRelationData") break;
		  //     $data=$this->getRelationData($item);
      //     if($data)$this->fields[$item]=$data;
      // }
      //
      // print_r($this->relationMethods);


  }
  public function getRelationData($methodName)
  {
      $returned=[];
      $c_name=get_called_class();

      $func = new \ReflectionMethod($c_name,$methodName);
      $filename = $func->getFileName();
      $start_line = $func->getStartLine() + 1; // it's actually - 1, otherwise you wont get the function() block
      $end_line = $func->getEndLine()-1;
      $length = $end_line - $start_line;


      $source = file($filename);
      $body = implode("", array_slice($source, $start_line, $length));

      if(strpos($body,"this->belongsToMany")>0)
        $returned['type']="belongsToMany";
      elseif(strpos($body,"this->belongsTo")>0)
        $returned['type']="belongsTo";
      elseif(strpos($body,"this->hasMany")>0)
        $returned['type']="hasMany";
      else return null;

	  $strleft=substr($body, strpos($body, $returned['type']."(")+strlen($returned['type']."(")+1);
 	  $str_params=substr($strleft, 0,strpos($strleft, ")"));

      //echo $str_params;
      $rel_params=explode(",",$str_params);
      $returned['model']=str_replace(['"',"'"],"",$rel_params[0]);
      $returned['name']=$methodName;
      if($returned['type']=="belongsTo"){
        $returned['forgkey']=count($rel_params)>1?str_replace(['"',"'"],"",$rel_params[1]):"";
        print_r($this->fields);
        $returned['size']=($returned['forgkey']!="")?$this->fields[$returned['forgkey']]['size']:0;
        $returned['null']=($returned['forgkey']!="")?$this->fields[$returned['forgkey']]['null']:"NO";
      }else{
        $returned['forgkey']="";
        $returned['size']=0;
        $returned['null']="Yes";
      }

       return $returned;

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
 // public function getMyRelations()
 // {
 //   return $this->fields;
 // }
  public function Creator()
  {
    if($this->filed_exists('created_by')){
      return $this->belongsTo("App\User","created_by","id");
    }
    return new User();
  }



  function draw($field,$widget="",$mode="",$attrs=[],$useCollective=true){
	    //global $context;
        if($mode=="")$mode=$this->mode;

        $itemField=array_first($this->dbFileds,function($key,$value){
          return $value->Field==$field;
        });
        if(!$itemField){
          $itemField=array_first($this->fields,function($key,$value){
            return $value==$field;
          });
        }

        if($widget==""){
            //Default widget
            if(in_array($this->fields[$field]['type'],['Many2one','Boolean'])){
                $widget='combo';
            }elseif($this->fields[$field]['type']=='Many2many'){
                $widget='checklist';
            }elseif($this->fields[$field]['type']=='One2many'){
                $widget='table';
            }else

            if($itemField->Type=='date'){
                $widget='date';
            }elseif($itemField->Type=='datetime'){
                $widget='datetime';
            }else{
                $widget='text';
            }
        }


        switch($mode){
            case "edit":
            case "add":

                if(array_key_exists('class',$attrs)){$attrs['class'].=' form-control';}else{$attrs['class'].=' form-control ';}


                if($itemField->Type=="int unsigned"){
                    switch($widget){
                        default:
                            ?>
                            <?($this->data[$field]>0)?$this->data[$field]:'(New ID)'?> <input type="hidden" name="<?$field?>" value="<?$this->data[$field]?>"/>
                            <?php
                            break;

                    }

                }else{
                    if($this->dbFileds->Size>=500 || in_array($itemField->Type,['text','longtext'])){
                     ?>
                        <textarea  name="<?$field?>"  <?php foreach($attrs as $key=>$attr){?><?' '.$key.'="'.$attr.'" '?><?php }?>  <?php if($this->fields[$field]['required']){?> required <?php }?>><?$this->data[$field]?></textarea>
                     <?php
                    }elseif(in_array($itemField->Type,['timestamp','datetime','date'])){

                     //if(array_key_exists('class',$attrs)){$attrs['class'].=' date';}else{$attrs['class'].=' datetime ';}
                     ?>
                       <input type="date" name="<?$field?>" value="<?$this->data[$field]?>"  <?php foreach($attrs as $key=>$attr){?><?' '.$key.'="'.$attr.'" '?><?php }?>  <?php if($this->fields[$field]['required']){?> required <?php }?>/>
                     <?php
                    }else{
                    ?>
                        <input type="text" name="<?$field?>" value="<?$this->data[$field]?>" <?php foreach($attrs as $key=>$attr){?><?' '.$key.'="'.$attr.'" '?><?php }?>  <?php if($this->fields[$field]['required']){?> required <?php }?>/>
                     <?php

                    }

                }
                break;
            default:
                if($itemField->Type=='Many2one'){

                ?>
                        <a target="_blank" class="open-modal" href="/<?LANG?>/<?$this->fields[$field]['relation']['controller']?>/item/<?$this->$field->id?>" <?php foreach($attrs as $key=>$attr){?><?' '.$key.'="'.$attr.'" '?><?php }?>><?$this->$field->name?></a>
                <?php
                }elseif($itemField->Type=='One2many'){
                     if(array_key_exists('class',$attrs)){$attrs['class'].=' btn-link ';}else{$attrs['class'].=' btn-link ';}
                    ?>
                    <form target="_blank" action="/<?LANG?>/<?$this->fields[$field]['relation']['controller']?>/search" method="post" >
                        <?\Framework\Request::CSRF();?>
                        <input type="hidden" name="filter[]" value="<?$this->fields[$field]['relation']['classid']?>" />
                        <input type="hidden" name="value[]" value="<?$this->{$this->col_pk}?>" />
                        <input type="submit" name="" value="<?count($this->$field)?>" <?php foreach($attrs as $key=>$attr){?><?' '.$key.'="'.$attr.'" '?><?php }?>/>
                    </form>
                     <?php
                }elseif( $itemField->Type=='Many2many'){
                    switch($widget){
                        default:
                        case "tags":
                                  foreach($this->$field as $itm){?>
                                <span class="label label-warning"><?$itm->name?></span>
                             <?php }
                            break;

                       case "link":
                            if(array_key_exists('class',$attrs)){$attrs['class'].=' btn-link ';}else{$attrs['class'].=' btn-link ';}
                            ?>
                              <form target="_blank" action="/<?LANG?>/<?$this->fields[$field]['relation']['controller']?>/search" method="post" >
                                    <?\Framework\Request::CSRF();?>
                                    <input type="hidden" name="filter[]" value="<?$this->fields[$field]['relation']['classid']?>" />
                                    <input type="hidden" name="value[]" value="<?$this->{$this->col_pk}?>" />
                                    <input type="hidden" name="relation[]" value="<?$this->fields[$field]['relation']['table']?>.<?$this->fields[$field]['relation']['thisid']?>" />
                                    <input type="submit" name="" value="<?count($this->$field)?>" <?php foreach($attrs as $key=>$attr){?><?' '.$key.'="'.$attr.'" '?><?php }?>/>
                               </form>

                              <?php
                            break;
                        }
                }elseif(in_array($itemField->Type,["Boolean","tinyint"])){
                    switch($widget){
                        default:
                                   if($this->data[$field]==0){
                                       ?>
                                     <span <?php foreach($attrs as $key=>$attr){?><?' '.$key.'="'.$attr.'" '?><?php }?>>
                                       No
                                       </span>  <?php
                                   }
                                   if($this->data[$field]==1){
                                        ?>
                                     <span <?php foreach($attrs as $key=>$attr){?><?' '.$key.'="'.$attr.'" '?><?php }?>>
                                       Yes
                                       </span>  <?php
                                   }

                             break;

                    }
                }elseif($itemField->Type=="int unsigned"){
                    switch($widget){
                        default:
                            ?>
                            <?($this->data[$field]>0)?$this->data[$field]:'(New ID)'?>
                            <?php
                            break;

                    }
                }else{?>
                 <span <?php foreach($attrs as $key=>$attr){?><?' '.$key.'="'.$attr.'" '?><?php }?>>
                        <?$this->$field?>
                        </span>
                <?php }
                break;

        }


	}

}

?>
