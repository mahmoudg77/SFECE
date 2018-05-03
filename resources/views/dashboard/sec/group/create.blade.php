@extends('layouts.admin')
@section('content')
{{Form::model(null, ['route'=>["cp.secgroup.store"],"method"=>"POST"])}}
<div class="form-horizontal">
        <div class="form-group">

              <div class="form-group">
                <label class="control-label col-md-2">Name</label>
                <div class="col-md-10">
                  {{Form::text('name',"",['class'=>'form-control'])}}
                </div>
            </div>

        <div class="form-group">
            <label class="control-label col-md-2">Key</label>
            <div class="col-md-10">
              {{Form::text('groupkey',"",['class'=>'form-control'])}}
            </div>
        </div>


        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <button type="submit" class="btn btn-success create"><i class="fa fa-save"></i> Create</button>
            </div>
        </div>
    </div>
{{Form::close()}}
@stop
