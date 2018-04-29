
@extends('layouts.admin')
@section('content')
<div class="">
  <a class="btn btn-success pull-right addnew" href="{{route('cp.category.create')}}">Create New</a>
  <div class="clearfix"></div>
</div>
  <div class="list-group" >
      @foreach($data as $item)
      @if(count($item->Chields)>0)
      <div>
        <a href="#{{$item->id}}" class="list-group-item" data-toggle="collapse">
          <i class="glyphicon glyphicon-chevron-right"></i>{{$item->title}}
        </a>
      @else
        <div class="list-group-item">{{$item->title}}
          <div class="col col-sm-4 pull-right">
             {!!Func::actionLinks('category',$item->id,".list-group-item")!!}
          </div>
            <div class="clearfix"></div>
        </div>
      @endif
      @if(count($item->Chields)>0)
        <div class="list-group collapse" id="{{$item->id}}">
          @foreach($item->Chields as $subitem)
          <div  class="list-group-item">{{$subitem->title}}
              <div class="col col-sm-4 pull-right">
                {!!Func::actionLinks('category',$subitem->id,".list-group-item")!!}
              </div>
              <div class="clearfix"></div>
          </div>
          @endforeach
        </div>
      @endif
      <div class="col col-sm-4 pull-right">
        {!!Func::actionLinks('category',$item->id,".list-group-item")!!}
      </div>
    </div>
      @endforeach
    </div>

@endsection
@section('css')
<style>
.just-padding {
  padding: 15px;
}

.list-group.list-group-root {
  padding: 0;
  overflow: hidden;
}

.list-group.list-group-root .list-group {
  margin-bottom: 0;
}

.list-group.list-group-root .list-group-item {
  border-radius: 0;
  border-width: 1px 0 0 0;

}

.list-group.list-group-root > .list-group-item:first-child {
  border-top-width: 0;
}

.list-group.list-group-root > .list-group > .list-group-item {
  padding-left: 30px;
}

.list-group.list-group-root > .list-group > .list-group > .list-group-item {
  padding-left: 45px;
}

.list-group-item .glyphicon {
  margin-right: 5px;
}
</style>
@endsection
