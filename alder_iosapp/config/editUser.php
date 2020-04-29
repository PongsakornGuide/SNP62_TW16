<?php
if(isset($_GET["id"]))
{
	$id= $_GET["id"];
}
$conn = mysqli_connect("localhost","root","","Alder");
$conn->set_charset('utf8');

$sql = "SELECT user_apps.*, disease.diseaseName_th FROM user_apps
LEFT JOIN exception_disease ON user_apps.id = exception_disease.disease_user_apps
LEFT JOIN disease ON exception_disease.disease_id = disease.id
WHERE user_apps.id ='$id'";
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

	<div class="page-inner no-page-title">
		<div id="main-wrapper">

			<input type="hidden" name="_method" value="put">
			<h2 style="font-family: 'Bai Jamjuree', sans-serif; font-weight: bold;font-size:40px;color:#1B4793;">แก้ไขข้อมูล : คุณ&nbsp;" <?php echo $result["username"];?> "</h2>
			<div class="card mt-2 col-lg-12" style="margin-top: 30px !important; border-radius:15px;">
				<div class="card-body" style="font-family: 'Bai Jamjuree', sans-serif;">

					<form id="myForm" action="../func/saveUser.php" method="post" enctype="multipart/form-data">


						<div class="row">
							<div class="form-group col-12">
								<p style="text-align:center;">
									<img src='/alder_iosapp/<?php echo $result["photo"];?>' class="rounded-circle" style="width:200px;height:200px;" alt="">
								</p>
							</div>

							<div class="form-group col-12">
								<input type="hidden" name="id" id="id" value="<?php echo $result["id"];?>">
							</div>


							<div class="form-group col-6">
								<label for="text" class="control-label" style="font-weight:bold;">ชื่อ : </label>
								<input class="form-control" name="username" type="text" id="username" disabled style="background-color: rgba(233, 236, 239, 0.55)" value="<?php echo $result["username"];?>">
							</div>

							<div class="form-group col-6">
								<label for="text" class="control-label" style="font-weight:bold;">นามสกุล : </label>
								<input class="form-control" name="surname" type="text" id="surname" disabled style="background-color: rgba(233, 236, 239, 0.55)" value="<?php echo $result["surname"];?>">
							</div>
						</div>

						<div class="row">
							<div class="form-group col-3">
								<label for="text" class="control-label" style="font-weight:bold;">วันเกิด : </label>
								<input class="form-control" name="birthday" type="date" id="birthday" value="<?php echo $result["birthday"];?>">
							</div>
							<div class="form-group col-3">
								<label for="text" class="control-label" style="font-weight:bold;">เพศ : </label>
								<input class="form-control" name="gender" type="text" id="gender" value="<?php echo $result["gender"];?>">
							</div>
							<div class="form-group col-3">
								<label for="text" class="control-label" style="font-weight:bold;">ศาสนา : </label>
								<input class="form-control" name="religion" type="text" id="religion" value="<?php echo $result["religion"];?>">
							</div>
							<div class="form-group col-3">
								<label for="text" class="control-label" style="font-weight:bold;">เบอร์โทรศัพท์ : </label>
								<input class="form-control" name="tel" type="text" id="tel" value="<?php echo $result["tel"];?>">
							</div>
						</div>

						<div class="row">
							<div class="form-group col-6">
								<label for="text" class="control-label" style="font-weight:bold;">ที่อยู่ปัจจุบัน : </label>
								<input class="form-control" name="address" type="text" id="address" value="<?php echo $result["address"];?>">
							</div>

							<div class="form-group col-6">
								<label for="text" class="control-label" style="font-weight:bold;">โรคประจำตัว : </label>
								<input class="form-control" name="disease" type="text" id="disease" disabled value="<?php echo $result["diseaseName_th"];?>">
							</div>



						</div>

						<div class="row">
							<div class="form-group col-6">
								<label for="text" class="control-label" style="font-weight:bold;">ชื่อของญาติ : </label>
								<input class="form-control" name="relative_name" type="text" id="relative_name" value="<?php echo $result["relative_name"];?>">
							</div>
							<div class="form-group col-3">
								<label for="text" class="control-label" style="font-weight:bold;">เบอร์โทรศัพท์ญาติ : </label>
								<input class="form-control" name="relative_phone" type="text" id="relative_phone" value="<?php echo $result["relative_phone"];?>">
							</div>
							<div class="form-group col-3">
								<label for="text" class="control-label" style="font-weight:bold;">ความสัมพันธ์ : </label>
								<input class="form-control" name="relative_type" type="text" id="relative_type" value="<?php echo $result["relative_type"];?>">
							</div>

							<?php if ($_SESSION["email"] == 'admin@hotmail.com'){ ?>
								<div class="form-group col-12">
									<div style="float:right;">

										<a class="btnbtn btn-danger" href="../func/delete.php?delete=<?php echo $result["id"];?>" href="ssss"
											style="background: #F15A42;color:#fff;font-family: 'Bai Jamjuree', sans-serif;font-weight: bold;padding:14px;border-radius:5px;color:#fff;">
											<span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:bold;">
												<i class="fas fa-trash"></i> ลบผู้ใช้
											</span>
										</a>
										&nbsp;

										<button class="submit" type="submit" style="background: #31924E;color:#fff;font-family: 'Bai Jamjuree', sans-serif; font-weight: 700;padding:12px;border-radius:5px;border:none;"> <i class="fas fa-user-edit"></i> บันทึก</button>



									</div>
								</div>
							<?php } ?>

						</div>

					</form>

					<!-- <a href="check" class="btn-delete">Delete</a> -->

				</div>
			</div>

		</div>
	</div>
	</div>
	</div>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
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
			var username = $('#username').val();
			var surname = $('#surname').val();
			var birthday = $('#birthday').val();
			var gender = $('#gender').val();
			var religion = $('#religion').val();
			var tel = $('#tel').val();
			var address = $('#address').val();
			var disease = $('#disease').val();
			var relative_name = $('#relative_name').val();
			var relative_phone = $('#relative_phone').val();
			var relative_type = $('#relative_type').val();

			if (username == '' || surname == '' || birthday == '' || gender == '' || religion == '' || tel == '' || address == '' || disease == '' || relative_name == '' || relative_phone == '' || relative_type == '') {
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

	<script src="../func/sweetalert2.all.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>
