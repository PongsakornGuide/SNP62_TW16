<!-- <?php
if(isset($_GET["id"]))
{
	$id= $_GET["id"];
}
$conn = mysqli_connect("localhost","root","","Alder");
$conn->set_charset('utf8');
$sql = "SELECT COUNT(decide_afters.id) as UserCount FROM decide_afters LEFT JOIN user_apps ON decide_afters.user_id = user_apps.id LEFT JOIN assess ON decide_afters.assess_id = assess.id WHERE decide_afters.post_timeline_id = '$id' ";

$query = mysqli_query($conn,$sql);
$result=mysqli_fetch_array($query,MYSQLI_ASSOC);
?> -->

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
            <i class="menu-icon far fa-file-video" style="color: #fff;"></i><span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;อัพโหลดวิดีโอ</span>
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
             $sql = "SELECT COUNT(decide_afters.id) as UserCount FROM decide_afters
        LEFT JOIN user_apps ON decide_afters.user_id = user_apps.id
        LEFT JOIN assess ON decide_afters.assess_id = assess.id
        WHERE decide_afters.post_timeline_id = '$id'";
             $result = $conn-> query($sql);
             $conn-> close();


             ?>
        </div>
<?while ($row = $result-> fetch_assoc()) {?>
        <h4 class="col-2" style="font-family: 'Bai Jamjuree', sans-serif; font-weight:600; font-size:16px">จำนวนผู้สูงอายุ <span style="font-weight:600; font-size:22px;color: #FAC92C;"> <?php echo $row['UserCount'] ?></span> คน</h4>
        <? } ?>
    </div>


    <div class="card mt-2 col-lg-12" style="margin-top: 30px !important; border-radius:15px;">
      <div class="card-body" style="font-family: 'Bai Jamjuree', sans-serif;">
        <div class="row col-12">
          <div class="form-group col-12" style="text-align: center;">
            <label for="text" class="control-label" style="font-weight:bold; font-size:24px; color:black;">สรุปประเมินหลังเข้าร่วมกิจกรรม </label>
            <hr>
          </div>
        </div>

        <div>
          <?php
                    if(isset($_GET["id"]))
                    {
                     $id= $_GET["id"];
                    }
                    $conn = mysqli_connect("localhost","root","","Alder");
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

        <div class="row">
          <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-text" style="font-family: 'Bai Jamjuree', sans-serif; text-align: center; font-size:20px; font-weight: 500;">
                  <!-- <i class="far far fa-frown mt-4" style="font-size: 3em; text-align: left; color:#1B4793"></i> -->
                  <img class="mr-3 mb-3" src="../images/Icon 100x100 -1.png" style="width: 60px;">
                  ไม่มีความสุข
                </h5>
                <hr class="mt-4">
                <?while ($row = $result-> fetch_assoc()) {?>
                <p class="card-text" style="font-family: 'Bai Jamjuree', sans-serif; font-weight:600; text-align:center;font-size:18px">จำนวน <span style="color:#2178AE; font-size:20px"><?php echo $row['countID1'] ?></span> คน</p>
                <? } ?>
              </div>
            </div>
          </div>

          <div>
            <?php
                       if(isset($_GET["id"]))
                       {
                        $id= $_GET["id"];
                       }
                         $conn = mysqli_connect("localhost","root","","Alder");
                         $conn->set_charset('utf8');
                         $sql = "SELECT COUNT(decide_afters.id) as countID2
                         FROM decide_afters
                         LEFT JOIN user_apps ON decide_afters.user_id = user_apps.id
                         LEFT JOIN assess ON decide_afters.assess_id = assess.id
                         WHERE decide_afters.post_timeline_id = '$id' AND decide_afters.assess_id = 2";

                       $result = $conn-> query($sql);
                       $conn-> close();

                       ?>
          </div>

          <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-text" style="font-family: 'Bai Jamjuree', sans-serif; text-align: center; font-size:20px; font-weight: 500;">
                  <!-- <i class="far far fa-meh mt-4" style="font-size: 3em; text-align: left; color:#295F21"></i> -->
                  <img class="mr-3 mb-3" src="../images/Icon 100x100 -2.png" style="width: 60px;">
                  ปานกลาง
                </h5>
                <hr class="mt-4">
                <?while ($row = $result-> fetch_assoc()) {?>
                <p class="card-text" style="font-weight:600;text-align:center;font-size:18px">จำนวน <span style="color:#2178AE; font-size:20px"><?php echo $row['countID2'] ?></span> คน</p>
                <? } ?>
              </div>
            </div>
          </div>


          <div>
            <?php
                          if(isset($_GET["id"]))
                          {
                           $id= $_GET["id"];
                          }
                          $conn = mysqli_connect("localhost","root","","Alder");
                          $conn->set_charset('utf8');
                          $sql = "SELECT COUNT(decide_afters.id) as countID3
                          FROM decide_afters
                          LEFT JOIN user_apps ON decide_afters.user_id = user_apps.id
                          LEFT JOIN assess ON decide_afters.assess_id = assess.id
                          WHERE decide_afters.post_timeline_id = '$id' AND decide_afters.assess_id = 1";

                          $result = $conn-> query($sql);
                          $conn-> close();

                          ?>
          </div>

          <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-text" style="font-family: 'Bai Jamjuree', sans-serif; text-align: center; font-size:20px;     font-weight: 500;">
                  <!-- <i class="far fa-smile mt-4" style="font-size: 3em; text-align: left; color:#FAC92C"></i> -->
                  <img class="mr-3 mb-3" src="../images/Icon 100x100 -3.png" style="width: 60px;">
                  มีความสุข
                </h5>
                <hr class="mt-4">
                <?while ($row = $result-> fetch_assoc()) {?>
                <p class="card-text" style="font-weight:600;text-align:center;font-size:18px">จำนวน
                  <span style="color:#2178AE; font-size:20px"><?php echo $row['countID3'] ?></span>
                  คน</p>
                <? } ?>
              </div>
            </div>
          </div>






          <div class="col-lg-12 mt-4" style="text-align: left;">
            <label for="text" class="control-label" style="font-weight:bold; font-size:24px;"> [ สาเหตุและจำนวนที่ผู้สูงอายุเลือก <label style="color:#1B4793;font-weight:bold;">ไม่มีความสุข ]</label></label>


