@props([
    'icon'=>'home',
    'route'=>'dashboard'
])
@php
    $isActive = request()->routeIs($route);
@endphp
<li class="sidebar-item {{$isActive ?'active':''}}">
    <a class="sidebar-link" href="{{route($route)}}">
        <i class="align-middle bx {{$icon}}"></i> <span class="align-middle">{{$slot}}</span>
    </a>
</li>


