<?php
 include('../func/auth.php')
 ?>

<!DOCTYPE html>
<html>

<head>
  <title>Alder</title>
  <link rel="shortcut icon" type="image/png" href="../images/group1457@3x.png">
</head>

<body>
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
    body {
      background-color: #fff;
    }

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
            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <span style="font-weight: 500; font-size: 13px;font-family: 'Bai Jamjuree', sans-serif; ">
                <?php echo $_SESSION["email"];?>
              </span>&nbsp;&nbsp;&nbsp;&nbsp;
              <i class="far fa-caret-square-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <li><a href="/alder_iosapp/func/logout.php?logout" style="font-family: 'Bai Jamjuree', sans-serif; ">Logout</a></li>
            </ul>
          </li>
        </ul>
      </div><!-- /.container-fluid -->
    </nav>
  </div><!-- /Page Header -->

  <div class="page-inner no-page-title" style="background:#fff;">
    <div id="main-wrapper">
      <h2 class="mt-4" style="font-family: 'Bai Jamjuree', sans-serif; font-weight: bold;font-size:40px;color:#1B4793;">กิจกรรม&nbsp;<i class="fas fa-gamepad" style="font-size:45px;"></i></h2>
      <hr>
      <br>

      <?php
                $conn = mysqli_connect("localhost","root","","Alder");
                $conn->set_charset('utf8');
                if($conn->connect_error){
                  die("Connection failed:".$conn->connect_error);
                }
                $sql = "SELECT COUNT(post_timelines.act_id) AS countAct
                        FROM post_timelines
                        LEFT JOIN activity_type ON post_timelines.act_id = activity_type.id WHERE post_timelines.act_id = 1";

                $result = $conn-> query($sql);
                $conn-> close();
            ?>
    </div>
    <div class="row">
      <div class="col-4">
        <div class="card" style="border-radius:20px;">
          <div class="card-body">
            <div class="row">
              <div class="col-12">
                <h5 class="card-text mt-4" style="text-align: center; font-family: 'Bai Jamjuree', sans-serif; font-size:20px;font-weight:bold;color:black;">
                  <div class="col-4 mt-3">
                  </div>
                  <img class="mr-3 mb-3" src="../images/activity -1 – 1.png" style="width: 60px;">
                  กิจกรรมสันทนาการ
                </h5>
                <hr>
              </div>
              <div class="col-12">
                <?while ($row = $result-> fetch_assoc()) {?>
                <div class="row">
                  <div class="col-8" style="margin-left: 60px;">
                    <p class="card-text" style="text-align: center; font-family: 'Bai Jamjuree', sans-serif; font-weight:600;font-size:20px"> <span style="color:#2178AE; font-size:50px"> <?php echo $row['countAct'] ?> </span> กิจกรรม</p>
                  </div>
                </div>

                <? } ?>

              </div>
            </div>
          </div>
        </div>
      </div>


      <?php
                          $conn = mysqli_connect("localhost","root","","Alder");
                          $conn->set_charset('utf8');
                          if($conn->connect_error){
                            die("Connection failed:".$conn->connect_error);
                          }
                          $sql = "SELECT COUNT(post_timelines.act_id) AS countAct
                                  FROM post_timelines
                                  LEFT JOIN activity_type ON post_timelines.act_id = activity_type.id WHERE post_timelines.act_id = 2";
                          $result = $conn-> query($sql);
                          $conn-> close();
      ?>

      <div class="col-4">
        <div class="card" style="border-radius:20px;">
          <div class="card-body">
            <div class="row">
              <div class="col-12">
                <h5 class="card-text mt-4" style="text-align: center; font-family: 'Bai Jamjuree', sans-serif; font-size:20px;font-weight:bold;color:black;">
                  <!-- <i class="fas fa-brain mr-3" style="font-size: 50px; color:#2178AE"></i> -->
                  <img class="mr-3 mb-3" src="../images/activity -2 – 1.png" style="width: 60px;">
                  กิจกรรมกระตุ้นสมอง</h5>
                <hr>
              </div>
              <div class="col-12">
                <?while ($row = $result-> fetch_assoc()) {?>
                <div class="row">
                  <div class="col-8" style="margin-left: 60px;">
                    <p class="card-text" style="text-align: center; font-family: 'Bai Jamjuree', sans-serif; font-weight:600;font-size:20px"> <span style="color:#2178AE; font-size:50px"> <?php echo $row['countAct'] ?> </span> กิจกรรม</p>
                  </div>
                </div>
                <!-- <progress id="file" value="<?php echo $row['countAct'] ?>" max="100" style="width:100%;"> 32% </progress> -->

                <? } ?>
              </div>
            </div>
          </div>
        </div>
      </div>

      <?php
                          $conn = mysqli_connect("localhost","root","","Alder");
                          $conn->set_charset('utf8');
                          if($conn->connect_error){
                            die("Connection failed:".$conn->connect_error);
                          }
                          $sql = "SELECT COUNT(post_timelines.act_id) AS countAct
                                  FROM post_timelines
                                  LEFT JOIN activity_type ON post_timelines.act_id = activity_type.id WHERE post_timelines.act_id = 3";
                          $result = $conn-> query($sql);
                          $conn-> close();
                        ?>

      <div class="col-4">
        <div class="card" style="border-radius:20px;">
          <div class="card-body">
            <div class="row">
              <div class="col-12">
                <h5 class="card-text mt-4" style="text-align: center; font-family: 'Bai Jamjuree', sans-serif; font-size:20px;font-weight:bold;color:black;">
                  <!-- <i class="fas fa-blind mr-3" style="font-size: 50px; color:#ED8E83"></i> -->
                  <img class="mr-3 mb-3" src="../images/activity -3 – 1.png" style="width: 60px;">
                  กิจกรรมกายภาพบำบัด</h5>
                <hr>
              </div>
              <div class="col-12">
                <?while ($row = $result-> fetch_assoc()) {?>
                <div class="row">
                  <div class="col-8" style="margin-left: 60px;">
                    <p class="card-text" style="text-align: center; font-family: 'Bai Jamjuree', sans-serif;  font-weight:600;font-size:20px"> <span style="color:#2178AE; font-size:50px"> <?php echo $row['countAct'] ?> </span> กิจกรรม</p>
                  </div>
                </div>
                <!-- <progress id="file" value="<?php echo $row['countAct'] ?>" max="100" style="width:100%;"> 32% </progress> -->

                <? } ?>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>



    <!-- php -->
    <div>
      <?php
                  $conn = mysqli_connect("localhost","root","","Alder");
                  $conn->set_charset('utf8');
                  if($conn->connect_error){
                    die("Connection failed:".$conn->connect_error);
                  }
                  $sql = "SELECT * FROM post_timelines WHERE post_timelines.act_id = 1 ORDER BY id DESC LIMIT 0,3";
                  $result = $conn-> query($sql);
                  $conn-> close();
                ?>
    </div>


    <div class="card col-lg-12" style="margin-top: 10px !important; border-radius:20px;">
      <div class="card-body" style="font-family: 'Bai Jamjuree', sans-serif;">
        <!--สันทนาการ-->

        <form method="POST" action="/activity/store" enctype="multipart/form-data">

          <div class="row ">


            <div class="container">
              <button type="button" class="btn btn-warning mb-4" style="font-weight:Bold; color:#fff;">กิจกรรมสันทนาการ</button>

              <a href="/alder_iosapp/config/showlistActivty.php">
                <div class="btn mb-4 offset-md-9" style="float: right;font-family:'Bai Jamjuree', sans-serif; font-weight:normal; text-decoration:underline; color:#A7A9AC">ดูทั้งหมด</div>



              </a>
            </div>
          </div>


          <div class="row">
            <?while ($row = $result-> fetch_assoc()) {?>
          <?
          $date = date("Y-m-d");
          $dateStart = $row['startDate'];
          $dateEnd = $row['endDate'];
          if($date <= $dateStart){
            $bg = '<button type="button" class="btn mb-4 mt ml-2" style="font-weight:Bold; color:#1b4793;background:#fede1c;">กิจกรรมใหม่</button>';
          }else if($date <= $dateEnd){
            $bg = '<button type="button" class="btn mb-4 mt" style="font-weight:Bold; color:#fff;background:#1b4793;">กิจกรรมดำเนิน</button>';
          }else{
            $bg = '<button type="button" class="btn mb-4" style="font-weight:Bold; color:#fff;background:#f15a42;">กิจกรรมจบลง</button>';
          }

           ?>
            <div class=" col-4" style="padding: 0;">
              <a href="/alder_iosapp/config/showDetail.php?id=<? echo $row['id']?>">
                <div class="col-12">
                  <div class="card" style="height: 500px;">
                    <div style="position:absolute;margin-top:200px;margin-left:240px;font-family:'Bai Jamjuree', sans-serif;">
                        <?=$bg;?>
                    </div>
                    <img src='/alder_iosapp/<?php echo $row['img'] ?>' height="250" alt="" class="card-img-top">
                    <div class="card-body">

                      <h5 class="card-title" style="text-align: center;font-size: 16px;font-family:'Bai Jamjuree', sans-serif;">
                        <? echo $row['title']?>
                      </h5>
                      <p class="card-text" style="color:#A7A9AC;font-family:'Bai Jamjuree', sans-serif; ">
                        <? echo $row['content']?>
                      </p>

                    </div>
                    <hr>
                    <div class="row" style="padding-left:30px;padding-right:30px;">
                          <div class="col-lg-6">
                                <p style="float:left;color:#A7A9AC;font-family:'Bai Jamjuree', sans-serif;">
                                    โดย : <? echo $row['leaderActivity']?>
                                </p>
                          </div>
                          <div class="col-lg-6">
                              <p style="float:right;color:#A7A9AC;font-family:'Bai Jamjuree', sans-serif;">
                                <?php
                                      $newDate = $row['startDate'];
                                      echo DateThai($newDate)
                                 ?>
                              </p>
                          </div>
                    </div>
                  </div>
                </div>
              </a>
            </div>
            <?

            ?>
            <? } ?>
          </div>


        </form>
        <hr>


        <div>
          <?php
                      $conn = mysqli_connect("localhost","root","","Alder");
                      $conn->set_charset('utf8');
                      if($conn->connect_error){
                        die("Connection failed:".$conn->connect_error);
                      }
                      $sql = "SELECT * FROM post_timelines WHERE post_timelines.act_id = 2 ORDER BY id DESC LIMIT 0,3";
                      $result = $conn-> query($sql);
                      $conn-> close();
                    ?>
        </div>

        <form method="POST" action="/activity/store" enctype="multipart/form-data">

          <div class="row mt-4">
            <div class="container">
              <button type="button" class="btn mb-4" style="font-weight:Bold; color:#fff; background:#2178AE">กิจกรรมกระตุ้นสมอง</button>
              <a href="/alder_iosapp/config/showlistActivty2.php">
                <div class="btn mb-4 offset-md-9" style="float: right;font-family:'Bai Jamjuree', sans-serif; font-weight:normal; text-decoration:underline; color:#A7A9AC">ดูทั้งหมด</div>
              </a>
            </div>
          </div>
          <div class="row">
            <?while ($row = $result-> fetch_assoc()) {?>
          <?
          $date = date("Y-m-d");
          $dateStart = $row['startDate'];
          $dateEnd = $row['endDate'];

          if($date <= $dateStart){
            $bg = '<button type="button" class="btn mb-4 mt ml-2" style="font-weight:Bold; color:#1b4793;background:#fede1c;">กิจกรรมใหม่</button>';
          }else if($date <= $dateEnd){
            $bg = '<button type="button" class="btn mb-4 mt ml-2" style="font-weight:Bold; color:#fff;background:#1b4793;">กิจกรรมดำเนิน</button>';
          }else{
            $bg = '<button type="button" class="btn mb-4 ml-2" style="font-weight:Bold; color:#fff;background:#f15a42;">กิจกรรมจบลง</button>';
          }

           ?>
            <div class=" col-4" style="padding: 0;">
              <a href="/alder_iosapp/config/showDetail.php?id=<? echo $row['id']?>">
                <div class="col-12">
                  <div class="card" style="height: 500px;">
                    <div style="position:absolute;margin-top:200px;margin-left:240px;">
                        <?=$bg;?>
                    </div>
                    <img src='/alder_iosapp/<?php echo $row['img'] ?>' height="250" alt="" class="card-img-top">
                    <div class="card-body">

                      <h5 class="card-title" style="text-align: center;font-size: 16px;font-family:'Bai Jamjuree', sans-serif;">
                        <? echo $row['title']?>
                      </h5>
                      <p class="card-text" style="color:#A7A9AC;font-family:'Bai Jamjuree', sans-serif; ">
                        <? echo $row['content']?>
                      </p>

                    </div>
                    <hr>
                    <div class="row" style="padding-left:30px;padding-right:30px;">
                          <div class="col-lg-6">
                                <p style="float:left;color:#A7A9AC;font-family:'Bai Jamjuree', sans-serif;">
                                    โดย : <? echo $row['leaderActivity']?>
                                </p>
                          </div>
                          <div class="col-lg-6">
                              <p style="float:right;color:#A7A9AC;font-family:'Bai Jamjuree', sans-serif;">
                                <?php
                                      $newDate = $row['startDate'];
                                      echo DateThai($newDate)
                                 ?>
                              </p>
                          </div>
                    </div>
                  </div>
                </div>
              </a>
            </div>
            <?

            ?>
            <? } ?>
          </div>

        </form>
        <hr>
        <div>
          <?php
            $conn = mysqli_connect("localhost","root","","Alder");
            $conn->set_charset('utf8');
            if($conn->connect_error){
              die("Connection failed:".$conn->connect_error);
            }
            $sql = "SELECT * FROM post_timelines WHERE post_timelines.act_id = 3 ORDER BY id DESC LIMIT 0,3";
            $result = $conn-> query($sql);
            $conn-> close();
          ?>
        </div>

        <form method="POST" action="/activity/store" enctype="multipart/form-data">

          <div class="row mt-4">
            <div class="container">
              <button type="button" class="btn mb-4" style="font-weight:Bold; color:#fff; background:#ED8E83">กิจกรรมกายภาพบำบัด</button>

              <a href="/alder_iosapp/config/showlistActivty3.php">
                <div class="btn mb-4 offset-md-9" style="float: right;font-family:'Bai Jamjuree', sans-serif; font-weight:normal; text-decoration:underline; color:#A7A9AC">ดูทั้งหมด</div>
              </a>
            </div>
          </div>

          <div class="row">
            <?while ($row = $result-> fetch_assoc()) {?>
          <?
          $date = date("Y-m-d");
          $dateStart = $row['startDate'];
          $dateEnd = $row['endDate'];


          if($date <= $dateStart){
            $bg = '<button type="button" class="btn mb-4 mt ml-2" style="font-weight:Bold; color:#1b4793;background:#fede1c;">กิจกรรมใหม่</button>';

          }else if($date <= $dateEnd){
            $bg = '<button type="button" class="btn mb-4 mt" style="font-weight:Bold; color:#fff;background:#1b4793;">กิจกรรมดำเนิน</button>';
          }else{
            $bg = '<button type="button" class="btn mb-4" style="font-weight:Bold; color:#fff;background:#f15a42;">กิจกรรมจบลง</button>';
          }

           ?>
            <div class=" col-4" style="padding: 0;">
              <a href="/alder_iosapp/config/showDetail.php?id=<? echo $row['id']?>">
                <div class="col-12">
                  <div class="card" style="height: 500px;">
                    <div style="position:absolute;margin-top:200px;margin-left:240px;">
                        <?=$bg;?>



                    </div>
                    <img src='/alder_iosapp/<?php echo $row['img'] ?>' height="250" alt="" class="card-img-top">
                    <div class="card-body">

                      <h5 class="card-title" style="text-align: center;font-size: 16px;font-family:'Bai Jamjuree', sans-serif;">
                        <? echo $row['title']?>
                      </h5>
                      <p class="card-text" style="color:#A7A9AC;font-family:'Bai Jamjuree', sans-serif; ">
                        <? echo $row['content']?>
                      </p>

                    </div>
                    <hr>
                    <div class="row" style="padding-left:30px;padding-right:30px;">
                          <div class="col-lg-6">
                                <p style="float:left;color:#A7A9AC;font-family:'Bai Jamjuree', sans-serif;">
                                    โดย : <? echo $row['leaderActivity']?>
                                </p>
                          </div>
                          <div class="col-lg-6">
                              <p style="float:right;color:#A7A9AC;font-family:'Bai Jamjuree', sans-serif;">
                                <?php
                                      $newDate = $row['startDate'];
                                      echo DateThai($newDate)
                                 ?>
                              </p>
                          </div>
                    </div>
                  </div>
                </div>
              </a>
            </div>
            <?

            ?>
            <? } ?>
          </div>

        </form>



      </div>

      <br>
      <br>
    </div>


  </div>
  </div>


  <br>
  <br>
  <script type="text/javascript">
            <?php
          function DateThai($strDate)
          {
            $strYear = date("Y",strtotime($strDate))+543;
            $strMonth= date("n",strtotime($strDate));
            $strDay= date("j",strtotime($strDate));
            $strMonthCut = Array("","ม.ค.","ก.พ.","มี.ค.","เม.ย.","พ.ค.","มิ.ย.","ก.ค.","ส.ค.","ก.ย.","ต.ค.","พ.ย.","ธ.ค.");
            $strMonthThai=$strMonthCut[$strMonth];
            return "$strDay $strMonthThai $strYear";
          }
          ?>
  </script>
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>
