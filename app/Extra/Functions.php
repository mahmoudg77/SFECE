<?php

namespace App\Extra;
use Illuminate\Http\Request;
use Form;
class Functions
{
    public static function Success($message='',$object=null,$next="")
    {
       if(\Request::ajax()){
         $response['type']='success';
         $response['message']=$message;
         $response['data']=$object;
         return json_encode($response);
       }else{
         if($next!="") return redirect($next);
         return "<div class='alert alert-success'>".$message."</div>";
       }
    }
    public static function Error($message='',$object=null)
    {
      if(\Request::ajax()){
        $response['type']='error';
        $response['message']=$message;
        $response['data']=$object;
        return json_encode($response);
      }else{

        return "<div class='alert alert-danger'>".$message."</div>";
      }
    }

    public static function actionLinks($routeBase,$id,$elm_parent="tr")
    {
      $returned=Form::open(['route'=>["cp.$routeBase.destroy",$id],"method"=>"DELETE","class"=>"ajax-delete","elm-parent"=>$elm_parent])."\n\r";
      $returned.=Form::submit("Delete",["class"=>"btn btn-danger btn-sm"])."\n\r";
      $returned.='<a href="'.route("cp.$routeBase.edit",$id).'" class="btn btn-primary btn-sm edit">Edit</a>'."\n\r";
      $returned.='<a href="'.route("cp.$routeBase.show",$id).'" class="btn btn-default btn-sm view">View</a>'."\n\r";
      $returned.=Form::close()."\n\r";
      return $returned;
    }
    public static function langslug($url, $langcode = null, $attributes = array(), $https = null)
    {
        $url = URL::to($url, $https);

        if (is_null($langcode)) $langcode = $url;

        return '<a href="'.$url.'"'.static::attributes($attributes).'>'.static::entities($langcode).'</a>';
    }

    public static function controllers(){

        $list=[];
        foreach (glob(dirname(__FILE__)."/../Http/Controllers/*.php") as $filename)
          {
              $name=explode('/',$filename);
              $name=$name[count($name)-1];
              include_once $filename;
          }
          foreach (glob(dirname(__FILE__)."/../Http/Controllers/Dashboard/*.php") as $filename)
          {
              $name=explode('/',$filename);
              $name=$name[count($name)-1];
               include_once $filename;
          }


        foreach(get_declared_classes() as $class){
            if(strpos($class,'App\Http\Controllers\\',0)!==false){
              $obj=new $class;
                $list[$class]=property_exists($class,'metaTitle')&&$obj->metaTitle!=null ?$obj->metaTitle:str_replace('App\Http\Controllers\\','',$class);//$obj->metaTitle;
            }
        }
        asort($list);
        return $list;
     }

     public static function applyForceFilter($class)
     {
       $data=$class::all();
       $force_filter=request()->get('force_filter');

       if($force_filter){
           foreach ($force_filter as $key => $value) {
            $data=$data->where($value[0],$value[1],$value[2]);
          }
        }
        return $data;
     }
     public static function checkValue($left,$strOperator,$right)
     {

       switch($strOperator){
          case "=":
            return $left == $right;
            break;

         case ">";
           return $left > $right;
           break;

         case "<";
             return $left < $right;
             break;
         case ">=";
           return $left >= $right;
           break;
         case "<=";
           return $left <= $right;
           break;
         case "like";
           return strpos($left, $right);
           break;
        }
     }
}
?>
