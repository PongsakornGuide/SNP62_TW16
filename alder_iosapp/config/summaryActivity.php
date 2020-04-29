<?php
 include('../func/auth.php')
 ?>


<?php

if(isset($_GET["id"]))
{
	$id= $_GET["id"];
}
$conn = mysqli_connect("localhost","snptwald_Alder","Guide109","snptwald_Alder");
$conn->set_charset('utf8');
$sql = "SELECT * FROM post_timelines WHERE post_timelines.id ='$id' ";

$query = mysqli_query($conn,$sql);
$result=mysqli_fetch_array($query,MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html>

<head>
  <title>Alder</title>
  <link rel="shortcut icon" type="image/png" href="../images/group1457@3x.png">
</head>

<body style="background:#fff;">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link href="../css/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">
  <link href="../css/switchery.css" type="text/css" rel="stylesheet">
  <link href="../css/concept.css" type="text/css" rel="stylesheet">
  <link href="../css/concept.min.css" type="text/css" rel="stylesheet">
  <link href="../css/switchery.min.css" type="text/css" rel="stylesheet">
  <link href="../css/webfonts/fa-regular-400.woff" type="text/css" rel="stylesheet">
  <link href="../css/all.min.css" type="text/css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Bai+Jamjuree:wght@400;500;700&display=swap" rel="stylesheet">
<style>
.menu-active {
  width: 199px;
  height: 45px;
  border-radius: 25px 0px 0px 25px;
  background-color: #fff;
  color: rgb(27, 71, 147) !important;
  margin: 5px 0 10px 0;
  padding-top: 5px;
}

  .secondary-sidebar-menu ul li a {
    color: #174495 !important;
  }
body {
font-family: 'Bai Jamjuree', sans-serif;
}

/* .container {
width: 80%;
margin: 0 auto;
} */

/*
=================
Circle Graph using (https://github.com/rendro/easy-pie-chart)
================
*/
.circle-graph p {
text-align: center;
padding: 10px;
z-index: 100;
}

.graph-one {
height: 300px; /* set height for postioning */
}

circle-graph-container {
position: relative;
}

canvas {
position: absolute;
top: 120px;
}

.circle-graph {
margin: 20px;
float: left;
}

.circle-graph2 p {
text-align: center;
padding: 10px;
z-index: 100;
}

.graph-one {
height: 300px; /* set height for postioning */
}

circle-graph-container {
position: relative;
}

canvas {
position: absolute;
top: 120px;
}

.circle-graph2 {
margin: 20px;
float: left;
}




.circle-graph3 p {
text-align: center;
padding: 10px;
z-index: 100;
}

.graph-one {
height: 300px; /* set height for postioning */
}

circle-graph-container {
position: relative;
}

canvas {
position: absolute;
top: 120px;
}

.circle-graph3 {
margin: 20px;
float: left;
}





.circle-graph4 p {
text-align: center;
padding: 10px;
z-index: 100;
}

.graph-one {
height: 300px; /* set height for postioning */
}

circle-graph-container {
position: relative;
}

canvas {
position: absolute;
top: 120px;
}

.circle-graph4 {
margin: 20px;
float: left;
}

/* Bar Graph
================ */
*/
.bar-graph-container {
border-left: 4px solid #000;
border-bottom: 4px solid #000;
width: 60%;
overflow: hidden;

}

.bar-graph-container p {
/* padding: 20px; */
color: #fff;
}

@-webkit-keyframes slide-left {
 0% {
   -webkit-transform: translateX(-200%);
}
70% {
  -webkit-transform: translateX(2%);
}
100% {
  -webkit-transform: translateX(0);
}
}

@keyframes slide-left {
0% {
  -webkit-transform: translateX(-200%);
}

70% {
  -webkit-transform: translateX(2%);
}

100% {
  -webkit-transform: translateX(0);
}
}

.bar-container {
background-color: rgba(231, 184, 239, 0.6);
}

.html {
width: 85%;
background-color: #a378aa;
animation: slide-left 0.9s ease-in-out 1s both;
-webkit-animation: slide-left 0.9s ease-in-out 1s both;
animation-delay: 0.1s;
-webkit-animation-delay: 0.1s;
}

.css {
width: 80%;
background-color: #a378aa;
animation: slide-left 1s ease-in-out 1s both;
-webkit-animation: slide-left 1s ease-in-out 1s both;
 animation-delay: 0.2s;
-webkit-animation-delay: 0.2s;
}

.js {
width: 60%;
background-color: #a378aa;
animation: slide-left 1s ease-in-out 1s both;
-webkit-animation: slide-left 1s ease-in-out 1s both;
 animation-delay: 0.3s;
-webkit-animation-delay: 0.3s;
}

.php {
width: 40%;
background-color: #a378aa;
animation: slide-left 1s ease-in-out 1s both;
-webkit-animation: slide-left 1s ease-in-out 1s both;
 animation-delay: 0.2s;
-webkit-animation-delay: 0.2s;
}

.drupal {
width: 62%;
background-color: #a378aa;
animation: slide-left 1s ease-in-out 1s both;
-webkit-animation: slide-left 1s ease-in-out 1s both;
 animation-delay: 0.1s;
-webkit-animation-delay: 0.1s;
}
</style>

<div class="secondary-sidebar" style=" background: #1B4793; color: #fff; position: fixed; top: 0;overflow: hidden; hidden;left: 0px;">
  <div class="secondary-sidebar-bar">
    <a href="/alder_iosapp/config/home.php" class="logo-box" style="font-family: 'Poppins', sans-serif;font-weight: bolder;color:#fff!important; text-align: center;"><img src="https://uppic.cc/d/6m7y"
        style="height:30px;margin-bottom: 10px;">&nbsp;Alder</a>
  </div>
  <div class="secondary-sidebar-menu">
    <ul class="accordion-menu">
      <li>
        <a href="/alder_iosapp/config/home.php">
          <i class="menu-icon far fa-user-circle" style="color: #fff;"></i><span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">ข้อมูลผู้สูงอายุ</span>
        </a>
      </li>


      <li class="menu-active">
        <a href="/alder_iosapp/config/activity.php">
          <i class="menu-icon far fa-calendar-alt" style="color: #174495;"></i><span style="color: #174495; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;กิจกรรมที่จัด</span>
        </a>
      </li>

      <li>
        <a href="/alder_iosapp/config/createActivity.php">
          <i class="menu-icon far fa-calendar-plus" style="color: #fff;"></i><span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;สร้างกิจกรรม</span>
        </a>
      </li>

      <li>
        <a href="/alder_iosapp/config/uploadVideo.php">
          <i class="menu-icon far fa-file-video" style="color: #fff;"></i><span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;วิดีโอ / เพลง</span>
        </a>
      </li>

      <li>
        <a href="/alder_iosapp/config/blogger.php">
          <i class="menu-icon far fa-newspaper" style="color: #fff;"></i><span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;บทความศาสนา</span>
        </a>
      </li>
    </ul>
  </div>
</div>

<div class="page-header">
  <nav class="navbar navbar-default navbar-expand-md">
    <div class="container-fluid">
      <div class="collapse navbar-collapse justify-content-between" id="bs-example-navbar-collapse-1">
      </div>
      <ul class="nav navbar-nav">
        <li class="dropdown nav-item d-md-block">
          <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
              style="font-weight: 500; font-size: 13px;font-family: 'Bai Jamjuree', sans-serif; ">
              <?php echo $_SESSION["email"];?>
            </span>&nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-caret-square-down"></i>
          </a>
          <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
            <li><a href="/alder_iosapp/func/logout.php?logout" style="font-family: 'Bai Jamjuree', sans-serif; ">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.container-fluid -->
  </nav>
</div><!-- /Page Header -->

<div>
  <?php
     if(isset($_GET["id"]))
     {
      $id= $_GET["id"];
     }
     $conn = mysqli_connect("localhost","snptwald_Alder","Guide109","snptwald_Alder");
     $conn->set_charset('utf8');
     $sql = "SELECT title FROM post_timelines WHERE post_timelines.id = '$id'";
     $result = $conn-> query($sql);
     $conn-> close();


     ?>
</div>

<div class="page-inner no-page-title">
  <div id="main-wrapper">
    <?while ($row = $result-> fetch_assoc()) {?>
    <h1 class="col-12" style="font-family: 'Bai Jamjuree', sans-serif; font-weight: bold;font-size: 2rem;text-transform: uppercase;font-size:40px;color:#1B4793;">กิจกรรม : " <?php echo $row['title'] ?>"
      <? } ?>
    <!-- <h2 style="font-family: 'Bai Jamjuree', sans-serif; font-weight: bold;font-size:40px;color:#1B4793;">กราฟสรุปผล &nbsp;<i class="far fa-newspaper"></i></h2> -->
    <!-- <div style="text-align: center"><a class="btn btn-info" href="/"><i class="fas fa-chevron-left"></i> Go Back</a></div> -->
<hr>
    <div class="row" style="padding:0px;">

      <div>
        <?php
           if(isset($_GET["id"]))
           {
            $id= $_GET["id"];
           }
           $conn = mysqli_connect("localhost","snptwald_Alder","Guide109","snptwald_Alder");
           $conn->set_charset('utf8');
           $sql = "SELECT COUNT(join_activity.id) as CountJoin , join_activity.post_timeline_id
   				FROM join_activity
   				LEFT JOIN user_apps ON join_activity.user_id = user_apps.id
   				LEFT JOIN exception_disease ON join_activity.user_id = exception_disease.disease_user_apps
   				LEFT JOIN disease ON exception_disease.disease_id = disease.id
   				LEFT JOIN post_timelines ON join_activity.post_timeline_id = post_timelines.id WHERE join_activity.post_timeline_id = '$id'";
           $result = $conn-> query($sql);
           $conn-> close();


           ?>
           <?php
              if(isset($_GET["id"]))
              {
               $id= $_GET["id"];
              }
              $conn = mysqli_connect("localhost","snptwald_Alder","Guide109","snptwald_Alder");
              $conn->set_charset('utf8');
              $sql = "SELECT post_timelines.maxJoin FROM post_timelines where post_timelines.id = '$id'";
              $result2 = $conn-> query($sql);
              $conn-> close();


              ?>
      </div>

<div class="col-lg-4">
    <div class="card mt-2" style="margin-top: 30px !important; border-radius:15px;">
        <div class="row" style="padding:10px;">
          <section class="graph-one" style="margin:0 auto;">
            <p style="font-weight:bold;text-align:center;padding:20px;font-size:20px;">ผู้ที่เข้าร่วม<span style="font-size:30px;color:#21409a;font-family: 'Bai Jamjuree', sans-serif;">กิจกรรม </span></p>
              <div class="row">
                  <?while ($row = $result-> fetch_assoc() AND $row2 = $result2-> fetch_assoc()){?>
                <div class="col-lg-6 col-md-12" style="margin-top:-100px;">
                  <div class="circle-graph" data-percent="<?php echo $row['CountJoin'] ?>">

                    <p style="margin-top:130px;color:#21409a;font-family: 'Bai Jamjuree', sans-serif;font-size:20px;font-weight:bold;">สมัคร</p>
                    <p style="font-size:30px;margin-top:-40px;font-weight:bold;"><?php echo $row['CountJoin'] ?> / <?php echo $row2['maxJoin'] ?></p>
                  </div>
                </div>
              <? } ?>
              </div>
          </section>
        </div>
    </div>
</div>

<div>
  <?php
     if(isset($_GET["id"]))
     {
      $id= $_GET["id"];
     }
     $conn = mysqli_connect("localhost","snptwald_Alder","Guide109","snptwald_Alder");
     $conn->set_charset('utf8');
     $sql = "SELECT COUNT(decides.id) as CountUser FROM decides
LEFT JOIN user_apps ON decides.user_id = user_apps.id where decides.post_timeline_id = '$id'";
     $result = $conn-> query($sql);
     $conn-> close();


     ?>
</div>

<div class="col-lg-8">
    <div class="card mt-2" style="margin-top: 30px !important; border-radius:15px;">
        <div class="row" style="padding:10px;">
          <section class="graph-one" style="margin:0 auto;">
            <p style="font-weight:bold;text-align:center;padding:20px;font-size:20px;">ประเมิน<span style="font-size:30px;color:#21409a;font-family: 'Bai Jamjuree', sans-serif;">กิจกรรม </span></p>

              <div class="row">
                <?while ($row = $result-> fetch_assoc()) {?>
                    <div class="col-lg-6 col-md-12" style="margin-top:-100px;">
                      <div class="circle-graph2" data-percent="<?php echo $row['CountUser'] ?>" >

                        <p style="margin-top:130px;color:#FF6F61;font-family: 'Bai Jamjuree', sans-serif;font-size:20px;font-weight:bold;">ก่อน</p>
                        <p style="font-size:42px;margin-top:-40px;font-weight:bold;"><?php echo $row['CountUser'] ?></p>
                      </div>
                    </div>
                <? } ?>
                <div>
                  <?php
                     if(isset($_GET["id"]))
                     {
                      $id= $_GET["id"];
                     }
                     $conn = mysqli_connect("localhost","snptwald_Alder","Guide109","snptwald_Alder");
                     $conn->set_charset('utf8');
                     $sql = "SELECT COUNT(decide_afters.id) as UserCount FROM decide_afters
                LEFT JOIN user_apps ON decide_afters.user_id = user_apps.id
                LEFT JOIN assess ON decide_afters.assess_id = assess.id
                WHERE decide_afters.post_timeline_id = '$id'";
                     $result = $conn-> query($sql);
                     $conn-> close();


                     ?>
                </div>
                <?while ($row = $result-> fetch_assoc()) {?>
                    <div class="col-lg-6 col-md-12" style="margin-top:-100px;">
                      <div class="circle-graph2" data-percent="<?php echo $row['UserCount'] ?>" >

                        <p style="margin-top:130px;color:#FF6F61;font-family: 'Bai Jamjuree', sans-serif;font-size:20px;font-weight:bold;">หลัง</p>
                        <p style="font-size:42px;margin-top:-40px;font-weight:bold;"><?php echo $row['UserCount'] ?></p>
                      </div>
                    </div>
                    <? } ?>
              </div>
          </section>
        </div>
    </div>
</div>

<div class="col-lg-12">
<hr>
</div>

<div class="col-lg-12 mt-4">
  <p style="font-weight:bold;text-align:center;font-size:20px;">ประเมินความพึงพอใจ<span style="font-size:30px;color:#21409a;font-family: 'Bai Jamjuree', sans-serif;">กิจกรรม </span></p>
</div>

<div class="col-lg-4">
  <div class="card mt-2" style="margin-top: 30px !important; border-radius:15px;">

    <div>
      <?php
                if(isset($_GET["id"]))
                {
                 $id= $_GET["id"];
                }
                $conn = mysqli_connect("localhost","snptwald_Alder","Guide109","snptwald_Alder");
                $conn->set_charset('utf8');
                $sql = "SELECT COUNT(decide_afters.id) as countID1
                FROM decide_afters
                LEFT JOIN user_apps ON decide_afters.user_id = user_apps.id
                LEFT JOIN assess ON decide_afters.assess_id = assess.id
                WHERE decide_afters.post_timeline_id = '$id' AND decide_afters.assess_id = 1";

                $result = $conn-> query($sql);
                $conn-> close();

                ?>
    </div>
    <?while ($row = $result-> fetch_assoc()) {?>
    <section class="graph-one" style="margin:0 auto;">

        <div class="row">
          <div class="col-lg-6 col-md-6 col-md-12" style="margin-top:-70px;">
            <div class="circle-graph4" data-percent="<?php echo $row['countID1'] ?>" >
                <img class="mr-3 mb-3" src="../images/Icon 100x100 -3.png" style="width: 100px;position:absolute;margin-top:130px;margin-left:30px;">
            </div>
          </div>
          <div class="col-lg-6 col-md-12" style="margin-top:120px;text-align:center;">
            <p style="font-size:42px;margin-top:-40px;font-weight:bold;"><?php echo $row['countID1'] ?></p>
            <p style="margin-top:10px;color:#FAC92C;font-family: 'Bai Jamjuree', sans-serif;font-size:20px;font-weight:bold;">มีความสุข</p>
          </div>
        </div>

    </section>
<? } ?>




    <div class="col-lg-12" style="padding:-20px;text-align:center;font-weight:bold;font-size:15px;">
      <div class="row">
            <div class="col-lg-3" style="margin-top:-10px;font-size:15px;">
                รูปภาพ
            </div>
            <div class="col-lg-4" style="margin-top:-10px;font-size:15px;">
                ชื่อ
            </div>
            <div class="col-lg-5" style="margin-top:-10px;font-size:15px;">
                นามสกุล
            </div>
        </div>
        <hr>
    </div>

    <div>
      <?php
                if(isset($_GET["id"]))
                {
                 $id= $_GET["id"];
                }
                $conn = mysqli_connect("localhost","snptwald_Alder","Guide109","snptwald_Alder");
                $conn->set_charset('utf8');
                $sql = "  SELECT  user_apps.photo,user_apps.username,user_apps.surname
                                    FROM decide_afters
                                    LEFT JOIN user_apps ON decide_afters.user_id = user_apps.id
                                    LEFT JOIN assess ON decide_afters.assess_id = assess.id
                                    WHERE decide_afters.post_timeline_id = '$id' AND decide_afters.assess_id = 1";

                $result = $conn-> query($sql);
                $conn-> close();

                ?>
    </div>
<?while ($row = $result-> fetch_assoc()) {?>
        <div class="col-lg-12" style="padding:20px;text-align:center;">
          <div class="row">
                <div class="col-lg-3" style="margin-top:-20px;font-weight:bold;font-size:15px;">
                      <img src='/alder_iosapp/<?php echo $row['photo'] ?>' class="rounded-circle" style="width:50px;height:50px;" alt="">
                </div>
                <div class="col-lg-4" style="margin-top:-10px;font-size:15px;">
                    <?php echo $row['username'] ?>
                </div>
                <div class="col-lg-5" style="margin-top:-10px;font-size:15px;">
                    <?php echo $row['surname'] ?>
                </div>
            </div>
            <hr>
        </div>
<? } ?>
  </div>
</div>
<div class="col-lg-4">
  <div class="card mt-2" style="margin-top: 30px !important; border-radius:15px;">

    <div>
      <?php
                if(isset($_GET["id"]))
                {
                 $id= $_GET["id"];
                }
                $conn = mysqli_connect("localhost","snptwald_Alder","Guide109","snptwald_Alder");
                $conn->set_charset('utf8');
                $sql = "SELECT COUNT(decide_afters.id) as countID1
                FROM decide_afters
                LEFT JOIN user_apps ON decide_afters.user_id = user_apps.id
                LEFT JOIN assess ON decide_afters.assess_id = assess.id
                WHERE decide_afters.post_timeline_id = '$id' AND decide_afters.assess_id = 2";

                $result = $conn-> query($sql);
                $conn-> close();

                ?>
    </div>
    <?while ($row = $result-> fetch_assoc()) {?>
    <section class="graph-one" style="margin:0 auto;">

        <div class="row">
          <div class="col-lg-6 col-md-12" style="margin-top:-70px;">
            <div class="circle-graph3" data-percent="<?php echo $row['countID1'] ?>" >
                <img class="mr-3 mb-3" src="../images/Icon 100x100 -2.png" style="width: 100px;position:absolute;margin-top:130px;margin-left:30px;">
            </div>
          </div>
          <div class="col-lg-6 col-md-12" style="margin-top:120px;text-align:center;">
            <p style="font-size:42px;margin-top:-40px;font-weight:bold;"><?php echo $row['countID1'] ?></p>
            <p style="margin-top:10px;color:#129A3A;font-family: 'Bai Jamjuree', sans-serif;font-size:20px;font-weight:bold;">ปานกลาง</p>
          </div>
        </div>

    </section>
<? } ?>




    <div class="col-lg-12" style="padding:-20px;text-align:center;font-weight:bold;font-size:15px;">
      <div class="row">
            <div class="col-lg-3" style="margin-top:-10px;font-size:15px;">
                รูปภาพ
            </div>
            <div class="col-lg-4" style="margin-top:-10px;font-size:15px;">
                ชื่อ
            </div>
            <div class="col-lg-5" style="margin-top:-10px;font-size:15px;">
                นามสกุล
            </div>
        </div>
        <hr>
    </div>

    <div>
      <?php
                if(isset($_GET["id"]))
                {
                 $id= $_GET["id"];
                }
                $conn = mysqli_connect("localhost","snptwald_Alder","Guide109","snptwald_Alder");
                $conn->set_charset('utf8');
                $sql = "  SELECT  user_apps.photo,user_apps.username,user_apps.surname
                                    FROM decide_afters
                                    LEFT JOIN user_apps ON decide_afters.user_id = user_apps.id
                                    LEFT JOIN assess ON decide_afters.assess_id = assess.id
                                    WHERE decide_afters.post_timeline_id = '$id' AND decide_afters.assess_id = 2";

                $result = $conn-> query($sql);
                $conn-> close();

                ?>
    </div>
<?while ($row = $result-> fetch_assoc()) {?>
        <div class="col-lg-12" style="padding:20px;text-align:center;">
          <div class="row">
                <div class="col-lg-3" style="margin-top:-20px;font-weight:bold;font-size:15px;">
                      <img src='/alder_iosapp/<?php echo $row['photo'] ?>' class="rounded-circle" style="width:50px;height:50px;" alt="">
                </div>
                <div class="col-lg-4" style="margin-top:-10px;font-size:15px;">
                    <?php echo $row['username'] ?>
                </div>
                <div class="col-lg-5" style="margin-top:-10px;font-size:15px;">
                    <?php echo $row['surname'] ?>
                </div>
            </div>
            <hr>
        </div>
<? } ?>
  </div>
</div>

    <div class="col-lg-4">
      <div class="card mt-2" style="margin-top: 30px !important; border-radius:15px;">

        <div>
          <?php
                    if(isset($_GET["id"]))
                    {
                     $id= $_GET["id"];
                    }
                    $conn = mysqli_connect("localhost","snptwald_Alder","Guide109","snptwald_Alder");
                    $conn->set_charset('utf8');
                    $sql = "SELECT COUNT(decide_afters.id) as countID1
                    FROM decide_afters
                    LEFT JOIN user_apps ON decide_afters.user_id = user_apps.id
                    LEFT JOIN assess ON decide_afters.assess_id = assess.id
                    WHERE decide_afters.post_timeline_id = '$id' AND decide_afters.assess_id = 3";

                    $result = $conn-> query($sql);
                    $conn-> close();

                    ?>
        </div>
        <?while ($row = $result-> fetch_assoc()) {?>
        <section class="graph-one" style="margin:0 auto;">
          <!-- <p style="font-weight:bold;text-align:center;padding:20px;font-size:20px;">ประเมินความพึงพอใจ<span style="font-size:30px;color:#21409a;font-family: 'Bai Jamjuree', sans-serif;">กิจกรรม </span></p> -->

            <div class="row">
              <div class="col-lg-6 col-md-12" style="margin-top:-70px;">
                <div class="circle-graph" data-percent="<?php echo $row['countID1'] ?>" >
                    <img class="mr-3 mb-3" src="../images/Icon 100x100 -1.png" style="width: 100px;position:absolute;margin-top:130px;margin-left:30px;">
                </div>
              </div>
              <div class="col-lg-6 col-md-12" style="margin-top:120px;text-align:center;">
                <p style="font-size:42px;margin-top:-40px;font-weight:bold;"><?php echo $row['countID1'] ?></p>
                <p style="margin-top:10px;color:#21409a;font-family: 'Bai Jamjuree', sans-serif;font-size:20px;font-weight:bold;">ไม่มีความสุข</p>
              </div>
            </div>

        </section>
  <? } ?>




        <div class="col-lg-12" style="padding:-20px;text-align:center;font-weight:bold;font-size:15px;">
          <div class="row">
                <div class="col-lg-3" style="margin-top:-10px;font-size:15px;">
                    รูปภาพ
                </div>
                <div class="col-lg-4" style="margin-top:-10px;font-size:15px;">
                    ชื่อ
                </div>
                <div class="col-lg-5" style="margin-top:-10px;font-size:15px;">
                    นามสกุล
                </div>
            </div>
            <hr>
        </div>

        <div>
          <?php
                    if(isset($_GET["id"]))
                    {
                     $id= $_GET["id"];
                    }
                    $conn = mysqli_connect("localhost","snptwald_Alder","Guide109","snptwald_Alder");
                    $conn->set_charset('utf8');
                    $sql = "SELECT  user_apps.photo,user_apps.username,user_apps.surname
                                        FROM decide_afters
                                        LEFT JOIN user_apps ON decide_afters.user_id = user_apps.id
                                        LEFT JOIN assess ON decide_afters.assess_id = assess.id
                                        WHERE decide_afters.post_timeline_id = '$id' AND decide_afters.assess_id = 3";

                    $result = $conn-> query($sql);
                    $conn-> close();

                    ?>
        </div>
<?while ($row = $result-> fetch_assoc()) {?>
            <div class="col-lg-12" style="padding:20px;text-align:center;">
              <div class="row">

                    <div class="col-lg-3" style="margin-top:-20px;font-weight:bold;font-size:15px;">
                          <img src='/alder_iosapp/<?php echo $row['photo'] ?>' class="rounded-circle" style="width:50px;height:50px;" alt="">
                    </div>
                    <div class="col-lg-4" style="margin-top:-10px;font-size:15px;">
                        <?php echo $row['username'] ?>
                    </div>
                    <div class="col-lg-5" style="margin-top:-10px;font-size:15px;">
                        <?php echo $row['surname'] ?>
                    </div>

                </div>
                <hr>
            </div>

<? } ?>
      </div>
    </div>
      </div>
    </div>
</div>



    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='https://rendro.github.io/easy-pie-chart/javascripts/jquery.easy-pie-chart.js'></script>
    <script type="text/javascript">
    $(function() {
    $('.circle-graph').easyPieChart({
      scaleColor: false,
      lineWidth: 14,
      lineCap: 'butt',
      barColor: '#21409a',
      trackColor: '#f5f6fa' ,
      size: 160,
      animate: 2500
    });
    });
    </script>

    <script type="text/javascript">
    $(function() {
    $('.circle-graph2').easyPieChart({
      scaleColor: false,
      lineWidth: 14,
      lineCap: 'butt',
      barColor: '#FF6F61',
      trackColor: '#f5f6fa' ,
      size: 160,
      animate: 2500
    });
    });
    </script>

    <script type="text/javascript">
    $(function() {
    $('.circle-graph3').easyPieChart({
      scaleColor: false,
      lineWidth: 14,
      lineCap: 'butt',
      barColor: '#129A3A',
      trackColor: '#f5f6fa' ,
      size: 160,
      animate: 2500
    });
    });
    </script>

    <script type="text/javascript">
    $(function() {
    $('.circle-graph4').easyPieChart({
      scaleColor: false,
      lineWidth: 14,
      lineCap: 'butt',
      barColor: '#FAC92C',
      trackColor: '#f5f6fa' ,
      size: 160,
      animate: 2500
    });
    });
    </script>

  </body>
</html>
