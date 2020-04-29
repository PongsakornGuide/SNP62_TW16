<!-- <?php
if(isset($_GET["id"]))
{
	$id= $_GET["id"];
}
// $conn = mysqli_connect("localhost","root","","Alder");
$conn = mysqli_connect("localhost","root","","Alder");
$conn->set_charset('utf8');
$sql = "SELECT COUNT(decide_afters.id) as UserCount FROM decide_afters LEFT JOIN user_apps ON decide_afters.user_id = user_apps.id LEFT JOIN assess ON decide_afters.assess_id = assess.id WHERE decide_afters.post_timeline_id = '$id' ";

$query = mysqli_query($conn,$sql);
$result=mysqli_fetch_array($query,MYSQLI_ASSOC);
?> -->

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

    *,
    *:before,
    *:after {
      box-sizing: border-box;
    }


    .accordion {
      transform: translateZ(0);
      /* box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1); */
      background: #fff;
    }

    .accordion>.accordion-toggle {
      position: absolute;
      opacity: 0;
      display: none;
    }

    .accordion>label {
      position: relative;
      display: block;
      height: 50px;
      line-height: 50px;
      font-size: 18px;
      font-weight: 500;
      border-bottom: 1px solid #ddd;
      background: #fff;
      cursor: pointer;
    }

    .accordion>label:after {
      content: '\f078';
      position: absolute;
      top: 0px;
      margin-left: 10px;
      font-family: fontawesome;
      transform: rotate(180deg);
      transition: .3s transform;
    }

    .accordion>section {
      height: 0;
      transition: .3s all;
      overflow: hidden;
    }

    .accordion>.accordion-toggle:checked~label:after {
      transform: rotate(0deg);
    }

    .accordion>.accordion-toggle:checked~section {
      height: auto;
    }

    .accordion>section p {
      margin: 15px 0;
      padding: 0 20px;
      font-size: 12px;
      line-height: 1.5;
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
       $conn = mysqli_connect("localhost","root","","Alder");
       $conn->set_charset('utf8');
       $sql = "SELECT title FROM post_timelines WHERE post_timelines.id = '$id'";
       $result = $conn-> query($sql);
       $conn-> close();


       ?>
  </div>

  <div class="page-inner no-page-title">


    <div class="row mt-4">
      <?while ($row = $result-> fetch_assoc()) {?>
      <h1 class="col-10" style="font-family: 'Bai Jamjuree', sans-serif; font-weight: bold;font-size: 2rem;text-transform: uppercase;font-size:40px;color:#1B4793;"> กิจกรรม : " <?php echo $row['title'] ?> "
        <? } ?>
        <div>
          <?php
             if(isset($_GET["id"]))
             {
              $id= $_GET["id"];
             }
             $conn = mysqli_connect("localhost","root","","Alder");
             $conn->set_charset('utf8');
             $sql = "SELECT COUNT(decides.id) as CountUser FROM decides
LEFT JOIN user_apps ON decides.user_id = user_apps.id where decides.post_timeline_id = '$id'";
             $result = $conn-> query($sql);
             $conn-> close();


             ?>
        </div>
        <?while ($row = $result-> fetch_assoc()) {?>
        <h4 class="col-2 mt-4" style="font-family: 'Bai Jamjuree', sans-serif; font-size:16px">จำนวนผู้สูงอายุ <span style="font-weight:600; font-size:22px;color: #FAC92C;"> <?php echo $row['CountUser'] ?> </span> คน</h4>
        <? } ?>
    </div>


      <div class="card mt-2 col-lg-12" style="margin-top: 30px !important; border-radius:15px;">
        <div class="card-body" style="font-family: 'Bai Jamjuree', sans-serif;">
          <div class="row col-12">
            <div class="form-group col-12" style="text-align: center;">
              <label for="text" class="control-label" style="font-weight:bold; font-size:24px; color:black;">สรุปประเมินก่อนเข้าร่วมกิจกรรม </label>
              <hr>
            </div>
          </div>


                            <div class="accordion">
                              <div>
                                <?php
                                                   if(isset($_GET["id"]))
                                                   {
                                                    $id= $_GET["id"];
                                                   }
                                                   // $conn = mysqli_connect("localhost","root","","Alder");
                                                   $conn = mysqli_connect("localhost","root","","Alder");
                                                   $conn->set_charset('utf8');
                                                   $sql = "SELECT COUNT(decides.id) as CountUser FROM decides
LEFT JOIN user_apps ON decides.user_id = user_apps.id where decides.post_timeline_id = '$id'";

                                                   $result = $conn-> query($sql);
                                                   $conn-> close();

                                                   ?>
                              </div>

                              <input id="toggle4" type="radio" class="accordion-toggle" name="toggle" />
                              <?while ($row = $result-> fetch_assoc()) {?>
                              <p style="font-weight:bold;font-size:20px;">ความคิดเห็นก่อนเข้าร่วม (<?php echo $row['CountUser'] ?>)</p>
                              <? } ?>
                              <div>
                                <?php
                                     if(isset($_GET["id"])){
                                        $id= $_GET["id"];
                                     }
                                     $conn = mysqli_connect("localhost","root","","Alder");
                                    $conn->set_charset('utf8');
                                    $sql = "SELECT decides.id,user_apps.id as UserId,user_apps.username,user_apps.surname,user_apps.photo,user_apps.tel, decides.more , exception_disease.disease_detail
                                    FROM decides
                                    LEFT JOIN user_apps ON decides.user_id = user_apps.id
                                    LEFT JOIN exception_disease ON decides.user_id = exception_disease.disease_user_apps
                                    where decides.post_timeline_id = '$id'";
                                    $result = $conn-> query($sql);
                                    $conn-> close();
                                    ?>
                              </div>

                            <div>
                              <section style="margin-top:20px;font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">
                                <div class="row col-12 mt-4" >
                                  <div class="col-2">
                                    <p style="font-size:16px;">รูปภาพ</p>
                                  </div>
                                  <div class="col-2">
                                    <p style="font-size:16px;">ชื่อ</p>
                                  </div>
                                  <div class="col-2">
                                    <p style="font-size:16px;">นามสกุล</p>
                                  </div>
                                  <div class="col-2">
                                    <p style="font-size:16px;">เบอร์ติดต่อ</p>
                                  </div>
                                  <div class="col-2">
                                    <p style="font-size:16px;">ความคิดเห็น</p>
                                  </div>
                                  <div class="col-2">
                                    <p style="font-size:16px;">ข้อมูลผู้ใช้</p>
                                  </div>
                                </div>
                                <hr>
                              </section>
                            </div>

                              <!-- <section> -->
                              <?while ($row = $result-> fetch_assoc()) {?>


                              <div class="row col-12">

                                <div class="col-lg-2">
                                  <img src='/alder_iosapp/<?php echo $row['photo'] ?>' class="rounded-circle" style="width:50px;height:50px;" alt="">
                                </div>

                                <div class="col-lg-2 mt-3">
                                  <p style="font-size:16px;"><?php echo $row['username'] ?></p>
                                </div>
                                <div class="col-lg-2 mt-3">
                                  <p style="font-size:16px;"> <?php echo $row['surname'] ?></p>
                                </div>

                                <div class="col-lg-2 mt-3">
                                  <p style="font-size:16px;"><?php echo $row['tel'] ?></p>
                                </div>

                                <div class="col-lg-2 mt-3">
                                  <p style="font-size:16px;"><?php echo $row['more'] ?></p>
                                </div>

                                <div class="col-lg-2 mt-3">
                                  <a class="btnbtn" href="/alder_iosapp/config/editUser.php?id=<? echo $row['UserId']?>"
                                    style="background: #1B4793;color:#fff;font-family: 'Bai Jamjuree', sans-serif;font-weight: bold;padding:10px;border-radius:5px;color:#fff;">
                                    <span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:bold;">
                                      <i class="fas fa-user"></i> ข้อมูลผู้ใช้
                                    </span>
                                  </a>
                                </div>
                              </div>
                              <hr>
                              <? } ?>
                            </div>

                          </div>




        </div>
      </div>

      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>