<hr>
            <div class="accordion">

              <div>
                <?php
                                       if(isset($_GET["id"]))
                                       {
                                        $id= $_GET["id"];
                                       }
                                       $conn = mysqli_connect("localhost","root","","Alder");
                                       $conn->set_charset('utf8');
                                       $sql = "SELECT COUNT(supplementAfter.id) as countA
                                       FROM supplementAfter
                                       LEFT JOIN user_apps ON supplementAfter.user_id = user_apps.id
                                       LEFT JOIN post_timelines ON supplementAfter.post_timeline_id = post_timelines.id
                                       LEFT JOIN decide_supplement ON supplementAfter.decide_supplement_id = decide_supplement.id
                                       LEFT JOIN exception_disease ON supplementAfter.user_id = exception_disease.disease_user_apps
                                       LEFT JOIN disease ON exception_disease.disease_id = disease.id
                                       WHERE supplementAfter.post_timeline_id = '$id' AND decide_supplement.id = 1";

                                       $result = $conn-> query($sql);
                                       $conn-> close();

                                       ?>
              </div>

              <input id="toggle1" type="radio" class="accordion-toggle" name="toggle" />
              <?while ($row = $result-> fetch_assoc()) {?>
              <!-- <label for="toggle1">1. สภาพแวดล้อมในกิจกรรมไม่เอื้ออำนวย (<?php echo $row['countA'] ?>)</label> -->
                <p style="font-weight:bold;font-size:20px;">1. สภาพแวดล้อมในกิจกรรมไม่เอื้ออำนวย (<?php echo $row['countA'] ?>)</p>
              <? } ?>


              <div>
                <?php
                                         if(isset($_GET["id"]))
                                         {
                                          $id= $_GET["id"];
                                         }
                                         $conn = mysqli_connect("localhost","root","","Alder");
                                         $conn->set_charset('utf8');
                                         $sql = "SELECT post_timelines.id,user_apps.username, user_apps.surname,user_apps.photo,user_apps.tel,decide_supplement.title,exception_disease.*,disease.diseaseName_th
                                         FROM supplementAfter
                                         LEFT JOIN user_apps ON supplementAfter.user_id = user_apps.id
                                         LEFT JOIN post_timelines ON supplementAfter.post_timeline_id = post_timelines.id
                                         LEFT JOIN decide_supplement ON supplementAfter.decide_supplement_id = decide_supplement.id
                                         LEFT JOIN exception_disease ON supplementAfter.user_id = exception_disease.disease_user_apps
                                         LEFT JOIN disease ON exception_disease.disease_id = disease.id
                                         WHERE supplementAfter.post_timeline_id = '$id' AND decide_supplement.id = 1";

                                         $result = $conn-> query($sql);
                                         $conn-> close();

                                         ?>
              </div>

              <!-- <section> -->
              <?while ($row = $result-> fetch_assoc()) {?>
                <div class="row col-12">

                  <div class="col-lg-1">
                    <img src='/alder_iosapp/<?php echo $row['photo'] ?>' class="rounded-circle" style="width:50px;height:50px;" alt="">
                  </div>

                  <div class="col-lg-3 mt-3">
                    <p style="font-size:16px;"><?php echo $row['username'] ?> </p>
                  </div>

                  <div class="col-lg-3 mt-3">
                    <p style="font-size:16px;"> <?php echo $row['surname'] ?></p>
                  </div>
                  <div class="col-lg-2 mt-3">
                    <p style="font-size:16px;"><?php echo $row['tel'] ?></p>
                  </div>

                  <div class="col-lg-3 mt-3">
                    <p style="font-size:16px;"><?php echo $row['diseaseName_th'] ?></p>
                  </div>

                </div>
                <hr>
            <? } ?>
              <!-- </section> -->






            <div class="accordion">



              <div>
                <?php
                                         if(isset($_GET["id"]))
                                         {
                                          $id= $_GET["id"];
                                         }
                                         $conn = mysqli_connect("localhost","root","","Alder");
                                         $conn->set_charset('utf8');
                                         $sql = "SELECT COUNT(supplementAfter.id) as countA
                                         FROM supplementAfter
                                         LEFT JOIN user_apps ON supplementAfter.user_id = user_apps.id
                                         LEFT JOIN post_timelines ON supplementAfter.post_timeline_id = post_timelines.id
                                         LEFT JOIN decide_supplement ON supplementAfter.decide_supplement_id = decide_supplement.id
                                         LEFT JOIN exception_disease ON supplementAfter.user_id = exception_disease.disease_user_apps
                                         LEFT JOIN disease ON exception_disease.disease_id = disease.id
                                         WHERE supplementAfter.post_timeline_id = '$id' AND decide_supplement.id = 2";

                                         $result = $conn-> query($sql);
                                         $conn-> close();

                                         ?>
              </div>

              <input id="toggle2" type="radio" class="accordion-toggle" name="toggle" />
              <?while ($row = $result-> fetch_assoc()) {?>
              <!-- <label for="toggle2">2. ผู้ดูแลมีการดูแลที่ไม่ทั่วถึง (<?php echo $row['countA'] ?>)</label> -->
              <p style="font-weight:bold;font-size:20px;">2. ผู้ดูแลมีการดูแลที่ไม่ทั่วถึง (<?php echo $row['countA'] ?>)</p>
              <? } ?>


              <div>
                <?php
                                         if(isset($_GET["id"]))
                                         {
                                          $id= $_GET["id"];
                                         }
                                         $conn = mysqli_connect("localhost","root","","Alder");
                                         $conn->set_charset('utf8');
                                         $sql = "SELECT post_timelines.id,user_apps.username, user_apps.surname,user_apps.photo,user_apps.tel,decide_supplement.title,exception_disease.*,disease.diseaseName_th
                                         FROM supplementAfter
                                         LEFT JOIN user_apps ON supplementAfter.user_id = user_apps.id
                                         LEFT JOIN post_timelines ON supplementAfter.post_timeline_id = post_timelines.id
                                         LEFT JOIN decide_supplement ON supplementAfter.decide_supplement_id = decide_supplement.id
                                         LEFT JOIN exception_disease ON supplementAfter.user_id = exception_disease.disease_user_apps
                                         LEFT JOIN disease ON exception_disease.disease_id = disease.id
                                         WHERE supplementAfter.post_timeline_id = '$id' AND decide_supplement.id = 2";

                                         $result = $conn-> query($sql);
                                         $conn-> close();

                                         ?>
              </div>


              <!-- <section> -->
              <?while ($row = $result-> fetch_assoc()) {?>
                <div class="row col-12">

                  <div class="col-lg-1">
                    <img src='/alder_iosapp/<?php echo $row['photo'] ?>' class="rounded-circle" style="width:50px;height:50px;" alt="">
                  </div>

                  <div class="col-lg-3 mt-3">
                    <p style="font-size:16px;"><?php echo $row['username'] ?> </p>
                  </div>

                  <div class="col-lg-3 mt-3">
                    <p style="font-size:16px;"> <?php echo $row['surname'] ?></p>
                  </div>
                  <div class="col-lg-2 mt-3">
                    <p style="font-size:16px;"><?php echo $row['tel'] ?></p>
                  </div>

                  <div class="col-lg-3 mt-3">
                    <p style="font-size:16px;"><?php echo $row['diseaseName_th'] ?></p>
                  </div>

                </div>
                <hr>
            <? } ?>
              <!-- </section> -->


            <div class="accordion">


              <div>
                <?php
                                         if(isset($_GET["id"]))
                                         {
                                          $id= $_GET["id"];
                                         }
                                         $conn = mysqli_connect("localhost","root","","Alder");
                                         $conn->set_charset('utf8');
                                         $sql = "SELECT COUNT(supplementAfter.id) as countA
                                         FROM supplementAfter
                                         LEFT JOIN user_apps ON supplementAfter.user_id = user_apps.id
                                         LEFT JOIN post_timelines ON supplementAfter.post_timeline_id = post_timelines.id
                                         LEFT JOIN decide_supplement ON supplementAfter.decide_supplement_id = decide_supplement.id
                                         LEFT JOIN exception_disease ON supplementAfter.user_id = exception_disease.disease_user_apps
                                         LEFT JOIN disease ON exception_disease.disease_id = disease.id
                                         WHERE supplementAfter.post_timeline_id = '$id' AND decide_supplement.id = 3";

                                         $result = $conn-> query($sql);
                                         $conn-> close();

                                         ?>
              </div>

              <input id="toggle3" type="radio" class="accordion-toggle" name="toggle" />
              <?while ($row = $result-> fetch_assoc()) {?>
              <!-- <label for="toggle3">3. กิจกรรมที่จัดขึ้นมีความน่าสนใจน้อยกว่าที่ควร (<?php echo $row['countA'] ?>)</label> -->
                <p style="font-weight:bold;font-size:20px;">3. กิจกรรมที่จัดขึ้นมีความน่าสนใจน้อยกว่าที่ควร (<?php echo $row['countA'] ?>)</p>

              <? } ?>


              <div>
                <?php
                                         if(isset($_GET["id"]))
                                         {
                                          $id= $_GET["id"];
                                         }
                                         $conn = mysqli_connect("localhost","root","","Alder");
                                         $conn->set_charset('utf8');
                                         $sql = "SELECT post_timelines.id,user_apps.username, user_apps.surname,user_apps.photo,user_apps.tel,decide_supplement.title,exception_disease.*,disease.diseaseName_th
                                         FROM supplementAfter
                                         LEFT JOIN user_apps ON supplementAfter.user_id = user_apps.id
                                         LEFT JOIN post_timelines ON supplementAfter.post_timeline_id = post_timelines.id
                                         LEFT JOIN decide_supplement ON supplementAfter.decide_supplement_id = decide_supplement.id
                                         LEFT JOIN exception_disease ON supplementAfter.user_id = exception_disease.disease_user_apps
                                         LEFT JOIN disease ON exception_disease.disease_id = disease.id
                                         WHERE supplementAfter.post_timeline_id = '$id' AND decide_supplement.id = 3";

                                         $result = $conn-> query($sql);
                                         $conn-> close();

                                         ?>
              </div>

              <!-- <section> -->
              <?while ($row = $result-> fetch_assoc()) {?>
                <div class="row col-12">

                  <div class="col-lg-1">
                    <img src='/alder_iosapp/<?php echo $row['photo'] ?>' class="rounded-circle" style="width:50px;height:50px;" alt="">
                  </div>

                  <div class="col-lg-3 mt-3">
                    <p style="font-size:16px;"><?php echo $row['username'] ?> </p>
                  </div>

                  <div class="col-lg-3 mt-3">
                    <p style="font-size:16px;"> <?php echo $row['surname'] ?></p>
                  </div>
                  <div class="col-lg-2 mt-3">
                    <p style="font-size:16px;"><?php echo $row['tel'] ?></p>
                  </div>

                  <div class="col-lg-3 mt-3">
                    <p style="font-size:16px;"><?php echo $row['diseaseName_th'] ?></p>
                  </div>

                </div>
                <hr>
            <? } ?>
              <!-- </section> -->


            <div class="accordion">
              <div>
                <?php
                                         if(isset($_GET["id"]))
                                         {
                                          $id= $_GET["id"];
                                         }
                                         $conn = mysqli_connect("localhost","root","","Alder");
                                         $conn->set_charset('utf8');
                                         $sql = "SELECT COUNT(supplementAfter.id) as countA
                                         FROM supplementAfter
                                         LEFT JOIN user_apps ON supplementAfter.user_id = user_apps.id
                                         LEFT JOIN post_timelines ON supplementAfter.post_timeline_id = post_timelines.id
                                         LEFT JOIN decide_supplement ON supplementAfter.decide_supplement_id = decide_supplement.id
                                         LEFT JOIN exception_disease ON supplementAfter.user_id = exception_disease.disease_user_apps
                                         LEFT JOIN disease ON exception_disease.disease_id = disease.id
                                         WHERE supplementAfter.post_timeline_id = '$id' AND decide_supplement.id = 4";

                                         $result = $conn-> query($sql);
                                         $conn-> close();

                                         ?>
              </div>

              <input id="toggle4" type="radio" class="accordion-toggle" name="toggle" />
              <?while ($row = $result-> fetch_assoc()) {?>
              <!-- <label for="toggle4">4. สภาพแวดล้อมในกิจกรรมไม่เอื้ออำนวย (<?php echo $row['countA'] ?>)</label> -->
              <p style="font-weight:bold;font-size:20px;">4. สภาพแวดล้อมในกิจกรรมไม่เอื้ออำนวย (<?php echo $row['countA'] ?>)</p>
              <? } ?>


              <div>
                <?php
                                         if(isset($_GET["id"]))
                                         {
                                          $id= $_GET["id"];
                                         }
                                         $conn = mysqli_connect("localhost","root","","Alder");
                                         $conn->set_charset('utf8');
                                         $sql = "SELECT post_timelines.id,user_apps.username, user_apps.surname,user_apps.photo,user_apps.tel,decide_supplement.title,exception_disease.*,disease.diseaseName_th
                                         FROM supplementAfter
                                         LEFT JOIN user_apps ON supplementAfter.user_id = user_apps.id
                                         LEFT JOIN post_timelines ON supplementAfter.post_timeline_id = post_timelines.id
                                         LEFT JOIN decide_supplement ON supplementAfter.decide_supplement_id = decide_supplement.id
                                         LEFT JOIN exception_disease ON supplementAfter.user_id = exception_disease.disease_user_apps
                                         LEFT JOIN disease ON exception_disease.disease_id = disease.id
                                         WHERE supplementAfter.post_timeline_id = '$id' AND decide_supplement.id = 4";

                                         $result = $conn-> query($sql);
                                         $conn-> close();

                                         ?>
              </div>


              <!-- <section> -->
              <?while ($row = $result-> fetch_assoc()) {?>
                <div class="row col-12">

                  <div class="col-lg-1">
                    <img src='/alder_iosapp/<?php echo $row['photo'] ?>' class="rounded-circle" style="width:50px;height:50px;" alt="">
                  </div>

                  <div class="col-lg-3 mt-3">
                    <p style="font-size:16px;"><?php echo $row['username'] ?> </p>
                  </div>

                  <div class="col-lg-3 mt-3">
                    <p style="font-size:16px;"> <?php echo $row['surname'] ?></p>
                  </div>
                  <div class="col-lg-2 mt-3">
                    <p style="font-size:16px;"><?php echo $row['tel'] ?></p>
                  </div>

                  <div class="col-lg-3 mt-3">
                    <p style="font-size:16px;"><?php echo $row['diseaseName_th'] ?></p>
                  </div>

                </div>
                <hr>
            <? } ?>
              <!-- </section> -->



          </div>

        </div>

      </div>
      <div>


        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>
