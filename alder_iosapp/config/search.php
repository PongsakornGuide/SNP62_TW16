<?php
 include('../func/auth.php')
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

  .s006 form .inner-form {
    width: 100%;
    margin-bottom: 17px;
  }

  .s006 form .inner-form .input-field {
    height: 50px;
    width: 100%;
    position: relative;
  }

  .s006 form .inner-form .input-field input {
    height: 100%;
    width: 100%;
    background: transparent;
    border: 0;
    background: #1B4793;
    display: block;
    width: 100%;
    padding: 10px 32px 10px 55px;
    color: #fff;
    border-radius: 34px;
    border-color: blue;
    font-family: 'Bai Jamjuree', sans-serif;
    font-weight: bold;
  }

  .s006 form .inner-form .input-field input.placeholder {
    color: #ccc;
    font-size: 15px;
  }

  .s006 form .inner-form .input-field input:-moz-placeholder {
    color: #ccc;
    font-size: 15px;
  }

  .s006 form .inner-form .input-field input::-webkit-input-placeholder {
    color: #1B4793;
    font-size: 15px;
  }

  .s006 form .inner-form .input-field input:hover,
  .s006 form .inner-form .input-field input:focus {
    box-shadow: none;
    outline: 0;
  }

  .s006 form .inner-form .input-field .btn-search {
    width: 70px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    position: absolute;
    left: 0;
    height: 100%;
    background: transparent;
    border: 0;
    padding: 0;
    cursor: pointer;
    display: flex;
    -ms-flex-pack: center;
    justify-content: center;
    align-items: center;
  }

  .s006 form .inner-form .input-field .btn-search svg {
    fill: #1B4793;
    width: 20px;
    height: 20px;
    transition: all .2s ease-out, color .2s ease-out;
  }

  .s006 form .inner-form .input-field .btn-search:hover,
  .s006 form .inner-form .input-field .btn-search:focus {
    outline: 0;
    box-shadow: none;
  }

  .s006 form .inner-form .input-field .btn-search:hover svg,
  .s006 form .inner-form .input-field .btn-search:focus svg {
    fill: #666;
  }

  .s006 form .suggestion-wrap {
    padding: 0 15px;
  }

  .s006 form .suggestion-wrap span {
    font-size: 14px;
    font-family: 'Helvetica', sans-serif;
    display: inline-block;
    background: rgba(0, 0, 0, 0.6);
    padding: 0 15px;
    line-height: 32px;
    color: #000;
    border-radius: 16px;
    margin-right: 10px;
    margin-bottom: 10px;
  }

  @media screen and (max-width: 767px) {
    .s006 form .inner-form .input-field {
      margin-bottom: 20px;
      height: 50px;
    }

    .s006 form .inner-form .input-field input {
      padding-left: 55px;
      font-size: 16px;
    }

    .s006 form .inner-form .input-field .btn-search svg {
      width: 26px;
      height: 26px;
    }


  }
  </style>

  <div class="secondary-sidebar" style=" background: #1B4793; color: #fff; position: fixed; top: 0;overflow: hidden; hidden;left: 0px;">
    <div class="secondary-sidebar-bar">
      <a href="/alder_iosapp/config/home.php" class="logo-box" style="font-family: 'Poppins', sans-serif;font-weight: bolder;color:#fff!important; text-align: center;"><img src="https://uppic.cc/d/6m7y"
          style="height:30px;margin-bottom: 10px;">&nbsp;Alder</a>
    </div>
    <div class="secondary-sidebar-menu">
      <ul class="accordion-menu">
        <li class="menu-active">
          <a href="/alder_iosapp/config/home.php">
            <i class="menu-icon far fa-user-circle" style="color: #174495;"></i><span style="color: #174495; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">ข้อมูลผู้สูงอายุ</span>
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
            $conn = mysqli_connect("localhost","root","","Alder");
            $conn->set_charset('utf8');
            if($conn->connect_error){
              die("Connection failed:".$conn->connect_error);
            }
            // $sql = "SELECT * FROM user_apps ";
            $sql = "SELECT COUNT(user_apps.id) as CountUser FROM user_apps";
            $result = $conn-> query($sql);
            $conn-> close();
          ?>
  </div>


  <div class="page-inner no-page-title">

    <div id="main-wrapper">
      <div class="row mt-4">


        <h1 class="col-10" style="font-family: 'Bai Jamjuree', sans-serif; font-weight: bold;font-size: 2rem;text-transform: uppercase;uppercase;font-size:30px;color:#1B4793;">ยินดีต้อนรับ
          <!-- <span style="font-weight: bold;color: #FAC92C;">Admin</span> -->
          <span style="font-weight: bold;color: #FAC92C;font-size: 18px;"><?php echo $_SESSION["email"];?> </span>
          <?while ($row = $result-> fetch_assoc()) {?>
          <h4 class="col-2" style="font-family: 'Bai Jamjuree', sans-serif; font-size:16px">จำนวนผู้สูงอายุ <span style="font-weight:600; font-size:22px;color: #FAC92C;"> <?php echo $row['CountUser'] ?></span> คน</h4>
          <? } ?>
      </div>
      <hr>

      <div class="s006 mt-4">
        <form action="search.php" method="post">
          <div class="inner-form">
            <div class="input-field">
              <button class="btn-search" type="submit" name="submit-search" id="search">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                  <path
                    d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z">
                  </path>
                </svg>
              </button>
              <input type="text" name="search" id="search" placeholder="ค้นหาข้อมูล..." style="color: #1B4793;border-width: 2px;background:white;  border-style: solid;
  border-color: #1B4793;" />
            </div>
          </div>
        </form>
      </div>


      <?php
                  $conn = mysqli_connect("localhost","root","","Alder");
                  $conn->set_charset('utf8');

                  $sql = "SELECT * FROM user_apps";
                  $result = mysqli_query($conn, $sql);
                  $queryResults = mysqli_num_rows($result);

                  if(isset($_POST['submit-search'])){
                  $search = mysqli_real_escape_string($conn, $_POST['search']);

                  $sql = "SELECT user_apps.*, disease.diseaseName_th FROM user_apps
          LEFT JOIN exception_disease ON user_apps.id = exception_disease.disease_user_apps
          LEFT JOIN disease ON exception_disease.disease_id = disease.id WHERE user_apps.username LIKE '%$search%' OR user_apps.surname LIKE '%$search%'";

                  $result = mysqli_query($conn, $sql);
                  $queryResult = mysqli_num_rows($result);
                  }
                  ?>



      <?while ($row = $result-> fetch_assoc()) {?>
      <div class="row">
        <div class="col-lg-12">
          <div class="card mt-4" id="fixed-header" style="border-radius: 10px;">
            <div class="card-body" style="font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">
              <div class="card mb-4 rounded" style="border: none;">
              </div>

              <div class="container">
                <div class="row">
                  <div class="box-info col-12">
                    <div style="margin-top:-20px;">


                      <a href="/alder_iosapp/config/editUser.php?id=<? echo $row['id']?>" style="float:right;">
                        <span style="color: #A7A9AC; font-family: 'Bai Jamjuree', sans-serif; font-weight:normal; text-decoration:underline;">
                          แก้ไขข้อมูล
                        </span>
                      </a>
                    </div>
                    <br>
                    <div class="row">



                      <div class="col-lg-2 mb-2">
                        <img src='/alder_iosapp/<?php echo $row['photo'] ?>' class="rounded-circle" style="width:100px;height:100px;" alt="">
                      </div>


                      <div class="col-lg-10 mt-4">
                        <div class="row">

                          <div class="col-lg-3">
                            <h5 class="card-title" style="font-size:16px;font-weight: bold;">
                              ชื่อ :
                              <? echo $row['username']?>
                              <br>
                              <br>
                              นามสกุล :
                              <? echo $row['surname']?>
                            </h5>

                          </div>
                          <div class="col-lg-3">
                            <p style="color:#7C7E80;">เพศ :
                              <? echo $row['gender']?>
                            </p>
                            <p style="color:#7C7E80;">ศาสนา :
                              <? echo $row['religion']?>
                            </p>
                          </div>
                          <div class="col-lg-3">
                            <p style="color:#7C7E80;">เบอร์โทรศัพท์ :
                              <? echo $row['tel']?>
                            </p>
                            <p style="color:#7C7E80;">วันเกิด :
                              <? echo $row['birthday']?>
                            </p>
                          </div>
                          <div class="col-lg-3">
                            <p style="color:#7C7E80;">ที่อยู่ :
                              <? echo $row['address']?>
                            </p>
                            <p style="color:#7C7E80;">โรคประจำตัว :
                              <? echo $row['diseaseName_th']?>
                            </p>
                          </div>
                        </div>



                      </div>


                    </div>

                  </div>



                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
      <? } ?>
    </div><!-- Main Wrapper -->
  </div><!-- /Page Inner -->

  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>
