<div class="card mb-4">
    <div class="card-body">
        @if(isset($title))
            <h5 class="card-title">{{$title}}</h5>
        @endif
        @isset($subTitle)
            <h6 class="card-subtitle text-muted">{{$subTitle}}</h6>
        @endisset

        {{$slot}}
    </div>
    @isset($footer)
        <div class="card-footer">
            {{$footer}}
        </div>
    @endisset
</div>

<style>
    .card-subtitle{
        font-size: 12px;
    }
</style>
