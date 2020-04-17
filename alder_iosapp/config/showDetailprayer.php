<?php
if(isset($_GET["id"]))
{
	$id= $_GET["id"];
}
$conn = mysqli_connect("localhost","root","","Alder");
$conn->set_charset('utf8');
$sql = "SELECT * FROM prayer WHERE prayer.id ='$id' ";

$query = mysqli_query($conn,$sql);
$result=mysqli_fetch_array($query,MYSQLI_ASSOC);
?>

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


				<li>
					<a href="/alder_iosapp/config/activity.php">
						<i class="menu-icon far fa-calendar-alt" style="color:  #fff;"></i><span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;กิจกรรมที่จัด</span>
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

	<div class="page-inner no-page-title" style="background:#fff;">
		<div id="main-wrapper">
			<h2 style="font-family: 'Bai Jamjuree', sans-serif; font-weight: bold;font-size:40px;color:#1B4793;">เพลง : " <?php echo $result["title"];?> "</h2>
			<div class="card mt-2 col-lg-12" style="margin-top: 30px !important; border-radius:15px;">
				<div class="card-body" style="font-family: 'Bai Jamjuree', sans-serif;">
					<!--สันทนาการ-->
					<form id="myForm" action="../func/savePrayer.php" method="post" enctype="multipart/form-data">
						<!-- <form action="../func/saveVideo.php" method="post" enctype="multipart/form-data"> -->
						<div class="upload imgpreview">
							<p style="text-align:center;">
								<img class="imgtest rounded-circle" src='/alder_iosapp/<?php echo $result['image'] ?>' style="width:200px;height:200px;" alt="">
							</p>

							<p style="text-align:center;">
								<label for="due" class="imgtest" style="font-weight:bold;">รูปภาพปก :</label>
							</p>

							<p style="text-align:center;">
								<input type="file" class="input-file inputtest" name="image" id="image">
							</p>
						</div>

						<div class="form-group col-12">
							<input type="hidden" name="id" id="id" value="<?php echo $result["id"];?>">
						</div>

						<div class="row col-12">
							<div class="form-group col-12">
								<label for="text" class="control-label" style="font-weight:bold;">ชื่อเพลง</label>
								<input class="form-control" name="title" type="text" id="title" value="<?php echo $result["title"];?>">
							</div>

							<div class="form-group col-6">
								<label for="exampleFormControlSelect2" style="font-weight:bold;">นักร้อง</label>
								<input class="form-control" id="content" name="content" value="<?php echo $result["content"];?>">
							</div>

							<div class="form-group col-6">
								<label for="exampleFormControlSelect2" style="font-weight:bold;">ข้อมูลเพิ่มเติม</label>
								<input class="form-control" id="credit" name="credit" value="<?php echo $result["credit"];?>">
							</div>

							<div class="form-group col-12">
								<div style="float:right;">
									<input class="btn offset-1" type="hidden">
									<button class="submit" type="submit" style="background: #FAC92C;color:#fff;font-family: 'Bai Jamjuree', sans-serif; font-weight: 700;padding:12px;border-radius:5px;border:none;"><i class="fas fa-user-edit"></i> แก้ไขบทสวดมนต์</button>&nbsp;&nbsp;
									<a class="btnbtn btn-danger" href="../func/deletePrayer.php?delete=<?php echo $result["id"];?>"
										style="background: #FAC92C;color:#fff;font-family: 'Bai Jamjuree', sans-serif; font-weight: 700;padding:14px;border-radius:5px;color:#fff;">
										<span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:normal;">
											<i class="fas fa-trash"></i> ลบบทสวดมนต์
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
		var content = $('#content').val();
		var credit = $('#credit').val();

		if(title == '' || content == ''|| credit == ''){
			Swal.fire({
				icon: 'error',
				title: 'กรอกข้อมูลให้ครบถ้วน',
				text: 'กรอกข้อมูลให้ครบถ้วน'
			})
		}else{
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
					}else{
					}
				});

			}

	});
	</script>

	<script>
	$('.btnbtn').on('click',function(e){
			e.preventDefault();
			const href = $(this).attr('href')
			Swal.fire({
				icon : 'error',
				title: 'ต้องการลบข้อมูล',
				text: 'แน่ใจที่ต้องการจะลบ',
				type: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Delete'
			}).then((result) => {
				 if(result.value){
					 document.location.href = href;
				 }
			})

	})

	</script>

	<script src="../func/sweetalert2.all.min.js"></script>

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
