<?php

namespace App\Extra;
use Illuminate\Http\Request;

class Functions
{
    public static function Success($message='',$object=null)
    {
       if(\Request::ajax()){
         $response['type']='success';
         $response['message']=$message;
         $response['data']=$object;
         return json_encode($response);
       }else{
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
}
?>
