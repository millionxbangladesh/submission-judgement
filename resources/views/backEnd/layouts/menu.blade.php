<style>
    .logo-container {
        //background-color: #999bfe;
        border-radius: 10px;
        display: flex;
        width: 150px;
        justify-content: center;
    }

</style>
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo mt-3 mb-3">
        <a href="" class="app-brand-link" target="_blank">
            <div class="logo-container">
            <img src="{{asset('assets/img/logo.png')}}" style="height: 80px">
            </div>
        </a>
        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
            <i class="bx bx-chevron-left bx-sm align-middle"></i>
        </a>
    </div>
    <div class="menu-inner-shadow"></div>
    <ul class="menu-inner py-1">
        @if(Auth::user()->role ===1)
            <!-- Applications -->
            <li class="menu-item {{request()->routeIs('application.index')?'active':''}}">
                <a href="{{route('application.index',['year'=>date('Y')])}}" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-list-ul"></i>
                    Applications
                </a>
            </li>

            <li class="menu-item {{request()->routeIs('room.index')?'active':''}}">
                <a href="{{route('room.index')}}" class="menu-link">
                    <i class="menu-icon tf-icons bx  bx-building-house"></i>
                    Room
                </a>
            </li>
            <li class="menu-item {{request()->routeIs('result.index')?'active':''}}">
                <a href="{{route('result.index')}}" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-bar-chart-alt-2"></i>
                    Results
                </a>
            </li>
            <!--Menu Header-->
            <x-tools.menu-header title="Settings"/>
            <!-- Profile -->
            <li class="menu-item {{request()->routeIs('profile.edit')?'active':''}}">
                <a href="{{route('profile.edit')}}" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-user-circle"></i>
                    Profile
                </a>
            </li>
            {{--  <li class="menu-item {{request()->routeIs('site.config')?'active':''}}">
                <a href="{{route('site.config')}}" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-cog"></i>
                    Site Config
                </a>
            </li>  --}}
            <li class="menu-item {{request()->routeIs('users.index')?'active':''}}">
                <a href="{{route('users.index')}}" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-cog"></i>
                    User Management
                </a>
            </li>
            @elseif(Auth::user()->role===2)
            <!-- Dashboard -->
            <!-- Dashboard -->
            <li class="menu-item {{request()->routeIs('dashboard')?'active':''}}">
                <a href="{{route('dashboard')}}" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-home-circle"></i>
                    Dashboard
                </a>
            </li>
            <!-- Applications -->
            <li class="menu-item {{request()->routeIs('application.index')?'active':''}}">
                <a href="{{route('application.index')}}" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-list-ul"></i>
                    Applications
                </a>
            </li>
            <li class="menu-item {{request()->routeIs('room.index')?'active':''}}">
                <a href="{{route('room.index')}}" class="menu-link">
                    <i class="menu-icon tf-icons bx  bx-building-house"></i>
                    Room
                </a>
            </li>
            <li class="menu-item {{request()->routeIs('users.index')?'active':''}}">
                <a href="{{route('users.index')}}" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-cog"></i>
                    User Management
                </a>
            </li>
            <li class="menu-item {{request()->routeIs('result.result')?'active':''}}">
                <a href="{{route('result.result')}}" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-bar-chart-alt-2"></i>
                    Results
                </a>
            </li>
        @elseif(Auth::user()->role===3)
            <!-- Dashboard -->
            <li class="menu-item {{request()->routeIs('volunteer.index')?'active':''}}">
                <a href="{{route('volunteer.index')}}" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-sitemap"></i>
                    Teams
                </a>
            </li>
        @elseif (Auth::user()->role===4)
            <!-- Dashboard -->
            <li class="menu-item {{request()->routeIs('judge.index')?'active':''}}">
                <a href="{{route('judge.index')}}" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-sitemap"></i>
                    Teams
                </a>
            </li>
        @endif
    </ul>
</aside>
