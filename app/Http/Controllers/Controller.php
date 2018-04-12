<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Http\Request;
// use Illuminate\Routing\Route;
use Illuminate\Support\Facades\Route;
use Func;
class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected $model;

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
          if($data->destroy($id)){
            return  Func::Success("Delete Success",$data);
          }else{
            return  Func::Error("Error while delete data !!");
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

        if($data->update($request->all())){
          return  Func::Success("Save Success",$data);
        }else{
          return  Func::Error("Error while save data !!");
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
            $data=new $this->model();


        if($data->insert($request->all())){
          return  Func::Success("Save Success",$data);
        }else{
          return  Func::Error("Error while save data !!");
        }

    }

}
