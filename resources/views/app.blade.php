<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title inertia>{{ config('app.name', 'NSAC') }}</title>
        <meta property="og:title" content="NASA Space Apps Challenge Bangladesh">
        <meta name="description" content="Embark on an extraordinary journey with the NASA International Space Apps Challenge, where innovation meets collaboration, and boundaries are surpassed.">
        <meta property="og:description" content="Embark on an extraordinary journey with the NASA International Space Apps Challenge, where innovation meets collaboration, and boundaries are surpassed.">
        <meta property="keywords" content="nasa,nsac,apps, challenge, nasa challenge, nasa apps, nasa bangladesh">
        <meta property="og:url" content="https://nsac.basis.org.bd">
        <link rel="icon" type="image/x-icon" href="/uploads/images/logo.png">
        <link rel="stylesheet" href="{{asset('plugins/fontawesome/css/all.min.css')}}">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bai+Jamjuree:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
        <!-- Scripts -->
        @routes
        @vite(['resources/js/app.js', "resources/js/Pages/{$page['component']}.vue"])
        @inertiaHead
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());
            gtag('config', 'G-WVYQ4T00HP');
        </script>
    </head>
    <body class="font-sans antialiased" style="margin-bottom: 0!important;">
        @inertia
    </body>
</html>
