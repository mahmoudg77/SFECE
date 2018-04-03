  {{Form::model($post, ['route' => ['Post.update', $post],"method"=>"PUT"])}}
  {{Form::text("title")}}
  {{Form::textarea("body")}}
  {{Form::ymd('pub_date',$post->pub_date)}}
  {{Form::submit("Save")}}
  {{Form::close()}}
