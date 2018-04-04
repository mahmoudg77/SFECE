

@if($ajax)
          @extends('layouts.app')

          @section('content')
@endif

  {{Form::model($post, ['route' => ['Post.update', $post],"method"=>"PUT"])}}
  {{Form::text("title")}}
  {{Form::textarea("body")}}
  {{Form::ymd('pub_date',$post->pub_date)}}
  {{Form::submit("Save")}}
  {{Form::close()}}

@if($ajax)
  @endsection
@endif
