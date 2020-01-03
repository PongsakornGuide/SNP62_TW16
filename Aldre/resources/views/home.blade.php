@extends('layouts.app')
@section('content')
<!-- Page Container -->
<div class="page-container">
    <!-- Page Sidebar -->
    <div class="page-sidebar">
        <div class="profile-menu">
            <a href="app-profile.html">
{{--                <img src="../theme/assets/images/avatars/avatar1.png" alt="">--}}
            </a>
        </div>
        <div class="page-sidebar-inner">
            <div class="page-sidebar-menu">
                <ul>
                    <li>
                        <a href="#" data-toggle="tooltip" data-placement="right" title="Dashboard"><i class="fas fa-rocket"></i></a>
                    </li>
                    <li>
                        <a href="#" data-toggle="tooltip" data-placement="right" title="News"><i class="fas fa-globe-africa"></i></a>
                    </li>
                    <li>
                        <a href="#" data-toggle="tooltip" data-placement="right" title="Inbox"><i class="fas fa-inbox"></i></a>
                    </li>
                    <li>
                        <a href="#" data-toggle="tooltip" data-placement="right" title="Chat"><i class="far fa-comments"></i></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="settings-menu-btn">
            <a href="#" class="settings-menu-link"><i class="fas fa-wrench"></i></a>
        </div>
    </div><!-- /Page Sidebar -->
    <div class="settings-sidebar">
        <div class="settings-sidebar-content">
            <div class="settings-sidebar-header">
                <span>Settings</span>
                <a href="javascript: void(0);" class="settings-menu-close"><i class="icon-close"></i></a>
            </div>
            <div class="right-sidebar-settings">
                <span class="settings-title">General Settings</span>
                <ul class="sidebar-setting-list list-unstyled">
                    <li>
                        <span class="settings-option">Notifications</span><input type="checkbox" class="js-switch" checked />
                    </li>
                    <li>
                        <span class="settings-option">Activity log</span><input type="checkbox" class="js-switch" checked />
                    </li>
                    <li>
                        <span class="settings-option">Automatic updates</span><input type="checkbox" class="js-switch" />
                    </li>
                    <li>
                        <span class="settings-option">Allow backups</span><input type="checkbox" class="js-switch" />
                    </li>
                </ul>
                <span class="settings-title">Account Settings</span>
                <ul class="sidebar-setting-list list-unstyled">
                    <li>
                        <span class="settings-option">Chat</span><input type="checkbox" class="js-switch" checked />
                    </li>
                    <li>
                        <span class="settings-option">Incognito mode</span><input type="checkbox" class="js-switch" />
                    </li>
                    <li>
                        <span class="settings-option">Public profile</span><input type="checkbox" class="js-switch" />
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="settings-overlay"></div>


    <!-- Page Content -->
    <div class="page-content">
        <div class="secondary-sidebar" style="position: fixed;
  top: 0;overflow: hidden;">
            <div class="secondary-sidebar-bar">
                <a href="#" class="logo-box">Aldre</a>
            </div>
            <div class="secondary-sidebar-menu">
                <ul class="accordion-menu">
{{--                    @role('admin')--}}
                    <li>
                        <a href="<?php echo url('/') ?>">
                            <i class="menu-icon icon-home4"></i><span>User</span>
                        </a>
                    </li>
{{--                    @endrole--}}

{{--                    @can('addpost')--}}
{{--                        <p>สำหรับคน post</p>--}}
{{--                    @endcan--}}

                    <li>
                        <a href="<?php echo url('activity') ?>">
                            <i class="menu-icon icon-code"></i><span>Activity</span>
                        </a>
                    </li>


                    <li>
                        <a href="#intro">
                            <i class="menu-icon icon-layers"></i><span>Disease</span>
                        </a>
                    </li>

                    <li>
                        <a href="#intro">
                            <i class="menu-icon icon-format_paint"></i><span>Emergency</span>
                        </a>
                    </li>

