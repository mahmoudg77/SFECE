@extends('layouts.app')

@section('content')
<div class="alert alert-danger">
{{$data['title']}} - {{$data['name']}}
</div>
@endsection
