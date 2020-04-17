<?php
    session_start();
    // echo 'Wellcome to' . $_SESSION['email'];
    if(isset($_SESSION['email'])){
      // echo 'Wellcome to' . $_SESSION['email'];
    }

 ?>

<!DOCTYPE html>
<html>

<head>
  <title></title>
</head>

<body style="background:#fff;">

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


        <li>
          <a href="/alder_iosapp/config/activity.php">
            <i class="menu-icon far fa-calendar-alt" style="color: #fff;"></i><span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;กิจกรรมที่จัด</span>
          </a>
        </li>

        <li>
          <a href="/alder_iosapp/config/createActivity.php">
            <i class="menu-icon far fa-calendar-plus" style="color: #fff;"></i><span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;สร้างกิจกรรม</span>
          </a>
        </li>

        <li>
          <a href="/alder_iosapp/config/uploadVideo.php">
            <i class="menu-icon far fa-file-video" style="color: #fff;"></i><span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;อัพโหลดวิดีโอ</span>
          </a>
        </li>

        <li class="menu-active">
          <a href="/alder_iosapp/config/blogger.php">
            <i class="menu-icon far fa-newspaper" style="color: #174495;"></i><span style="color: #174495; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;บทความศาสนา</span>
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
            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: 500; font-size: 13px;">
                <?php echo $_SESSION["email"];?>
              </span>&nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-caret-square-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <li><a href="/alder_iosapp/func/logout.php?logout">Logout</a></li>
            </ul>
          </li>
        </ul>
      </div><!-- /.container-fluid -->
    </nav>
  </div><!-- /Page Header -->


  <div class="page-inner no-page-title">
    <div id="main-wrapper">

      <div class="row col-12">

        <h2 class="col-8" style="font-family:'Bai Jamjuree', sans-serif; font-weight: bold;font-size:40px;color:#1B4793;">บทความศาสนา&nbsp;
          <i class="far fa-newspaper" style="font-size:35px;"></i>
        </h2>

        <div class="form-group col-4 mt-3">
          <div style="float:right;">
            <a href="/alder_iosapp/config/createBlogger.php">
              <input class="btn" style="background: #2178AE; color:#fff;font-family: 'Bai Jamjuree', sans-serif;font-weight: 700;" value="+ สร้างบทสวดธรรมะ">
            </a>
            &nbsp;
            <a href="/alder_iosapp/config/createStory.php"><input class="btn" style="background: #2178AE; color:#fff;font-family: 'Bai Jamjuree', sans-serif;font-weight: 700;" value="+ สร้างนิทาน">
            </a>
          </div>
        </div>
      </div>
      <hr>

      <div class="card mt-2 col-lg-12" style="margin-top: 15px !important; border-radius:15px;">
        <div class="card-body" style="font-family: 'Bai Jamjuree', sans-serif;">
          <!--สันทนาการ-->


          <div>
            <?php
                $conn = mysqli_connect("localhost","root","","Alder");
                $conn->set_charset('utf8');
                if($conn->connect_error){
                  die("Connection failed:".$conn->connect_error);
                }
                // $sql = "SELECT * FROM user_apps ";
                $sql = "SELECT * FROM prayer ORDER by id DESC LIMIT 0,3";
                $result = $conn-> query($sql);
                $conn-> close();
              ?>
          </div>

          <section>
            <form method="POST" action="/activity/store" enctype="multipart/form-data">
              <div class="row">
                <div class="container">
                  <span class="mb-4" style="font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold; color:#000000; font-size:28px;">บทสวดธรรมมะ</span>
                  <a href="../config/showlistPrayer.php">
                    <div class="btn offset-md-9" style="font-size:14px; font-weight:Bold; text-decoration:underline; color: #A7A9AC; font-family: 'Bai Jamjuree', sans-serif;">ดูทั้งหมด</div>
                  </a>

                </div>
              </div>
              <hr>
              <div class="row">
                <?while ($row = $result-> fetch_assoc()) {?>
                <div class="col-lg-4">
                  <a href="/alder_iosapp/config/showDetailprayer.php?id=<? echo $row['id']?>">
                    <div class="card">
                      <div>
                        <img src="/alder_iosapp/<?php echo $row['image'] ?>" class="card-img-top" style="width:100%;">
                      </div>

                      <div class="card-body" style="padding-bottom:0px !important">
                        <h5 class="card-title mb-4" style="font-size: 20px; padding-bottom:0px !important">
                          <? echo $row['title']?>
                        </h5>
                      </div>
                      <hr>
                      <div class="row">
                        <p class="card-text col-5" style="margin-bottom: 15px; margin-left: 20px; color:#A7A9AC">โดย :
                          <? echo $row['credit']?>
                        </p>
                        <p class="card-text col-5" style="margin-bottom: 15px; margin-left: 30px; color:#A7A9AC">
                          <? echo $row['create_at']?>
                        </p>
                      </div>
                    </div>
                  </a>
                </div>
                <? } ?>
              </div>
            </form>
          </section>

          <div>
            <?php
                $conn = mysqli_connect("localhost","root","","Alder");
                $conn->set_charset('utf8');
                if($conn->connect_error){
                  die("Connection failed:".$conn->connect_error);
                }
                // $sql = "SELECT * FROM user_apps ";
                $sql = "SELECT * FROM story ORDER by id DESC LIMIT 0,3";
                $result = $conn-> query($sql);
                $conn-> close();
              ?>
          </div>

          <section>
            <form method="POST" action="/activity/store" enctype="multipart/form-data">
              <div class="row">

                <div class="container">
                  <span class="mb-4" style="font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold; color:#000000; font-size:28px;">นิทานธรรมะ</span>
                  <a href="../config/showlistStory.php">
                    <div class="btn offset-md-9" style="font-size:14px; font-weight:Bold; text-decoration:underline; color: #A7A9AC;font-family: 'Bai Jamjuree', sans-serif;">ดูทั้งหมด</div>
                  </a>
                </div>


              </div>
              <hr>

              <div class="row">
                <?while ($row = $result-> fetch_assoc()) {?>
                <div class="col-lg-4">
                  <a href="/alder_iosapp/config/showDetailstory.php?id=<? echo $row['id']?>">
                    <div class="card">
                      <img src="/alder_iosapp/<?php echo $row['image'] ?>" alt="" class="card-img-top">
                      <div class="card-body" style="padding-bottom:0px !important;">
                        <h5 class="card-title mb-4" style="text-align: left;font-size: 20px;padding-bottom:0px !important"><?php echo $row['title'] ?></h5>
                        <!-- <p class="card-text"><?php echo $row['caption'] ?></p> -->
                      </div>
                      <hr>
                      <div class="row">
                        <p class="card-text col-5" style="margin-bottom: 15px; margin-left: 20px; color:#A7A9AC">โดย : <?php echo $row['caption'] ?></p>
                        <p class="card-text col-5" style="margin-bottom: 15px; margin-left: 30px; color:#A7A9AC"><?php echo $row['create_at'] ?></p>
                      </div>
                    </div>
                  </a>
                </div>
                <? } ?>
              </div>

            </form>
          </section>

        </div>
      </div>

      <br>
    </div>
  </div>


  </div>
  </div>



  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>
