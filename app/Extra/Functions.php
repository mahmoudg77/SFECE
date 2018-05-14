<?php

namespace App\Extra;
use Illuminate\Http\Request;
use Form;
class Functions
{
    public static function Success($message='',array $sentData=[])
    {
        $response['type']='success';
        $response['message']=$message;
        $response['data']=$sentData;
        //$sentData['response']=$response;

        //dd($sentData);
       if(\Request::ajax()){
         return json_encode($response);
       }else{
           session()->put('response',$response);
           return redirect()->back();
//           if($view!="") return view($view,$sentData);
//         return "<div class='alert alert-success'>".$message."</div>";
       }
    }
    public static function Error($message='',$view="",array $sentData=[])
    {
        $response['type']='error';
        $response['message']=$message;
        $response['data']=$sentData;


        //dd($sentData);
      if(\Request::ajax()){

        return json_encode($response);
      }else{
          session()->put('response',$response);
          if($view!="") return view($view,$sentData);
          return redirect()->back();//"<div class='alert alert-danger'>".$message."</div>";
      }
    }

    public static function actionLinks($routeBase,$id,$elm_parent="tr",array $attrs=[])
    {
      $class_del="btn btn-danger btn-sm ";
      $class_edit="btn btn-primary btn-sm ";
      $class_view="btn btn-default btn-sm ";

        if(in_array('delete' ,array_keys($attrs)) && in_array('class' ,array_keys($attrs['delete']))){
             $class_del.= $attrs['delete']['class'];
        }
        if(in_array('edit' ,array_keys($attrs)) && in_array('class' ,array_keys($attrs['edit']))){
            $class_edit.=$attrs['edit']['class'];
        }
        if(in_array('view' ,array_keys($attrs)) && in_array('class' ,array_keys($attrs['view']))){
            $class_view.=$attrs['view']['class'];
        }
        $sitebarmenu=\request()->get('curr_menu');

        $returned=Form::open(['route'=>["cp.$routeBase.destroy",$id],"method"=>"DELETE","class"=>"ajax-delete","elm-parent"=>$elm_parent])."\n\r";
        $returned.=Form::submit("Delete",["class"=>$class_del])."\n\r";
        $returned.='<a href="'.(in_array('edit',array_keys($attrs)) && in_array('href',array_keys($attrs['edit']))?$attrs['edit']['href']:route("cp.$routeBase.edit",['id'=>$id,'curr_menu'=>$sitebarmenu])).'" class="'.$class_edit.'">Edit</a>'."\n\r";
        $returned.='<a href="'.(in_array('view',array_keys($attrs)) && in_array('href',array_keys($attrs['view']))?$attrs['view']['href']:route("cp.$routeBase.show",['id'=>$id,'curr_menu'=>$sitebarmenu])).'" class="'.$class_view.'">View</a>'."\n\r";
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

     public static function applyForceFilter($class,$force_filter)
     {
       $data=$class::all();
      // $force_filter=request()->get('force_filter');

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
     public static function menu($location){
         return \App\Models\Menu::where("location",$location)->first()->Links()->where(function ($query) {
             $query->where('parent_id', '=', 0)
                 ->orWhereNull('parent_id');
         })->get();
     }
     public static function menuLink($menuLink){
        if(empty($menuLink->customlink)){

            if($menuLink->category_id>0){
               if($menuLink->hassubs){
                   return '#';
               }else{
                   return route('getPostsByCatID',['id'=>$menuLink->category_id]);
               }
            }else{
                return route('home');
            }

        }else{
            if(Functions::link_is_external($menuLink->customlink)){
                return $menuLink->customlink;
            }else{

                return '/'.app()->getLocale().$menuLink->customlink;
            }
        }
     }
     public static function link_is_external($link){
        return substr($link,0,4)=='http' || substr($link,0,2)=='//';
     }

    public static function getCategoriesList(){
        foreach (\App\Models\Category::all() as $cat){
            foreach ($cat->Chields as $chield){
                $cats[$cat->title][$chield->id]=$chield->title;
            }
        }
        return $cats;
    }
    public static function getPageBySlug($slug){
        return \App\Models\Post::where('slug', $slug)->firstOrFail();
    }
}
?>
