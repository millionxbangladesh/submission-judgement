@props(['section'=>'Section Name','title'=>'title'])

<div class="d-flex justify-content-between pb-4">
    <h4 class="fw-bold mt-3"><span class="text-muted fw-light">{{$section}} /</span> {{$title}} </h4>
    {{$slot}}
</div>
