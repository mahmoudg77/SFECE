@extends('dashboard.index')
@section('title', 'Categories')
@section('content')
{{-- @include('cpanel.Category.create') --}}

<div class="panel panel-default">
  <div class="panel-heading main-color-bg">
    <h3 class="panel-title">Categories 
      <span class="pull-right" style="position: absolute;right: 23px;top: 2px;">
        <a class="btn btn-link" href="category/create"><span class="glyphicon glyphicon-plus" style="color:#fff;"></span></a>
      </span>
    </h3>
  </div>
  <div class="panel-body">
    <table class="table table-striped table-hover">
          <tr>
            <th>Title</th>
            <th>Main Parent</th>
            <th>Active</th>
            <th>Status</th>
            {{-- <th>Ordering</th> --}}
            <th>Created At</th>
            <th></th>
            <th></th>
          </tr>
          @foreach($allcategory as $cat)
          <tr>
              <td>{{ $cat->title }}</td>
              <td>{{ ($cat->parent_id == 0)?'root': $cat->title }}</td>
              <td><span class="glyphicon glyphicon-{{ ($cat->active == 1)?'ok':'remove'}}" aria-hidden="true"></span></td>
              <td><span class="glyphicon glyphicon-{{ ($cat->status == 1)?'ok':'remove'}}" aria-hidden="true"></span></td>
              {{-- <td>{{ $cat->ordering }}</td> --}}
              <td>{{ $cat->created_at }}</td>
              <td><a class="btn btn-success btn-sm" href="category/{{ $cat->id }}/edit">Edit</a></td>
              <td>
                  {!! Form::open(['method'=>'DELETE', 'route'=>['admin.category.destroy', $cat->id]]) !!}
                    {!! Form::submit('Delete', ['class'=>'btn btn-danger btn-sm']) !!}
                  {!! Form::close() !!}
              </td>

          </tr>
          @endforeach
        </table>
        <div class="paginations col-lg-12">
          <div class="pull-right">{!! $allcategory->render() !!}</div>
        </div>
  </div>
  </div>

</div>
<style>
  .paginations {border-top: 1px solid #eee;}
  .pagination > .active > span{
    background-color: #d9534f !important;
    border-color: #d9534f !important;
  }
</style>
@stop
