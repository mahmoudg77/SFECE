<div class="col-xs-hidden col-sm-12">
        <div class="single-sidebar">
            <div class="single-cat">
                <h4>{{trans('app.categories')}}</h4>
                <ul class="list-group">
                    @foreach($allcats as $cat)
                        <li class="list-group-item">
                            <a href="{{route('getPostsByCatID', $cat->id)}}">{{ $cat->title}}</a>
                        </li>
                    @endforeach
                </ul>
            </div>

            <div class="single-cat">
                <h4>{{trans('app.last articles')}}</h4>
                <ul class="list-group">
                    @foreach($lastPosts as $lastpost)
                        <li class="list-group-item">
                            <a href="{{ route('getPostBySlug', $lastpost->slug)}}">{{ $lastpost->title}}</a></li>
                    @endforeach
                </ul>
            </div>

            <div class="single-cat">
                <h4>{{trans('app.follow facebook')}}</h4>
                <ul class="list-group">
                    
                </ul>
            </div>
        </div>
    </div>