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

	<div class="page-inner no-page-title" style="background:#fff;">
		<div id="main-wrapper">
			<h2 style="font-family: 'Bai Jamjuree', sans-serif; font-weight: bold;font-size:40px;color:#1B4793;">กิจกรรม : " <?php echo $result["title"];?> "</h2>
			<div class="card mt-2 col-lg-12" style="margin-top: 30px !important; border-radius:15px;">
				<div class="card-body" style="font-family: 'Bai Jamjuree', sans-serif;">
					<!--สันทนาการ-->
					<form id="myForm" action="../func/saveActivity.php" method="post" enctype="multipart/form-data">



						<?php if ($_SESSION["email"] == 'admin@hotmail.com'){ ?>
							<div class="form-group col-12">
								<div style="float:right;">

										<button class="submit" type="submit" style="background: white;color:#fff;font-family: 'Bai Jamjuree', sans-serif; font-weight: 700;padding:11px;border-radius:5px;border:none;">
											<i class="fas fa-pen " style="font-size:20px;color:#1B4793;"></i>
										</button>

										<a class="btnbtn" href="../func/deleteActivity.php?delete=<?php echo $result["id"];?>"
											style="background: white;color:#fff;font-family: 'Bai Jamjuree', sans-serif; font-weight: 700;padding:13px;border-radius:5px;color:#fff;">
											<span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:bold;">
												<i class="fas fa-trash-alt" style="font-size:20px;color:#1B4793;"></i>
											</span>
										</a>

								</div>
							</div>
						<?php } ?>



						<div class="upload imgpreview mt-4">
							<p style="text-align:center;">
								<img class="imgtest rounded-circle" src='/alder_iosapp/<?php echo $result["img"];?>' style="width:200px;height:200px;" alt="">
							</p>


							<p style="text-align:center;margin-left:-100px;">
								<label for="due" class="imgtest" style="font-weight:bold;">รูปภาพปก :</label>
							</p>

							<p style="text-align:center;">
								<input type="file" class="input-file inputtest" name="image" id="image">
							</p>
						</div>

						<div class="form-group col-12">
							<input type="hidden" name="id" id="id" value="<?php echo $result["id"];?>">
						</div>

						<div class="row">
							<div class="form-group col-12">
								<label for="text" class="control-label" style="font-weight:bold;">ชื่อกิจกรรม</label>
								<input class="form-control" name="title" type="text" id="title" value="<?php echo $result["title"];?>">
							</div>
						</div>



						<div class="row">
							<div class="form-group col-6">
								<label for="exampleFormControlSelect2" style="font-weight:bold;">ประเภทกิจกรรม</label>

								<select class="form-control" id="type" name="type" style="height:40px;">
									<option value="<?php echo $result["type"];?>"> ค่าปัจจุบัน -> <?php echo $result["type"];?></option>
                  <option value="กิจกรรมสร้างสุข">กิจกรรมสร้างสุข</option>
                  <option value="พัฒนาฝึกสมอง">พัฒนาฝึกสมอง</option>
                  <option value="กายภาพบำบัด">กายภาพบำบัด</option>
                </select>

							</div>

							<div class="form-group col-6">
								<label for="exampleFormControlSelect1" style="font-weight:bold;">หมวดหมู่ความสนใจ</label>
								<!-- <input class="form-control" id="act_id"  style="background-color: rgba(233, 236, 239, 0.55)" name="act_id" value="<?php echo $result["act_id"];?>"> -->
								<select class="form-control" id="act_id" name="act_id" style="height:40px;">
									<option value="<?php echo $result["act_id"];?>"> ค่าปัจจุบัน -> <?php echo $result["act_id"];?></option>
									<option value="1">1.กิจกรรมสร้างสุข</option>
                  <option value="2">2.พัฒนาฝึกสมอง</option>
                  <option value="3">3.กายภาพบำบัด</option>
                </select>

							</div>
						</div>

						<div class="row">
							<div class="form-group col-6">
								<!-- <label for="text" class="control-label" type="hidden" style="font-weight:bold;">ผู้ดูแล </label> -->
								<input class="form-control" type="hidden" name="user_id" type="text" id="user_id" disabled style="background-color: rgba(233, 236, 239, 0.55)" value="<?php echo $result["user_id"];?>">


									<label for="exampleFormControlSelect2" style="font-weight:bold;">ศูนย์</label>
									<input class="form-control" id="center" name="center" value="<?php echo $result["center"];?>">


							</div>

							<div class="form-group col-6">
								<label for="text" class="control-label" style="font-weight:bold;">จำนวนผู้เข้าร่วม </label>
								<input class="form-control" name="maxJoin" type="text" id="maxJoin" disabled style="background-color: rgba(233, 236, 239, 0.55)" value="<?php echo $result["maxJoin"];?>">
							</div>


						</div>


						<div class="row">
							<div class="form-group col-6">
								<label for="text" class="control-label" style="font-weight:bold;">ผู้นำกิจกรรม </label>
								<input class="form-control" name="leaderActivity" type="text" id="leaderActivity" value="<?php echo $result["leaderActivity"];?>">
							</div>

							<div class="form-group col-6">
								<label for="text" class="control-label" style="font-weight:bold;">ผู้ช่วย</label>
								<input class="form-control" name="assistantActivity" type="text" id="assistantActivity" value="<?php echo $result["assistantActivity"];?>">
							</div>
						</div>

						<div class="row">
							<div class="form-group col-6">
								<label for="text" class="control-label" style="font-weight:bold;">วันที่เริ่มกิจกรรม</label>
								<input class="form-control " name="startDate" type="date" id="startDate" value="<?php echo $result["startDate"];?>">
							</div>

							<div class="form-group col-6">
								<label for="text" class="control-label" style="font-weight:bold;">วันที่สิ้นสุดกิจกรรม</label>
								<input class="form-control " name="endDate" type="date" id="endDate" value="<?php echo $result["endDate"];?>">
							</div>

							<div class="form-group col-6">
								<label for="text" class="control-label" style="font-weight:bold;">เวลาเริ่ม</label>
								<input class="form-control" name="startTime" type="time" id="startTime" value="<?php echo $result["startTime"];?>">
							</div>
							<div class="form-group col-6">
								<label for="text" class="control-label" style="font-weight:bold;">เวลาจบ</label>
								<input class="form-control" name="endTime" type="time" id="endTime" value="<?php echo $result["endTime"];?>">
							</div>
						</div>

						<div class="row">

							<div class="form-group col-12">
								<label for="body" class="control-label" style="font-weight:bold;">รายละเอียดกิจกรรม</label>
								<textarea class="form-control" name="content" cols="50" rows="5" id="content"><?php echo $result["content"];?></textarea>
							</div>

							<div class="form-group col-12">
								<label for="text" class="control-label" style="font-weight:bold;">วัตถุประสงค์</label>
								<textarea class="form-control" name="objective" cols="50" rows="5" id="objective"><?php echo $result["objective"];?></textarea>
							</div>

							<div class="form-group col-12">
								<label for="body" class="control-label" style="font-weight:bold;">วัสดุ/อุปกรณ์</label>
								<textarea class="form-control" name="equipment" cols="500" rows="5" id="equipment"><?php echo $result["equipment"];?></textarea>
							</div>

							<div class="form-group col-12">
								<div style="float:right;">
									<input class="btn offset-1" type="hidden">

									&nbsp;

									<a class="btn" href="/alder_iosapp/config/listUserJoin.php?id=<?php echo $result["id"];?>" style="background: #2178AE;color:#fff;font-family: 'Bai Jamjuree', sans-serif; font-weight: 700;padding:10px;border-radius:5px;color:#fff;">
										<span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:bold;">
											<i class="fas fa-user-plus"></i> รายชื่อผู้เข้าร่วม
										</span>
									</a>
									&nbsp;
									<a class="btn" href="/alder_iosapp/config/beforerateUserView.php?id=<?php echo $result["id"];?>" style="background: #f15a42;color:#fff;font-family: 'Bai Jamjuree', sans-serif; font-weight: 700;padding:10px;border-radius:5px;color:#fff;">
										<span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:bold;">
											<i class="fas fa-chart-pie"></i> สรุปประเมินก่อนกิจกรรม
										</span>
									</a>

									&nbsp;
									<a class="btn" href="/alder_iosapp/config/rateUserView.php?id=<?php echo $result["id"];?>" style="background: #1B4793;color:#fff;font-family: 'Bai Jamjuree', sans-serif; font-weight: 700;padding:10px;border-radius:5px;color:#fff;">
										<span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:bold;">
											<i class="fas fa-chart-pie"></i> สรุปประเมินหลังกิจกรรม
										</span>
									</a>

									&nbsp;
									<a class="btn" href="/alder_iosapp/config/summaryActivity.php?id=<?php echo $result["id"];?>" style="background: green;font-family: 'Bai Jamjuree', sans-serif; font-weight: 700;padding:10px;border-radius:5px;color:#000;">
										<span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:bold;">
											<i class="fas fa-chart-pie"></i> กราฟสรุปผล
										</span>
									</a>
								</div>
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

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script src="../func/sweetalert2.all.min.js"></script>


	<!-- <script>
	$(document).on('click', '.submit', function(e) {
		e.preventDefault();
		Swal.fire({
			icon : 'question',
			title: 'ต้องการแก้ไขข้อมูล',
			text: 'แก้ไขข้อมูล',
			type: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'OK'
		}).then(function (result) {
			if(result.value){
				$('#myForm').submit();
			}
		});
	});
	</script> -->

	<script>
		$(document).on('click', '.submit', function(e) {
			e.preventDefault();
			var title = $('#title').val();
			var user_id = $('#user_id').val();
			var type = $('#type').val();
			var act_id = $('#act_id').val();
			var center = $('#center').val();
			var leaderActivity = $('#leaderActivity').val();
			var assistantActivity = $('#assistantActivity').val();
			var maxJoin = $('#maxJoin').val();
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			var startTime = $('#startTime').val();
			var endTime = $('#endTime').val();
			var objective = $('#objective').val();
			var content = $('#content').val();
			var equipment = $('#equipment').val();

			if (title == '' || user_id == '' || type == '' || center == '' || act_id == '' || leaderActivity == '' || assistantActivity == '' || maxJoin == '' || startDate == '' || endDate == '' || startTime == '' || endTime == '' || objective == '' || content == '' ||
				equipment == '') {
				Swal.fire({
					icon: 'error',
					title: 'กรอกข้อมูลให้ครบถ้วน',
					text: 'กรอกข้อมูลให้ครบถ้วน'
				})
			} else {
				Swal.fire({
					icon: 'question',
					title: 'ต้องการแก้ไขข้อมูล',
					text: 'แก้ไขข้อมูล',
					type: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: 'OK'
				}).then(function(result) {
					if (result.value) {
						$('#myForm').submit();
					} else {}
				});

			}

		});
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
