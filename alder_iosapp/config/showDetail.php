<?php
if(isset($_GET["id"]))
{
	$id= $_GET["id"];
}
$conn = mysqli_connect("localhost","root","","Alder");
$conn->set_charset('utf8');
$sql = "SELECT * FROM post_timelines WHERE post_timelines.id ='$id' ";

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
      <h2 style="font-family: 'Bai Jamjuree', sans-serif; font-weight: bold;">กิจกรรม :"<?php echo $result["title"];?>"</h2>
      <div class="card mt-2 col-lg-12" style="margin-top: 30px !important; border-radius:15px;">
        <div class="card-body" style="font-family: 'Bai Jamjuree', sans-serif;">
          <!--สันทนาการ-->
          <form action="../func/saveActivity.php" method="post" enctype="multipart/form-data">
          <div class="upload imgpreview">
                <p style="text-align:center;">
                  <img class="imgtest rounded-circle" src='<?php echo $result["img"];?>' style="width:200px;height:200px;" alt="">
                </p>

                <p style="text-align:center;">
                  <label for="due" class="imgtest" style="font-weight:bold;">รูปภาพปก :</label>
                </p>

                <p style="text-align:center;">
                  <input type="file" class="input-file inputtest" name="image" id="image">
                </p>
          </div>

          <div class="form-group col-12">
               <input type="hidden" name="id" id="id" value="<?php echo $result["id"];?>">
          </div>

          <div class="row col-12">
            <div class="form-group col-12">
              <label for="text" class="control-label" style="font-weight:bold;">ชื่อกิจกรรม</label>
              <input class="form-control" name="title" type="text" id="title"  value="<?php echo $result["title"];?>">
            </div>
          </div>

          <div class="row col-12">
            <div class="form-group col-6">
              <label for="exampleFormControlSelect2" style="font-weight:bold;">ประเภทกิจกรรม</label>
              <input class="form-control" id="type" name="type" value="<?php echo $result["type"];?>">
            </div>

            <div class="form-group col-6">
              <label for="exampleFormControlSelect1" style="font-weight:bold;">หมวดหมู่ความสนใจ</label>
              <input class="form-control" id="act_id" disabled style="background-color: rgba(233, 236, 239, 0.55)" name="act_id" value="<?php echo $result["act_id"];?>">
            </div>
          </div>

          <div class="row col-12">
               <div class="form-group col-4">
                  <label for="text" class="control-label" style="font-weight:bold;">ผู้ดูแล </label>
                  <input class="form-control" name="user_id" type="text" id="user_id" disabled style="background-color: rgba(233, 236, 239, 0.55)" value="<?php echo $result["user_id"];?>">
               </div>

               <div class="form-group col-4">
                  <label for="text" class="control-label" style="font-weight:bold;">ผู้ดูแล </label>
                  <input class="form-control" name="maxJoin" type="text" id="maxJoin" disabled style="background-color: rgba(233, 236, 239, 0.55)" value="<?php echo $result["maxJoin"];?>">
               </div>

               <div class="form-group col-4">
                  <label for="text" class="control-label" style="font-weight:bold;">อุปกรณ์</label>
                  <input class="form-control" name="objective" type="text" id="objective" style="background-color: rgba(233, 236, 239, 0.55)" value="<?php echo $result["objective"];?>">
               </div>
           </div>


          <div class="row col-12">
            <div class="form-group col-6">
              <label for="text" class="control-label" style="font-weight:bold;">ผู้นำกิจกรรม </label>
              <input class="form-control" name="leaderActivity" type="text" id="leaderActivity"  value="<?php echo $result["leaderActivity"];?>">
            </div>

            <div class="form-group col-6">
              <label for="text" class="control-label" style="font-weight:bold;">ผู้ช่วย</label>
              <input class="form-control" name="assistantActivity" type="text" id="assistantActivity" value="<?php echo $result["assistantActivity"];?>">
            </div>
          </div>

          <div class="row col-12">
            <div class="form-group col-6">
              <label for="text" class="control-label" style="font-weight:bold;">วันที่เริ่มกิจกรรม</label>
              <input class="form-control " name="startDate" type="date" id="startDate"  value="<?php echo $result["startDate"];?>">
            </div>

            <div class="form-group col-6">
              <label for="text" class="control-label" style="font-weight:bold;">วันที่สิ้นสุดกิจกรรม</label>
              <input class="form-control " name="endDate" type="date" id="endDate"  value="<?php echo $result["endDate"];?>">
            </div>

            <div class="form-group col-6">
              <label for="text" class="control-label" style="font-weight:bold;">เวลา</label>
              <input class="form-control" name="startTime" type="time" id="startTime"  value="<?php echo $result["startTime"];?>">
            </div>
            <div class="form-group col-6">
              <label for="text" class="control-label" style="font-weight:bold;">เวลาจบ</label>
              <input class="form-control" name="endTime" type="time" id="endTime"  value="<?php echo $result["endTime"];?>">
            </div>
          </div>

          <div class="row col-12">

            <div class="form-group col-12">
              <label for="body" class="control-label" style="font-weight:bold;">รายละเอียดกิจกรรม</label>
              <textarea class="form-control" name="content" cols="50" rows="5" id="content" ><?php echo $result["content"];?></textarea>
            </div>

            <div class="form-group col-12">
              <label for="body" class="control-label" style="font-weight:bold;">วัสดุ/อุปกรณ์</label>
              <textarea class="form-control" name="equipment" cols="500" rows="5" id="equipment" ><?php echo $result["equipment"];?></textarea>
            </div>

            <div class="form-group col-12">
							<div style="float:right;">
								<input class="btn offset-1" type="hidden" >


								<button class="btn mt-3" type="submit" style="background: #FAC92C;color:#fff;font-family: 'Bai Jamjuree', sans-serif; font-weight: 700;">แก้ไขกิจกรรม</button>

								<a href="/alder_iosapp/config/listUserJoin.php?id=<?php echo $result["id"];?>">
										<span style="color: #A7A9AC; font-family: 'Bai Jamjuree', sans-serif; font-weight:normal;">
											รายชื่อผู้เข้าร่วม
										</span>
								</a>

								<a href="/alder_iosapp/config/rateUserView.php?id=<?php echo $result["id"];?>">
										<span style="color: #A7A9AC; font-family: 'Bai Jamjuree', sans-serif; font-weight:normal;">
											สรุปประเมินกิจกรรม
										</span>
								</a>




							</div>
              <!-- <input class="btn" style="background: #419F5D; color:#fff" type="submit" value="ยืนยันการแก้ไข"> -->

							<!-- <a href="/list-join"><input class="btn offset-7 mt-3 mr-2" style="background: #2178AE; color:#fff;font-family: 'Bai Jamjuree', sans-serif;font-weight: 700;" type="submit" value="รายชื่อผู้เข้าร่วม"></a>
							<a href="/evaluted"><input class="btn offset-1" type="hidden" ><button class="btn mt-3 mr-2" style="background: #1B4793;color:#fff;font-family: 'Bai Jamjuree', sans-serif;font-weight: 700;">สรุปประเมินกิจกรรม</button></a> -->




            </div>

          </div>

        </form>

        </div>

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
