@extends('layouts.admin')
@section('content')
<section class="post-dashboard">
<div class="panel panel-default">
    <div class="panel-body">
        <h2 class="post-heading">Create New</h2>
        {{Form::model(null, ['route'=>["cp.posts.store",'type'=>$post_type_id,'curr_menu'=>$sel_menu],"method"=>"POST","enctype"=>"multipart/form-data","class"=>"ajax--form"])}}
        <div class="form-horizontal">
                  <ul class="nav nav-tabs">
                    @foreach(config('translatable.locales') as $key)
                    <li class="{{($key==app()->getLocale())?'active':''}}">
                        <a data-toggle="tab" href="#data_{{$key}}">{{$key}}</a></li>
                    @endforeach

                  </ul>

                  <div class="tab-content" style="padding: 10px 0;">
                    @foreach(config('translatable.locales') as $key)
                    <div id="data_{{$key}}" class="tab-pane fade in {{($key==app()->getLocale())?'active':''}}">
                      <div class="form-group">
                        <label class="control-label col-md-2">Title</label>
                        <div class="col-md-10">
                          {{Form::text($key."[title]","",["required",'class'=>'form-control'])}}
                        </div>
                    </div>

                <div class="form-group">
                    <label class="control-label col-md-2">Content</label>
                    <div class="col-md-10">
                      {{Form::textarea($key."[body]","",["required",'class'=>'form-control editor','id'=>$key.'_editor'])}}
                    </div>
                </div>
              </div>
                @endforeach
                <div class="form-group" style="padding-top:10px;">
                    <label class="control-label col-md-2">Url</label>
                    <div class="col-md-10">
                        {{Form::text("slug",null,['required','class'=>'form-control'])}}
                    </div>
                </div>
                @if($post_type_id==1)
                    {{Form::hidden('category_id',0)}}
                @else
                    <div class="form-group">
                        <label class="control-label col-md-2">Category</label>
                        <div class="col-md-10">
                            {{Form::select("category_id",Func::getCategoriesList(),null,["required",'class'=>'form-control'])}}
                        </div>
                    </div>
                @endif
                    {{Form::hidden('post_type_id',$post_type_id)}}
                <div class="form-group">
                    <label class="control-label col-md-2">Image</label>
                    <div class="col-md-10">
                        {{Form::file("image",['accept'=>'.jpg,.png,.gif'])}}
                    </div>
                </div>
                      <hr>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <button type="submit" class="btn btn-success create"><i class="fa fa-save"></i> Create</button>
                    </div>
                </div>
            </div>
        </div>
        {{Form::close()}}
    </div>
</div>
</section>
    <script>
        $(function(){
            $("input[name='{{app()->getLocale()}}[title]']").change(function(){
                //console.log($(this).val());
                //console.log($("input[name='slug']").val());
                if($("input[name='slug']").val()){
                    return;
                }
               $.ajax({
                   type:"post",
                   url:"{{route('cp.post-slug')}}",
                   data:{title:$(this).val()},
                   dataType:"json",
                   headers:{'X-CSRF-TOKEN':'{{csrf_token()}}'},
                   success:function(d){
                       if(d.type=="success"){
                           $("input[name='slug']").val(d.data);
                       }
                   },
                   error: function (data, status, xhr) {
                       Error( data.status + " " + xhr);
                   }
               })

            });
        })
    </script>


@stop
