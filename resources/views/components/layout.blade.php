<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="shortcut icon" href="img/icons/icon-48x48.png"/>
    <link rel="canonical" href=""/>
    <title>{{$title??'Dashboard'}} - NASA Space Apps Challenge Bangladesh</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('backEnd/boxicons/css/boxicons.min.css')}}">
    @vite('resources/css/app.scss')
    <style>
        .bx{
            font-size: 18px;
        }
        .sidebar-link i, .sidebar-link svg, a.sidebar-link i, a.sidebar-link svg {
            margin-right: 0.30rem;
        }
    </style>
    @stack('style')
</head>

<body>
<div class="wrapper">
    @include('backEnd.shared.sidebar')
    <div class="main">
        @include('backEnd.shared.navbar')
        <main class="content">
            <div class="container-fluid p-0">
                {{$slot}}
            </div>
        </main>
        @include('backEnd.shared.footer')
    </div>
</div>
<script src="{{asset("backEnd/js/app.js")}}"></script>
@stack('script')
</body>

</html>
