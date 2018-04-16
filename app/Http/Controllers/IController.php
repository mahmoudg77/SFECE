<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Http\Request;
// use Illuminate\Routing\Route;
use Illuminate\Support\Facades\Route;
use Auth;
use View;
class IController extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected $model;
    public function __construct()
    {
        $this->middleware('access');

        //Category Menu
        $cp_menu=[
          'Category'=>[
            'url'=>route('cp.category.index',['menu'=>'Category']),
            'roles'=>['admin'],
            'submenu'=>[
              'All Category'=>['url'=>route('cp.category.index',['menu'=>'Category']),'roles'=>['admin'],'submenu'=>null],
              'New Category'=>['url'=>route('cp.category.create',['menu'=>'Category']),'roles'=>['admin'],'submenu'=>null]
            ]
        ]];

        //Posts Menu
        foreach (\App\Models\PostType::all() as $key => $value) {
          $cp_menu[$value->name]=[
            'url'=>route('cp.posts.index',['type'=>$value->id,'menu'=>$value->name]),
            'roles'=>['admin'],
            'submenu'=>[
              'All '.$value->name=>['url'=>route('cp.posts.index',['type'=>$value->id,'menu'=>$value->name]),'roles'=>['admin'],'submenu'=>null],
              'New '.$value->name=>['url'=>route('cp.posts.create',['type'=>$value->id,'menu'=>$value->name]),'roles'=>['admin'],'submenu'=>null]
            ]];
        }

        //Menus
        $cp_menu['Menus']=[
          'url'=>route('cp.menu.index',['menu'=>'Menus']),
          'roles'=>['admin'],
          'submenu'=>[
            'All Menus'=>['url'=>route('cp.menu.index',['menu'=>'Menus']),'roles'=>['admin'],'submenu'=>null],
            'New Menu'=>['url'=>route('cp.menu.create',['menu'=>'Menus']),'roles'=>['admin'],'submenu'=>null]
          ]];

          //Comments
         $cp_menu['Comments']=[
          'url'=>route('cp.comment.index',['menu'=>'Comments']),
          'roles'=>['admin'],
          'submenu'=>[
            'All Comments'=>['url'=>route('cp.comment.index',['menu'=>'Comments']),'roles'=>['admin'],'submenu'=>null],
          ]];

          //Users
          $cp_menu['Users']=[
           'url'=>route('cp.user.index',['menu'=>'Users']),
           'roles'=>['admin'],
           'submenu'=>[
             'All Users'=>['url'=>route('cp.user.index',['menu'=>'Users']),'roles'=>['admin'],'submenu'=>null],
           ]];

           //setting
           $cp_menu['Setting']=[
            'url'=>route('cp.post-type.index',['menu'=>'Setting']),
            'roles'=>['admin'],
            'submenu'=>[
              'Post Type'=>['url'=>route('cp.post-type.index',['menu'=>'Setting']),'roles'=>['admin'],'submenu'=>null],
              'Account Levels'=>['url'=>route('cp.account-level.index',['menu'=>'Setting']),'roles'=>['admin'],'submenu'=>null],
            ]];

         View::share('cp_menu',$cp_menu);
    }
    function myview(){
      global $request;
       $args=func_get_args();

       if(count($args)==0){
          $view='';
          $arr=[];
        }elseif(count($args)==1){
            if(is_array($args[0])){
                $view='';
                $arr=$args[0];
            }else{
                $view=$args[0];
                $arr=[];
            }
        }else{
            $view=$args[0];
            $arr=$args[1];
        }


        if($view==''){
          $trace = debug_backtrace();
          $method = Route::getCurrentRoute()->getActionName();//$trace[1]['function'];
          $method=explode('@',$method)[1];
          // $method = $trace[1]['function'];
          $cntrl= get_called_class();
          $cntrl=str_replace("App\\Http\\Controllers\\","",$cntrl);
          $cntrl=str_replace("\\",".",$cntrl);
          $cntrl=str_replace("Controller","",$cntrl);
          $cntrl=mb_strtolower($cntrl);

         $view=$cntrl.".$method";

        }
        elseif(count(explode("/",$view))<2){
          $cntrl= get_called_class();
          $cntrl=str_replace("App\\Http\\Controllers\\","",$cntrl);
          $cntrl=str_replace("\\",".",$cntrl);
          $cntrl=str_replace("Controller","",$cntrl);
          $cntrl=mb_strtolower($cntrl);
            $view=$cntrl.".".$view;
            $view=str_replace("App\\Http\\Controllers\\","",$view);
        }
        $view=str_replace("App\\Http\\Controllers\\","",$view);
        $view=str_replace(".","\\",$view);

       if(!file_exists(resource_path('views')."/".str_replace("App\\Http\\Controllers\\","",$view).'.blade.php')){
          // $cntrl= get_called_class();
          // $cntrl=str_replace("App\\Http\\Controllers\\","",$cntrl);
          // $cntrl=str_replace("\\",".",$cntrl);
          // $cntrl=str_replace("Controller","",$cntrl);
          // $cntrl=mb_strtolower($cntrl);
          $method = Route::getCurrentRoute()->getActionName();//$trace[1]['function'];
          $method=explode('@',$method)[1];

          // echo $cntrl;
          // $view=$cntrl."/".$view;

          $view="base.$method";
      }

        return view($view,$arr);
     }
    public function index()
    {
      $class=new $this->model();
      $data=$class->all();
      return $this->myview(compact('data'));
    }
    public function edit($id)
    {
      $class=new $this->model();
      $data=$class->find($id);
      return $this->myview(compact('data'));
    }
    public function create()
    {
        //
        return $this->myview();

    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $class=new $this->model();
        $data=$class->find($id);
         return $this->myview(compact('data'));
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $class=new $this->model();
        $data=$class->find($id);

        $fields=$class->getFields();
        if(array_key_exists("deleted_by", $fields)){
          $data->deleted_by=Auth::user()->id;
        }
        $data->save();

        if($data->destroy($id)){
          return  $this->Success("Delete Success",$data);
        }else{
          return  $this->Error("Error while delete data !!");
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //

        $class=new $this->model();
        $data=$class->find($id);
        $inputs=$request->except(['_token']);
        $fields=$class->getFields();
        if(array_key_exists("updated_by", $fields)){
          $inputs['updated_by']=Auth::user()->id;
        }
        if($data->update($inputs)){
          return  $this->Success("Save Success",$data);
        }else{
          return  $this->Error("Error while save data !!");
        }

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $class=new $this->model();
        $inputs=$request->except(['_token']);
        $fields=$class->getFields();

        if(array_key_exists("created_by", $fields)){
          $inputs['created_by']=Auth::user()->id;
        }
         if($class->insert($inputs)){
          return  $this->Success("Save Success",$class);
        }else{
          return  $this->Error("Error while save data !!");
        }

    }

    public static function Success($message='',$object=null)
    {
       if(\Request::ajax()){
         $response['type']='success';
         $response['message']=$message;
         $response['data']=$object;
         return json_encode($response);
       }else{
         $route = Route::currentRouteName();


         $index_route=substr($route,0,-1 * strlen(explode(".", $route)[count(explode(".", $route))-1]))."index";

         return redirect()->route($index_route);
         //return "<div class='alert alert-success'>".$message."</div>";
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
