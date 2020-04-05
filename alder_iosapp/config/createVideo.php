
<!DOCTYPE html>
<html>

<head>
  <title></title>
</head>

<body>
    <link href="../css/switchery.css" rel="stylesheet">
      <link href="../css/concept.css" rel="stylesheet">
        <link href="../css/concept.min.css" rel="stylesheet">
          <link href="../css/switchery.min.css" rel="stylesheet">
          <link href="../css/font-awesome.min.css" rel="stylesheet">
          <link href="../css/font-awesome.css" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <style>

      .menu-active{
          width: 199px;
          height: 45px;
          border-radius: 25px 0px 0px 25px;
          background-color: #F1F3F9;
          color: rgb(27, 71, 147)!important;
          margin: 5px 0 10px 0;
          float: right;
          padding-top: 5px;
      }
      .secondary-sidebar-menu ul li a{
          color: #174495!important;
      }
  </style>
    <div class="secondary-sidebar" style=" background: #1B4793; color: #fff; position: fixed; top: 0;overflow: hidden; hidden;left: 0px;">
        <div class="secondary-sidebar-bar">
            <a href="/" class="logo-box" style="font-family: 'Poppins', sans-serif;font-weight: bolder;color:#fff!important; text-align: center;"><img src="https://uppic.cc/d/6m7y" style="height:30px;margin-bottom: 10px;">&nbsp;Alder</a>
        </div>
        <div class="secondary-sidebar-menu">
            <ul class="accordion-menu">
                <li>
                    <a href="/alder_iosapp/config/index.php">
                      <span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">ข้อมูลผู้สูงอายุ</span>
                    </a>
                </li>


                <li>
                    <a href="/alder_iosapp/config/activity.php">
                        <span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;กิจกรรมที่จัด</span>
                    </a>
                </li>

                <li>
                    <a href="/alder_iosapp/config/createActivity.php">
                        <span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;สร้างกิจกรรม</span>
                    </a>
                </li>

                <li  class="menu-active">
                    <a href="/alder_iosapp/config/uploadVideo.php">
                        <span style="color: #174495; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;อัพโหลดวิดีโอ</span>
                    </a>
                </li>

                <li>
                       <a href="/alder_iosapp/config/blogger.php">
                          <span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;บทความศาสนา</span>
                      </a>
                </li>
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
                           <!-- <li><a href="javascript:void(0)" id="toggle-fullscreen"><i class="fas fa-expand"></i></a></li> -->
                           <li><a href="javascript:void(0)" id="search-button"><i class="fas fa-search"></i></a></li>
                       </ul>
                   </div><!-- /.navbar-collapse -->
                   <ul class="nav navbar-nav">

                       <li class="dropdown nav-item d-md-block">
                           <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="far fa-user"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: 800; font-size: 13px;" >
                             <!-- {{Auth::user()->name}} -->

                             Admin
                           </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-angle-down"></i></a>

                           <ul class="dropdown-menu dropdown-menu-right dropdown-lg dropdown-content" style="width: 102px;">
                               <li class="">
                               <!-- @if (Auth::guest()) -->
                                   <li><a href="{{ route('login') }}">Login</a></li>
                                   <li><a href="{{ route('register') }}">Register</a></li>
                               <!-- @else -->
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">

                                        xxxxx
                                    </a>
                                   <li>
                                       <a href="{{ route('logout') }}"
                                          onclick="event.preventDefault();
                                                                  document.getElementById('logout-form').submit();" style="text-align: center;">
                                           Logout
                                       </a>
                                       <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                           <!-- {{ csrf_field() }} -->
                                       </form>
                                   </li>

                                   <!-- @endif -->
                               </li>
                           </ul>
                       </li>
                       <!-- <li class="nav-item d-md-block"><a href="javascript:void(0)" class="right-sidebar-toggle" data-sidebar-id="main-right-sidebar">{{Auth::user()->name}}</a></li> -->

                       <li class="dropdown nav-item d-md-block">
                           <a href="#" class="nav-link dropdown-toggle" id="navbarDropdown" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                             <!-- <img src="../theme/assets/images/avatars/avatar1.png" alt="" class="rounded-circle"> -->
                           </a>
                           <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
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


       <div class="page-inner no-page-title">
           <div id="main-wrapper">
               <h2 class="mt-4" style="font-family: 'Bai Jamjuree', sans-serif; font-weight: bold;">อัพโหลดวิดีโอ &nbsp;<i class="far fa-file-video"></i></h2>
               <!-- <div style="text-align: center"><a class="btn btn-info" href="/"><i class="fas fa-chevron-left"></i> Go Back</a></div> -->
               <div class="card mt-2 col-lg-12" style="margin-top: 30px !important; border-radius:15px;">
                   <div class="card-body" style="font-family: 'Bai Jamjuree', sans-serif;">
                       <form action="../func/upload.php" method="post" enctype="multipart/form-data">
                       <div class="row col-12">
                           <div class="form-group col-12">
                               <label for="text" class="control-label" style="font-weight:bold;">ชื่อวิดีโอ : </label>
                               <input class="form-control" id="title_video" name="title_video" type="text" >
                           </div>
                       </div>

                       <div class="row col-12">
                           <div class="form-group col-12">
                               <label for="text" class="control-label" style="font-weight:bold;">url : </label>
                               <input class="form-control" id="url" name="url" type="text" >
                           </div>
                       </div>


                       <div class="row col-12">
                           <div class="form-group col-12">
                               <label for="text" class="control-label" style="font-weight:bold;">นักร้อง : </label>
                               <input class="form-control" id="singerName" name="singerName" type="text" >
                           </div>
                       </div>

                       <div class="row col-12">
                           <div class="form-group col-6">
                               <label for="due" class="control-label" style="font-weight:bold;">รูปภาพปก:</label>
                               <div class="upload imgpreview">
                                   <img class="imgtest" src="" alt="">

                                   <div class="controls">
                                       <input type="file" class="input-file inputtest" name="image" id="image">
                                   </div>
                               </div>
                           </div>
                   </div>


                       <div>
                           <input class="btn offset-10 mt-4 mb-3" style="background: #419F5D; color:#fff" type="Submit" value="สร้างวิดีโอ">
                       </div>
                       </form>
                   </div>
               </div>
               <br>
           </div>

       </div>

  <br>
  <br>
  <script>

     setTimeout(function(){

         document.querySelector(".inputtest").addEventListener('change', e => {
         document.querySelector('.imgtest').src = URL.createObjectURL(e.target.files[0]);
             console.log("test =",e)
         });

     },1000)

 </script>
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>
