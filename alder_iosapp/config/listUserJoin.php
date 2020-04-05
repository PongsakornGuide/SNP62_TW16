<?php
if(isset($_GET["id"]))
{
	$id= $_GET["id"];
}
$conn = mysqli_connect("localhost","root","","Alder");
$conn->set_charset('utf8');
$sql = "SELECT COUNT(join_activity.id) as CountJoin , join_activity.post_timeline_id
FROM join_activity
LEFT JOIN user_apps ON join_activity.user_id = user_apps.id
LEFT JOIN exception_disease ON join_activity.user_id = exception_disease.disease_user_apps
LEFT JOIN disease ON exception_disease.disease_id = disease.id
LEFT JOIN post_timelines ON join_activity.post_timeline_id = post_timelines.id WHERE join_activity.post_timeline_id = '$id' ";

$query = mysqli_query($conn,$sql);
$result=mysqli_fetch_array($query,MYSQLI_ASSOC);
?>




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
    .menu-active {
      width: 199px;
      height: 45px;
      border-radius: 25px 0px 0px 25px;
      background-color: #F1F3F9;
      color: rgb(27, 71, 147) !important;
      margin: 5px 0 10px 0;
      float: right;
      padding-top: 5px;
    }

    .secondary-sidebar-menu ul li a {
      color: #174495 !important;
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


        <li class="menu-active">
          <a href="/alder_iosapp/config/activity.php">
            <span style="color: #174495; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;กิจกรรมที่จัด</span>
          </a>
        </li>

        <li>
          <a href="/alder_iosapp/config/createActivity.php">
            <span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;สร้างกิจกรรม</span>
          </a>
        </li>

        <li>
          <a href="/alder_iosapp/config/uploadVideo.php">
            <span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;อัพโหลดวิดีโอ</span>
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
            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="far fa-user"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
                style="font-weight: 800; font-size: 13px;">
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
                <a href="{{ route('logout') }}" onclick="event.preventDefault();
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
          <a href="#" class="nav-link dropdown-toggle" id="navbarDropdown" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <img src="../theme/assets/images/avatars/avatar1.png" alt="" class="rounded-circle">
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
               <!-- <a href="/alder_iosapp/config/showDetail.php?id=<?php echo $result['post_timeline_id'] ?>">

                 <span class="mb-4" style="font-family: 'Bai Jamjuree', sans-serif; font-size:18px; font-weight:600">ย้อนกลับ</span>
               </a> -->


                 <div class="row mt-4">

                   <h1 class="col-10" style="font-family: 'Bai Jamjuree', sans-serif; font-weight: bold;font-size: 2rem;text-transform: uppercase;">ยินดีต้อนรับ
                     <span style="font-weight: bold;color: #FAC92C;">Admin</span>

                     <h4 class="col-2" style="font-family: 'Bai Jamjuree', sans-serif; font-size:16px">จำนวนผู้สูงอายุ <span style="font-weight:600; font-size:22px;color: #FAC92C;"> <?php echo $result['CountJoin'] ?> </span> คน</h4>

                 </div>

                 <div class="row mt-4">
                     <div class="col-lg-12">
                         <div class="card" id="fixed-header" style="border-radius: 10px;">
                             <div class="card-body" style="font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">




             <div class="container">

                 <section>
                     <div class="row col-12" style="text-align: center;">
                         <div class="col-1">
                             <p style="font-size:16px;"></p>
                         </div>
                         <div class="col-3">
                             <p style="font-size:16px;">ชื่อ - นามสกุล</p>
                         </div>
                         <div class="col-3">
                             <p style="font-size:16px;">เบอร์ติดต่อ</p>
                         </div>
                         <div class="col-3">
                             <p style="font-size:16px;">โรคประจำตัว</p>
                         </div>
                         <div class="col-2">
                             <p style="font-size:16px;">ศาสนา</p>
                         </div>
                     </div>
                     <hr>
                 </section>


                 <?php
                 if(isset($_GET["id"]))
                 {
                 	$id= $_GET["id"];
                 }
                 $conn = mysqli_connect("localhost","root","","Alder");
                 $conn->set_charset('utf8');
                 $sql = "SELECT join_activity.* ,user_apps.photo, user_apps.username, user_apps.surname, user_apps.tel, user_apps.religion ,post_timelines.title ,disease.diseaseName_th
                 FROM join_activity
                 LEFT JOIN user_apps ON join_activity.user_id = user_apps.id
                 LEFT JOIN exception_disease ON join_activity.user_id = exception_disease.disease_user_apps
                 LEFT JOIN disease ON exception_disease.disease_id = disease.id
                 LEFT JOIN post_timelines ON join_activity.post_timeline_id = post_timelines.id WHERE join_activity.post_timeline_id ='$id' ";
                 $result = $conn-> query($sql);
                 $conn-> close();

                 ?>


                <?while ($row = $result-> fetch_assoc()) {?>
                     <section>
                         <div class="row col-12" style="text-align: center;">
                             <div class="col-1">
                                 <img src='/alder_iosapp/<?php echo $row['photo'] ?>' class="rounded-circle" style="width:50px;height:50px;"alt="">
                             </div>
                             <div class="col-3 mt-3">

                                 <p style="font-size:15px; font-weight:500"><?php echo $row['username'] ?> <?php echo $row['surname'] ?></p>
                             </div>
                             <div class="col-3 mt-3">
                                 <p style="font-size:15px; font-weight:500"><?php echo $row['tel'] ?></p>
                             </div>
                             <div class="col-3 mt-3">
                                 <p style="font-size:15px; font-weight:500"><?php echo $row['diseaseName_th'] ?></p>
                             </div>
                             <div class="col-2 mt-3">
                                 <p style="font-size:15px; font-weight:500"><?php echo $row['religion'] ?></p>
                             </div>
                         </div>
                         <hr>
                     </section>
               <? } ?>
             </div>

                             </div>

                         </div>
                     </div>
                 </div>
             </div><!-- Main Wrapper -->
         </div><!-- /Page Inner -->




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
