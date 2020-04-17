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

<body>

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
											<img src='/alder_iosapp/<?php echo $row['photo'] ?>' class="rounded-circle" style="width:50px;height:50px;" alt="">
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
		setTimeout(function() {

			document.querySelector(".inputtest").addEventListener('change', e => {
				document.querySelector('.imgtest').src = URL.createObjectURL(e.target.files[0]);
				console.log("test =", e)
			});

		}, 1000)
	</script>

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>
