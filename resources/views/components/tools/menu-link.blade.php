@props(['active','link','toggle'=>false])

@php
    $classes = ($active ?? false)
                ? 'menu-item active'
                : 'menu-item';
@endphp
<a class="menu-link">
    <i class="menu-icon tf-icons bx bx-home-circle"></i>
    <div data-i18n="Analytics">Dashboard</div>
</a>