{{--                    <li>--}}
{{--                        <a href="javascript:void(0)">--}}
{{--                            <i class="menu-icon icon-code"></i><span>Add Post</span><i class="accordion-icon fas fa-angle-left"></i>--}}
{{--                        </a>--}}
{{--                        <ul class="sub-menu">--}}
{{--                            <li><a href="#folder-structure">Folder Structure</a></li>--}}
{{--                            <li><a href="#html-structure">HTML Structure</a></li>--}}
{{--                        </ul>--}}
{{--                    </li>--}}
{{--                    <li>--}}
{{--                        <a href="javascript:void(0)">--}}
{{--                            <i class="menu-icon icon-format_paint"></i><span>Edit Post</span><i class="accordion-icon fas fa-angle-left"></i>--}}
{{--                        </a>--}}
{{--                        <ul class="sub-menu">--}}
{{--                            <li><a href="#code">Code</a></li>--}}
{{--                            <li><a href="#fonts">Fonts</a></li>--}}
{{--                            <li><a href="#colors">Colors</a></li>--}}
{{--                            <li><a href="#utilities">CSS Utilities</a></li>--}}
{{--                        </ul>--}}
{{--                    </li>--}}
{{--                    <li>--}}
{{--                        <a href="javascript:void(0)">--}}
{{--                            <i class="menu-icon icon-layers"></i><span>Layouts</span><i class="accordion-icon fas fa-angle-left"></i>--}}
{{--                        </a>--}}
{{--                        <ul class="sub-menu">--}}
{{--                            <li><a href="#layout-settings">Layout Settings</a></li>--}}
{{--                            <li><a href="#collapsed-sidebar">Collapsed Sidebar</a></li>--}}
{{--                            <li><a href="#fixed-sidebar">Fixed Sidebar</a></li>--}}
{{--                            <li><a href="#fixed-header">Fixed Header</a></li>--}}
{{--                        </ul>--}}
{{--                    </li>--}}
{{--                    <li>--}}
{{--                        <a href="#new-page">--}}
{{--                            <i class="menu-icon material-icons">create</i><span>New Page</span>--}}
{{--                        </a>--}}
{{--                    </li>--}}
{{--                    <li>--}}
{{--                        <a href="#references">--}}
{{--                            <i class="menu-icon icon-copyright"></i><span>References</span>--}}
{{--                        </a>--}}
{{--                    </li>--}}
{{--                    <li>--}}
{{--                        <a href="#support">--}}
{{--                            <i class="menu-icon icon-near_me"></i><span>Support</span>--}}
{{--                        </a>--}}
{{--                    </li>--}}
                </ul>
            </div>
        </div>


        <!-- Page Header -->
        <div class="page-header">
            <div class="search-form">
                <form action="#" method="GET">
                    <div class="input-group">
                        <input type="text" name="search" class="form-control search-input" placeholder="Type something...">
                        <span class="input-group-btn">
                                    <button class="btn btn-default" id="close-search" type="button"><i class="icon-close"></i></button>
                                </span>
                    </div>
                </form>
            </div>
            <nav class="navbar navbar-default navbar-expand-md">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <div class="logo-sm">
                            <a href="javascript:void(0)" id="sidebar-toggle-button"><i class="fas fa-bars"></i></a>
                            <a class="logo-box" href="index.html"><span>concept</span></a>
                        </div>
                        <button type="button" class="navbar-toggler collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <i class="fas fa-angle-down"></i>
                        </button>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->

                    <div class="collapse navbar-collapse justify-content-between" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav mr-auto">
                            <li class="collapsed-sidebar-toggle-inv"><a href="javascript:void(0)" id="collapsed-sidebar-toggle-button"><i class="fas fa-bars"></i></a></li>
                            <li><a href="javascript:void(0)" id="toggle-fullscreen"><i class="fas fa-expand"></i></a></li>
                            <li><a href="javascript:void(0)" id="search-button"><i class="fas fa-search"></i></a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                    <ul class="nav navbar-nav">

                        <li class="nav-item d-md-block"><a href="javascript:void(0)" class="right-sidebar-toggle" data-sidebar-id="main-right-sidebar"><i class="fas fa-envelope"></i></a></li>
                        <li class="dropdown nav-item d-md-block">
                            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-bell"></i></a>
                            <ul class="dropdown-menu dropdown-menu-right dropdown-lg dropdown-content">
                                <li class="drop-title">Notifications<a href="#" class="drop-title-link"><i class="fas fa-angle-right"></i></a></li>
                                <li class="slimscroll dropdown-notifications">
                                    <ul class="list-unstyled dropdown-oc">
                                        <li>
                                            <a href="#"><span class="notification-badge bg-info"><i class="fas fa-at"></i></span>
                                                <span class="notification-info">
                                                                <span class="notification-info"><b>John Doe</b> mentioned you in a post "Update v1.5"</span>
                                                                <small class="notification-date">06:07</small>
                                                            </span></a>
                                        </li>
                                        <li>
                                            <a href="#"><span class="notification-badge bg-danger"><i class="fas fa-bolt"></i></span>
                                                <span class="notification-info">
                                                                <span class="notification-info">4 new special offers from the apps you follow!</span>
                                                                <small class="notification-date">Yesterday</small>
                                                            </span></a>
                                        </li>
                                        <li>
                                            <a href="#"><span class="notification-badge bg-success"><i class="fas fa-bullhorn"></i></span>
                                                <span class="notification-info">
                                                                <span class="notification-info">There is a meeting with <b>Ethan</b> in 15 minutes!</span>
                                                                <small class="notification-date">Yesterday</small>
                                                            </span></a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>


                        <li class="dropdown nav-item d-md-block">
                            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user"></i></a>
                            <ul class="dropdown-menu dropdown-menu-right dropdown-lg dropdown-content">
                                <li class="">
                                @if (Auth::guest())
                                    <li><a href="{{ route('login') }}">Login</a></li>
                                    <li><a href="{{ route('register') }}">Register</a></li>
                                @else
{{--                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">--}}
{{--                                        {{ Auth::user()->name }}--}}
{{--                                    </a>--}}
                                    <li>
                                        <a href="{{ route('logout') }}"
                                           onclick="event.preventDefault();
                                                                   document.getElementById('logout-form').submit();">
                                            Logout
                                        </a>
                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                            {{ csrf_field() }}
                                        </form>
                                    </li>

                                    @endif
                                </li>


                            </ul>
                        </li>



                        <li class="dropdown nav-item d-md-block">
                            <a href="#" class="nav-link dropdown-toggle" id="navbarDropdown" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
{{--                                <img src="../theme/assets/images/avatars/avatar1.png" alt="" class="rounded-circle">--}}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <li><a href="#">Profile</a></li>
                                <li><a href="#">Calendar</a></li>
                                <li><a href="#"><span class="badge float-right badge-info">64</span>Messages</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Account Settings</a></li>
                                <li><a href="#">Log Out</a></li>
                            </ul>
                        </li>

                    </ul>
                </div><!-- /.container-fluid -->
            </nav>
        </div><!-- /Page Header -->
        <!-- Page Inner -->
        <div class="page-inner no-page-title">
            <div id="main-wrapper">
                <div class="content-header">
                    <h1 class="page-title">Welcom to <span style="text-transform: uppercase;font-weight: bold;color: #8014f1;">{{Auth::user()->name}}</span>

                    </h1>

                </div>

                <div class="row">
                    <div class="col-lg-12">


                        @if(count($user_apps) > 0)
                            @foreach($user_apps as $user_app)
                        <div class="card" id="fixed-header" style="border-radius: 30px;">

                            <div class="card-body">

                                <h5 class="card-title">Name : {{$user_app->name}} {{$user_app->surname}}</h5>
                                <p>gender: <code>{{$user_app->gender}}</code></p>
                                <p>Birthday : <code>{{$user_app->birthday}}</code></p>
                                <p>Tel : <code>{{$user_app->tel}}</code></p>

{{--                                <p class="no-m">You can use fixed header by adding <code>page-header-fixed</code> class to <code>body</code>.</p>--}}
{{--                               @role('admin')--}}
{{--                                @endrole--}}


                                @can('manageuser')
                                    <button type="button" class="btn btn-warning" style="color: white;">Manageuser</button>
                                @endcan

                                @can('addpost')
                                <button type="button" class="btn btn-success">Addpost</button>
                                @endcan

                                @can('editpost')
                                <button type="button" class="btn btn-primary">Edit</button>
                                @endcan

                                @can('deletepost')
                                <button type="button" class="btn btn-danger">Delete</button>
                                @endcan

                                @can('viewpost')
                                    <button type="button" class="btn btn-info">View</button>
                                @endcan

                            </div>

                        </div>

                            @endforeach
                        @endif

{{--                        <div class="card" id="code">--}}
{{--                            <div class="card-body">--}}
{{--                                <h5 class="card-title">Code</h5>--}}
{{--                                <p class="no-m">All theme CSS files are located in <code>theme/assets/css</code> folder. For your CSS customization you can use <code>theme/assets/css/custom.css</code>. Keep your custom CSS separate it makes more easier when updating the theme in future.<br><br>All Javascript files are located in <code>source/assets/js/</code> folder. Also Page-level Javascript files are located in <code>theme/assets/js/pages/</code> folder and each page has its own Javascript file. For your Javascripts you can use <code>theme/assets/js/custom.js</code>. Keep your custom Javascript separate it makes more easier when updating the theme in future.</p>--}}
{{--                            </div>--}}
{{--                        </div>--}}


{{--                        <div class="card" id="fonts">--}}
{{--                            <div class="card-body">--}}
{{--                                <h5 class="card-title">Fonts</h5>--}}
{{--                                <p>concept uses Rubik font. It must be loaded in HTML Head before other CSS files.<br>--}}

{{--                                    Font code example:</p>--}}
{{--                                <pre>&lt;link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet"&gt;</pre>--}}
{{--                                <p class="no-m">concept also uses IcoMoon, Material and Fontawesome icons.</p>--}}
{{--                            </div>--}}
{{--                        </div>--}}


{{--                        <div class="card" id="colors">--}}
{{--                            <div class="card-body">--}}
{{--                                <h5 class="card-title">Colors</h5>--}}
{{--                                <p>concept comes with 8 color palettes for creating colorful widgets and elements.</p>--}}
{{--                                <div class="row">--}}
{{--                                    <div class="col-md-3">--}}
{{--                                        <div class="color-pallete">--}}
{{--                                            <div class="color-item bg-primary light">--}}
{{--                                                <span>#9866fa</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-primary">--}}
{{--                                                <span>#844FF1</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-primary dark">--}}
{{--                                                <span>#743fe0</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item">--}}
{{--                                                <code>.bg-primary</code>--}}
{{--                                            </div>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                    <div class="col-md-3">--}}
{{--                                        <div class="color-pallete">--}}
{{--                                            <div class="color-item bg-success light">--}}
{{--                                                <span>#71e377</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-success">--}}
{{--                                                <span>#61CD66</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-success dark">--}}
{{--                                                <span>#49b34e</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item">--}}
{{--                                                <code>.bg-success</code>--}}
{{--                                            </div>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                    <div class="col-md-3">--}}
{{--                                        <div class="color-pallete">--}}
{{--                                            <div class="color-item bg-info light">--}}
{{--                                                <span>#6badff</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-info">--}}
{{--                                                <span>#4897FB</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-info dark">--}}
{{--                                                <span>#398df7</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item">--}}
{{--                                                <code>.bg-info</code>--}}
{{--                                            </div>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                    <div class="col-md-3">--}}
{{--                                        <div class="color-pallete">--}}
{{--                                            <div class="color-item bg-warning light">--}}
{{--                                                <span>#ffdf52</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-warning">--}}
{{--                                                <span>#EDCC3D</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-warning dark">--}}
{{--                                                <span>#dbbc32</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item">--}}
{{--                                                <code>.bg-warning</code>--}}
{{--                                            </div>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                                <div class="row">--}}
{{--                                    <div class="col-md-3">--}}
{{--                                        <div class="color-pallete">--}}
{{--                                            <div class="color-item bg-danger light">--}}
{{--                                                <span>#f77481</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-danger">--}}
{{--                                                <span>#ED5160</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-danger dark">--}}
{{--                                                <span>#e34454</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item">--}}
{{--                                                <code>.bg-danger</code>--}}
{{--                                            </div>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                    <div class="col-md-3">--}}
{{--                                        <div class="color-pallete">--}}
{{--                                            <div class="color-item bg-dark light">--}}
{{--                                                <span>#434a52</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-dark">--}}
{{--                                                <span>#343A40</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-dark dark">--}}
{{--                                                <span>#272d33</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item">--}}
{{--                                                <code>.bg-dark</code>--}}
{{--                                            </div>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                    <div class="col-md-3">--}}
{{--                                        <div class="color-pallete">--}}
{{--                                            <div class="color-item bg-gray light">--}}
{{--                                                <span>#D7D7D7</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-gray">--}}
{{--                                                <span>#CCCCCC</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-gray dark">--}}
{{--                                                <span>#B9B9B9</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item">--}}
{{--                                                <code>.bg-gray</code>--}}
{{--                                            </div>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                    <div class="col-md-3">--}}
{{--                                        <div class="color-pallete">--}}
{{--                                            <div class="color-item bg-light light">--}}
{{--                                                <span>#F9F9F9</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-light">--}}
{{--                                                <span>#F1F1F1</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item bg-light dark">--}}
{{--                                                <span>#E5E5E5</span>--}}
{{--                                            </div>--}}
{{--                                            <div class="color-item">--}}
{{--                                                <code>.bg-light</code>--}}
{{--                                            </div>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </div>--}}

{{--                        <div class="card" id="utilities">--}}
{{--                            <div class="card-body">--}}
{{--                                <h5 class="card-title">CSS Utilities</h5>--}}
{{--                                <p>All available Helper Classes in concept:</p>--}}
{{--                                <div class="table-responsive">--}}
{{--                                    <table class="table">--}}
{{--                                        <thead>--}}
{{--                                        <tr>--}}
{{--                                            <th></th>--}}
{{--                                            <th>Prefix</th>--}}
{{--                                            <th>Second Prefix (side)</th>--}}
{{--                                            <th>third Prefix</th>--}}
{{--                                            <th>Suffix (value)</th>--}}
{{--                                        </tr>--}}
{{--                                        </thead>--}}
{{--                                        <tbody>--}}
{{--                                        <tr>--}}
{{--                                            <td>Margin</td>--}}
{{--                                            <td>m</td>--}}
{{--                                            <td>t,r,b,l</td>--}}
{{--                                            <td>n (only for negative values)</td>--}}
{{--                                            <td>xxs, xs, sm, md, lg, xxl</td>--}}
{{--                                        </tr>--}}
{{--                                        <tr>--}}
{{--                                            <td>Padding</td>--}}
{{--                                            <td>p</td>--}}
{{--                                            <td>v,h (top &amp; bottom, left &amp; right)</td>--}}
{{--                                            <td></td>--}}
{{--                                            <td>xxs, xs, sm, md, lg, xxl</td>--}}
{{--                                        </tr>--}}
{{--                                        </tbody>--}}
{{--                                    </table>--}}
{{--                                </div>--}}
{{--                                <p><code>.no-s</code> Removes margins &amp; paddings</p>--}}
{{--                                <p><code>.no-m</code> Removes margins</p>--}}
{{--                                <p><code>.no-p</code> Removes paddings</p>--}}
{{--                                <p><code>.no-p-h</code> Removes paddings from left &amp; right</p>--}}
{{--                                <p><code>.no-p-v</code> Removes Paddings from top &amp; bottom</p>--}}
{{--                                <hr>--}}
{{--                                <p><code>.no-b</code> Removes borders</p>--}}
{{--                                <p><code>.b</code> Adds border from all sides</p>--}}
{{--                                <p><code>.b-t</code>, <code>.b-r</code>, <code>.b-b</code>, <code>.b-l</code> Adds border from top, right, bottom, left</p>--}}
{{--                                <p><code>.b-default</code>, <code>.b-primary</code>, <code>.b-success</code>, <code>.b-info</code>, <code>.b-warning</code>, <code>.b-danger</code> Adds border by contextual colors, see <a href="#colors">colors</a> doc.</p>--}}
{{--                                <p><code>.b-2</code>, <code>.b-3</code>, <code>.b-4</code> Border size</p>--}}
{{--                                <p><code>.b-n-t</code>, <code>.b-n-r</code>, <code>.b-n-b</code>, <code>.b-n-l</code> Removes border from  top, right, bottom, left</p>--}}
{{--                                <hr>--}}
{{--                                <p><code>.no-r</code> Removes border radius</p>--}}
{{--                                <p><code>.r</code> Adds border radius</p>--}}
{{--                                <p><code>.r-t-l</code>, <code>.r-t-r</code>, <code>.r-b-l</code>, <code>.r-b-r</code> Adds border radius From top-left, top-right, bottom-left, bottom-right sides.</p>--}}
{{--                                <p class="no-m"><code>.no-r-t-l</code>, <code>.no-r-t-r</code>, <code>.no-r-b-l</code>, <code>.no-r-b-r</code> Removes border radius From top-left, top-right, bottom-left, bottom-right sides.</p>--}}
{{--                            </div>--}}
{{--                        </div>--}}


{{--                        <div class="card" id="layout-settings">--}}
{{--                            <div class="card-body">--}}
{{--                                <h5 class="card-title">Layout Settings</h5>--}}
{{--                                <p class="no-m">concept provides very easy way to change layout on all the pages, you just need to set false/true values to layout variables in <code>theme/assets/js/concept.min.js</code>. Read next to see how to change layout on a specific page.</p>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                        <div class="card" id="collapsed-sidebar">--}}
{{--                            <div class="card-body">--}}
{{--                                <h5 class="card-title">Collapsed Sidebar</h5>--}}
{{--                                <p class="no-m">You can use collapsed sidebar by adding <code>collapsed-sidebar</code> class to <code>body</code>.</p>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                        <div class="card" id="fixed-sidebar">--}}
{{--                            <div class="card-body">--}}
{{--                                <h5 class="card-title">Fixed Sidebar</h5>--}}
{{--                                <p class="no-m">You can use fixed sidebar by adding <code>page-sidebar-fixed</code> class to <code>body</code>.</p>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                        <div class="card" id="fixed-header">--}}
{{--                            <div class="card-body">--}}
{{--                                <h5 class="card-title">Fixed Header</h5>--}}
{{--                                <p class="no-m">You can use fixed header by adding <code>page-header-fixed</code> class to <code>body</code>.</p>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                        <div class="card" id="new-page">--}}
{{--                            <div class="card-body">--}}
{{--                                <h5 class="card-title">New Page</h5>--}}
{{--                                <p class="no-m">It's very easy to create a new page with Concept.<br><br>First of all you have to copy <code>layout-blank.html</code> file and rename it as you want, then you have to choose layouts change them as explained previously. then you can start creating content of page, you can use all components that are shown in the live preview. Note, all content should be placed in <code>.page-inner</code> to fit the page correctly.<br><br>If you will use component that needs some JS codes which are included in component demo page at the end of the HTML body tag, you can just include the same JS file. If you will use component that needs an extra plugin to work, you have to include files of this plugins as they are included in the preview page.</p>--}}
{{--                            </div>--}}
{{--                        </div>--}}

{{--                        <div class="card" id="references">--}}
{{--                            <div class="card-body">--}}
{{--                                <h5 class="card-title">References</h5>--}}
{{--                                <div class="table-responsive">--}}
{{--                                    <table class="table">--}}
{{--                                        <thead>--}}
{{--                                        <tr>--}}
{{--                                            <th>Plugin</th>--}}
{{--                                            <th>Official Website</th>--}}
{{--                                        </tr>--}}
{{--                                        </thead>--}}
{{--                                        <tbody>--}}
{{--                                        <tr>--}}
{{--                                            <td>Apex Charts</td>--}}
{{--                                            <td><a href="https://apexcharts.com/">https://apexcharts.com/</a></td>--}}
{{--                                        </tr>--}}
{{--                                        <tr>--}}
{{--                                            <td>Bootstrap</td>--}}
{{--                                            <td><a href="http://getbootstrap.com/">http://getbootstrap.com/</a></td>--}}
{{--                                        </tr>--}}
{{--                                        <tr>--}}
{{--                                            <td>Chartjs</td>--}}
{{--                                            <td><a href="http://www.chartjs.org/">http://www.chartjs.org/</a></td>--}}
{{--                                        </tr>--}}
{{--                                        <tr>--}}
{{--                                            <td>Image Cropper</td>--}}
{{--                                            <td><a href="http://fengyuanchen.github.io/cropper/">http://fengyuanchen.github.io/cropper/</a></td>--}}
{{--                                        </tr>--}}
{{--                                        <tr>--}}
{{--                                            <td>jQuery elevateZoom</td>--}}
{{--                                            <td><a href="www.elevateweb.co.uk/image-zoom/">www.elevateweb.co.uk/image-zoom/</a></td>--}}
{{--                                        </tr>--}}
{{--                                        <tr>--}}
{{--                                            <td>FontAwesome</td>--}}
{{--                                            <td><a href="http://fontawesome.io/">http://fontawesome.io/</a></td>--}}
{{--                                        </tr>--}}
{{--                                        <tr>--}}
{{--                                            <td>IcoMoon</td>--}}
{{--                                            <td><a href="http://icomoon.io/">http://icomoon.io/</a></td>--}}
{{--                                        </tr>--}}
{{--                                        <tr>--}}
{{--                                            <td>Jquery</td>--}}
{{--                                            <td><a href="https://jquery.com/">https://jquery.com/</a></td>--}}
{{--                                        </tr>--}}
{{--                                        <tr>--}}
{{--                                            <td>Slimscroll</td>--}}
{{--                                            <td><a href="http://rocha.la/jQuery-slimScroll/">http://rocha.la/jQuery-slimScroll/</a></td>--}}
{{--                                        </tr>--}}
{{--                                        <tr>--}}
{{--                                            <td>Switchery</td>--}}
{{--                                            <td><a href="http://abpetkov.github.io/switchery/">http://abpetkov.github.io/switchery/</a></td>--}}
{{--                                        </tr>--}}
{{--                                        <tr>--}}
{{--                                            <td>Select2</td>--}}
{{--                                            <td><a href="https://select2.org/">https://select2.org/</a></td>--}}
{{--                                        </tr>--}}
{{--                                        <tr>--}}
{{--                                            <td>Plupload</td>--}}
{{--                                            <td><a href="https://www.plupload.com/">https://www.plupload.com/</a></td>--}}
{{--                                        </tr>--}}
{{--                                        </tbody>--}}
{{--                                    </table>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </div>--}}

{{--                        <div class="card" id="support">--}}
{{--                            <div class="card-body">--}}
{{--                                <h5 class="card-title">Support</h5>--}}
{{--                                <p class="no-m">Once again, thank you so much for purchasing this theme. As I said at the beginning, I'd be glad to help you if you have any questions relating to this theme. No guarantees, but I'll do my best to assist. If you have a more general question relating to the themes on ThemeForest, you might consider visiting the forums and asking your question in the "Item Discussion" section.</p>--}}
{{--                            </div>--}}
{{--                        </div>--}}
                    </div>
                </div>
            </div><!-- Main Wrapper -->


{{--            <div class="page-footer">--}}
{{--                <p>2019 &copy; stacks</p>--}}
{{--            </div>--}}
        </div><!-- /Page Inner -->

{{--        <div class="page-right-sidebar" id="main-right-sidebar">--}}
{{--            <div class="page-right-sidebar-inner">--}}
{{--                <div class="right-sidebar-top">--}}
{{--                    <span class="chat-header">Chat</span>--}}
{{--                    <a href="javascript:void(0)" class="right-sidebar-toggle right-sidebar-close" data-sidebar-id="main-right-sidebar"><i class="icon-close"></i></a>--}}
{{--                </div>--}}
{{--                <div class="right-sidebar-content">--}}
{{--                    <!-- Tab panes -->--}}
{{--                    <div class="chat-list">--}}
{{--                        <span class="chat-title">Recent</span>--}}
{{--                        <a href="javascript:void(0);" class="right-sidebar-toggle chat-item unread" data-sidebar-id="chat-right-sidebar">--}}
{{--                            <div class="user-avatar">--}}
{{--                                <img src="../theme/assets/images/avatars/avatar1.png" alt="">--}}
{{--                            </div>--}}
{{--                            <div class="chat-info">--}}
{{--                                <span class="chat-author">David</span>--}}
{{--                                <span class="chat-text">Hello there!</span>--}}
{{--                                <span class="chat-time">16:20</span>--}}
{{--                            </div>--}}
{{--                        </a>--}}
{{--                        <a href="javascript:void(0);" class="right-sidebar-toggle chat-item unread active-user" data-sidebar-id="chat-right-sidebar">--}}
{{--                            <div class="user-avatar">--}}
{{--                                <img src="../theme/assets/images/avatars/avatar2.png" alt="">--}}
{{--                            </div>--}}
{{--                            <div class="chat-info">--}}
{{--                                <span class="chat-author">Bob</span>--}}
{{--                                <span class="chat-text">Hello there!</span>--}}
{{--                                <span class="chat-time">11:34</span>--}}
{{--                            </div>--}}
{{--                        </a>--}}
{{--                    </div>--}}
{{--                    <div class="chat-list">--}}
{{--                        <span class="chat-title">Older</span>--}}
{{--                        <a href="javascript:void(0);" class="right-sidebar-toggle chat-item" data-sidebar-id="chat-right-sidebar">--}}
{{--                            <div class="user-avatar">--}}
{{--                                <img src="../theme/assets/images/avatars/avatar3.png" alt="">--}}
{{--                            </div>--}}
{{--                            <div class="chat-info">--}}
{{--                                <span class="chat-author">Tom</span>--}}
{{--                                <span class="chat-text">Hello there!</span>--}}
{{--                                <span class="chat-time">2d</span>--}}
{{--                            </div>--}}
{{--                        </a>--}}
{{--                        <a href="javascript:void(0);" class="right-sidebar-toggle chat-item active-user" data-sidebar-id="chat-right-sidebar">--}}
{{--                            <div class="user-avatar">--}}
{{--                                <img src="../theme/assets/images/avatars/avatar4.png" alt="">--}}
{{--                            </div>--}}
{{--                            <div class="chat-info">--}}
{{--                                <span class="chat-author">Anna</span>--}}
{{--                                <span class="chat-text">Hello there!</span>--}}
{{--                                <span class="chat-time">4d</span>--}}
{{--                            </div>--}}
{{--                        </a>--}}
{{--                        <a href="javascript:void(0);" class="right-sidebar-toggle chat-item active-user" data-sidebar-id="chat-right-sidebar">--}}
{{--                            <div class="user-avatar">--}}
{{--                                <img src="../theme/assets/images/avatars/avatar5.png" alt="">--}}
{{--                            </div>--}}
{{--                            <div class="chat-info">--}}
{{--                                <span class="chat-author">Noah</span>--}}
{{--                                <span class="chat-text">Hello there!</span>--}}
{{--                                <span class="chat-time">&nbsp;</span>--}}
{{--                            </div>--}}
{{--                        </a>--}}
{{--                        <a href="javascript:void(0);" class="load-more-messages"  data-toggle="tooltip" data-placement="bottom" title="Load More">&bull;&bull;&bull;</a>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--            </div>--}}
{{--        </div>--}}
{{--        <div class="page-right-sidebar" id="chat-right-sidebar">--}}
{{--            <div class="page-right-sidebar-inner">--}}
{{--                <div class="right-sidebar-top">--}}
{{--                    <div class="chat-top-info">--}}
{{--                        <span class="chat-name">Noah</span>--}}
{{--                        <span class="chat-state">2h ago</span>--}}
{{--                    </div>--}}
{{--                    <a href="javascript:void(0)" class="right-sidebar-toggle chat-sidebar-close float-right" data-sidebar-id="chat-right-sidebar"><i class="icon-keyboard_arrow_right"></i></a>--}}
{{--                </div>--}}
{{--                <div class="right-sidebar-content">--}}
{{--                    <div class="right-sidebar-chat slimscroll">--}}
{{--                        <div class="chat-bubbles">--}}
{{--                            <div class="chat-start-date">02/06/2017 5:58PM</div>--}}
{{--                            <div class="chat-bubble them">--}}
{{--                                <div class="chat-bubble-img-container">--}}
{{--                                    <img src="../theme/assets/images/avatars/avatar1.png" alt="">--}}
{{--                                </div>--}}
{{--                                <div class="chat-bubble-text-container">--}}
{{--                                    <span class="chat-bubble-text">Hello</span>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                            <div class="chat-bubble me">--}}
{{--                                <div class="chat-bubble-text-container">--}}
{{--                                    <span class="chat-bubble-text">Hello!</span>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                            <div class="chat-start-date">03/06/2017 4:22AM</div>--}}
{{--                            <div class="chat-bubble me">--}}
{{--                                <div class="chat-bubble-text-container">--}}
{{--                                    <span class="chat-bubble-text">lorem</span>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                            <div class="chat-bubble them">--}}
{{--                                <div class="chat-bubble-img-container">--}}
{{--                                    <img src="../theme/assets/images/avatars/avatar1.png" alt="">--}}
{{--                                </div>--}}
{{--                                <div class="chat-bubble-text-container">--}}
{{--                                    <span class="chat-bubble-text">ipsum dolor sit amet</span>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    </div>--}}
{{--                    <div class="chat-write">--}}
{{--                        <form class="form-horizontal" action="javascript:void(0);">--}}
{{--                            <input type="text" class="form-control" placeholder="Say something">--}}
{{--                        </form>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--            </div>--}}
{{--        </div>--}}
    </div><!-- /Page Content -->
</div><!-- /Page Container -->


<!-- Javascripts -->

{{--<script type="text/javascript" src="{{ asset('js/concept.min.js') }}"></script>--}}

{{--<script type="text/javascript" src="{{ URL::asset('js/popper.min.js') }}"></script>--}}
{{--<script type="text/javascript" src="{{ URL::asset('js/jquery.slimscroll.min.js') }}"></script>--}}
{{--<script type="text/javascript" src="{{ URL::asset('js/switchery.min.js') }}"></script>--}}
{{--<script type="text/javascript" src="{{ URL::asset('js/prettify.js') }}"></script>--}}


@endsection
