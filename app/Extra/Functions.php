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
      $returned.=Form::submit("Delete",["class"=>"btn btn-danger"])."\n\r";
      $returned.='<a href="'.route("cp.$routeBase.edit",$id).'" class="btn btn-primary edit">Edit</a>'."\n\r";
      $returned.='<a href="'.route("cp.$routeBase.show",$id).'" class="btn btn-default view">View</a>'."\n\r";
      $returned.=Form::close()."\n\r";
      return $returned;
    }
}
?>
