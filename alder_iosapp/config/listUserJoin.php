<?php
 include('../func/auth.php')
 ?>


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

  <div class="page-inner no-page-title" style="background:white;">
    <div id="main-wrapper">
      <div class="row mt-4">
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
				$sql = "SELECT COUNT(join_activity.id) as CountJoin , join_activity.post_timeline_id
				FROM join_activity
				LEFT JOIN user_apps ON join_activity.user_id = user_apps.id
				LEFT JOIN exception_disease ON join_activity.user_id = exception_disease.disease_user_apps
				LEFT JOIN disease ON exception_disease.disease_id = disease.id
				LEFT JOIN post_timelines ON join_activity.post_timeline_id = post_timelines.id WHERE join_activity.post_timeline_id = '$id' ";

				$query = mysqli_query($conn,$sql);
				$result=mysqli_fetch_array($query,MYSQLI_ASSOC);
				?>
          </div>
          <h4 class="col-2 mt-4" style="font-family: 'Bai Jamjuree', sans-serif; font-size:16px">จำนวนผู้สูงอายุ <span style="font-weight:600; font-size:22px;color: #FAC92C;"> <?php echo $result['CountJoin'] ?> </span> คน</h4>

      </div>


      <div class="row mt-4">
        <div class="col-lg-12">
          <div class="card" id="fixed-header" style="border-radius: 10px;">
            <div class="card-body" style="font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">




              <div class="container">
                <section>
                  <div class="row col-12" >
                    <div class="col-1">
                      <p style="font-size:16px;">รูปภาพ</p>
                    </div>
                    <div class="col-3">
                      <p style="font-size:16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อ - นามสกุล</p>
                    </div>
                    <div class="col-2">
                      <p style="font-size:16px;">เบอร์ติดต่อ</p>
                    </div>
                    <div class="col-2">
                      <p style="font-size:16px;">ก่อน</p>
                    </div>
                    <div class="col-2">
                      <p style="font-size:16px;">หลัง</p>
                    </div>

                  <?php if ($_SESSION["email"] == 'admin@hotmail.com'){ ?>
                      <div class="col-2">
                        <p style="font-size:16px;">ลบ</p>
                      </div>
                  <?php } ?>

                  </div>
                  <hr>
                </section>



                <!-- <?php

                   ?> -->



                <?php
                if(isset($_GET["id"]))
                {
                 $id= $_GET["id"];
                }
                $conn = mysqli_connect("localhost","root","","Alder");
                $conn->set_charset('utf8');
                $sql = "SELECT join_activity.id as IdJoin, user_apps.id as UserId ,user_apps.photo, user_apps.username, user_apps.surname, user_apps.tel, user_apps.religion,join_activity.post_timeline_id,decides.user_id as UderDecide, decide_afters.user_id as UderDecideAfter
FROM user_apps
LEFT JOIN join_activity ON user_apps.id = join_activity.user_id
LEFT JOIN decides ON decides.user_id = user_apps.id
LEFT JOIN decide_afters ON decide_afters.user_id = user_apps.id WHERE join_activity.post_timeline_id = '$id' AND user_apps.id = user_apps.id GROUP BY user_apps.id";
                // Group by UderDecideAfter
                $result = $conn-> query($sql);
                $conn-> close();




                { ?>




                <?while ($row = $result-> fetch_assoc() ) {?>


                <section>
                  <div class="row col-12">
                    <div class="col-1">
                      <img src='/alder_iosapp/<?php echo $row['photo'] ?>' class="rounded-circle" style="width:50px;height:50px;" alt="">
                    </div>
                    <div class="col-3 mt-3">
                      <p style="font-size:15px; font-weight:500">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $row['username'] ?> &nbsp;<?php echo $row['surname'] ?></p>
                    </div>
                    <div class="col-2 mt-3">
                      <p style="font-size:15px; font-weight:500"><?php echo $row['tel'] ?></p>
                    </div>

                  <?
                  $dateStart = $row['UserId'];
                  // echo " idUser :: $dateStart";
                  // echo " idPost :: $id";
                  $conn = mysqli_connect("localhost","root","","Alder");
                  $conn->set_charset('utf8');
                  $sql = "SELECT  COUNT(*)  as numcount FROM decides WHERE decides.post_timeline_id = '$id' AND user_id = '$dateStart'";
                  // echo "$sql";
                  // Group by UderDecideAfter
                  $result2 = $conn-> query($sql);
                  $conn-> close();

                  // echo $dateStart;

                      // output data of each row
                  while($row2 = $result2->fetch_assoc()) {
                          // echo $row["id"];
                          // $check = $row2["id"];
                          // echo $row2["id"];
                          // echo $row2['numcount'];
                          if($row2['numcount'] == 0){
                            $num1 = '<p style="color:red;font-size:15px; font-weight:500;">ยังไม่ได้ประเมิน</p>';
                          }else{
                            $num1 = '<p style="color:green;font-size:15px; font-weight:500;">ประเมินแล้ว</p>';
                          }
                  }

                  ?>

                  <?

                        $conn = mysqli_connect("localhost","root","","Alder");
                        $conn->set_charset('utf8');
                        $sql2 = "SELECT COUNT(*)  as numcount FROM decide_afters WHERE decide_afters.post_timeline_id = '$id' AND user_id = '$dateStart'";
                        $result3 = $conn-> query($sql2);
                        $conn-> close();

                        while($row3 = $result3->fetch_assoc()) {

                            // echo $row3['numcount'];

                            if($row3['numcount'] == 0){
                              $num2 = '<p style="color:red;font-size:15px; font-weight:500;">ยังไม่ได้ประเมิน</p>';
                            }else{
                              $num2 = '<p style="color:green;font-size:15px; font-weight:500;">ประเมินแล้ว</p>';
                            }
                        }

                  ?>

                  <div class="col-2 mt-3">
                        <?=$num1;?>
                  </div>
                  <div class="col-2 mt-3">


                        <?=$num2;?>
                  </div>






                    <?php if ($_SESSION["email"] == 'admin@hotmail.com'){ ?>
                      <div class="col-2 mt-3">
                        <p style="font-size:15px; font-weight:500">
                          <a class="btnbtn btn-danger" href="../func/deletelistUser.php?delete=<?php echo $row['UserId'] ?>"
                            style="background: #F15A42;color:#fff;font-family: 'Bai Jamjuree', sans-serif;font-weight: bold;padding:10px;border-radius:5px;color:#fff;">
                            <span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:bold;">
                              <i class="fas fa-trash"></i> ลบผู้ใช้
                            </span>
                          </a>
                        </p>
                      </div>
                    <?php } ?>

                  </div>
                  <hr>
                  <?
                  ?>
                  <? } ?>

                  	<?php } ?>
                </section>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div><!-- Main Wrapper -->
  </div><!-- /Page Inner -->
  <br>
  <br>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script src="../func/sweetalert2.all.min.js"></script>
  <script>
    setTimeout(function() {

      document.querySelector(".inputtest").addEventListener('change', e => {
        document.querySelector('.imgtest').src = URL.createObjectURL(e.target.files[0]);
        console.log("test =", e)
      });

    }, 1000)
  </script>

  <script>
		$('.btnbtn').on('click', function(e) {
			e.preventDefault();
			const href = $(this).attr('href')
			Swal.fire({
				icon: 'error',
				title: 'ต้องการลบข้อมูลผู้สูงอายุ',
				text: 'แน่ใจที่ต้องการจะลบ',
				type: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Delete'
			}).then((result) => {
				if (result.value) {
					document.location.href = href;
				}
			})

		})
	</script>


  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>
