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


        <li>
          <a href="/alder_iosapp/config/activity.php">
            <i class="menu-icon far fa-calendar-alt" style="color: #fff;"></i><span style="color: #fff; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;กิจกรรมที่จัด</span>
          </a>
        </li>

        <li class="menu-active">
          <a href="/alder_iosapp/config/createActivity.php">
            <i class="menu-icon far fa-calendar-plus" style="color: #174495;"></i><span style="color: #174495; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;สร้างกิจกรรม</span>
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
      <h2 class="mt-4" style="font-family: 'Bai Jamjuree', sans-serif; font-weight: bold;font-size:40px;color:#1B4793;">สร้างกิจกรรม &nbsp;<i class="fas fa-users"></i></h2>
      <!-- <div style="text-align: center"><a class="btn btn-info" href="/"><i class="fas fa-chevron-left"></i> Go Back</a></div> -->
      <hr>
      <div class="card mt-2 col-lg-12" style="margin-top: 30px !important; border-radius:15px;">
        <div class="card-body" style="font-family: 'Bai Jamjuree', sans-serif;">
          <form id="myForm" action="../func/insertActivity.php" method="post" enctype="multipart/form-data">

            <div class="row">
              <div class="form-group col-12">
                <label for="text" class="control-label" style="font-weight:bold;">ชื่อกิจกรรม : </label>
                <input class="form-control" name="title" type="text" id="title" placeholder="ชื่อกิจกรรม">
              </div>
            </div>


            <!-- <input type="hidden" name="user_id" value="1"> -->
            <div class="row">
              <div class="form-group col-12">
                <label for="exampleFormControlSelect2" style="font-weight:bold;">ผู้ดูแล : </label>
                <select class="form-control" id="user_id" name="user_id" style="height:40px;">
                  <option value="1">admin</option>
                  <option value="2">doctor</option>
                  <option value="3">hr</option>
                </select>
              </div>
            </div>

            <div class="row">
              <div class="form-group col-6">
                <label for="exampleFormControlSelect2" style="font-weight:bold;">ประเภทกิจกรรม : </label>
                <select class="form-control" id="type" name="type" style="height:40px;">
                  <option value="1">กิจกรรมสร้างสุข</option>
                  <option value="2">พัฒนาฝึกสมอง</option>
                  <option value="3">กายภาพบำบัด</option>
                </select>
              </div>

              <div class="form-group col-6">
                <label for="exampleFormControlSelect1" style="font-weight:bold;">หมวดหมู่ความสนใจ : </label>
                <select class="form-control" id="act_id" name="act_id" style="height:40px;">
                  <option value="1">กีฬา</option>
                  <option value="1">ทำอาหาร</option>
                  <option value="2">ศาสนา</option>
                  <option value="2">งานประดิษฐ์</option>
                  <option value="3">ออกกำลังกาย</option>
                  <option value="3">ความรู้</option>
                  <option value="1">ผ่อนคลาย</option>
                  <option value="3">ทำสวน</option>
                </select>
              </div>
            </div>

            <div class="row">
              <div class="form-group col-6">
                <label for="text" class="control-label" style="font-weight:bold;">ผู้นำกิจกรรม : </label>
                <input class="form-control" name="leaderActivity" type="text" id="leaderActivity" placeholder="ผู้นำกิจกรรม">
              </div>

              <div class="form-group col-6">
                <label for="text" class="control-label" style="font-weight:bold;">ผู้ช่วย : </label>
                <input class="form-control" name="assistantActivity" type="text" id="assistantActivity" placeholder="ผู้ช่วย">
              </div>


                <div class="form-group col-6">
                  <label for="exampleFormControlSelect2" style="font-weight:bold;">ศูนย์ : </label>
                  <input class="form-control" name="center" type="text" id="center" placeholder="ศูนย์">
                </div>


              <div class="form-group col-6">
                <label for="text" class="control-label" style="font-weight:bold;">จำนวนสูงสุง(ตัวเลข) : </label>
                <input class="form-control" name="maxJoin" type="text" id="maxJoin" placeholder="ยกตัวอย่าง 50">
              </div>

            </div>

            <div class="row">
              <div class="form-group col-6">
                <label for="text" class="control-label" style="font-weight:bold;">วันที่เริ่มกิจกรรม : </label>
                <input class="form-control" name="startDate" type="date" id="startDate">
              </div>

              <div class="form-group col-6">
                <label for="text" class="control-label" style="font-weight:bold;">วันที่สิ้นสุดกิจกรรม : </label>
                <input class="form-control " name="endDate" type="date" id="endDate">
              </div>
            </div>

            <div class="row">
              <div class="form-group col-6">
                <label for="text" class="control-label" style="font-weight:bold;">เวลาเริ่ม : </label>
                <input class="form-control" name="startTime" type="time" id="startTime">
              </div>
              <div class="form-group col-6">
                <label for="text" class="control-label" style="font-weight:bold;">เวลาสิ้นสุด : </label>
                <input class="form-control" name="endTime" type="time" id="endTime">
              </div>
            </div>

            <div class="row">
              <div class="form-group col-12">
                <label for="body" class="control-label" style="font-weight:bold;">วัตถุประสงค์ : </label>
                <textarea class="form-control" name="objective" type="text" rows="3" id="objective" placeholder="วัตถุประสงค์"></textarea>
              </div>

              <div class="form-group col-12">
                <label for="body" class="control-label" style="font-weight:bold;">รายละเอียดกิจกรรม : </label>
                <textarea class="form-control" name="content" cols="50" rows="5" id="content" placeholder="รายละเอียดกิจกรรม"></textarea>
              </div>

              <div class="form-group col-12">
                <label for="body" class="control-label" style="font-weight:bold;">วัสดุ/อุปกรณ์ : </label>
                <textarea class="form-control" name="equipment" cols="50" rows="5" id="equipment" placeholder="วัสดุ/อุปกรณ์"></textarea>
              </div>
            </div>

            <div class="row">
              <div class="form-group col-12">
                <label for="due" class="control-label" style="font-weight:bold;">รูปภาพปก : </label>
                <div class="upload imgpreview">
                  <img class="imgtest" src="" alt="" width="400">

                  <div class="controls">
                    <input type="file" class="input-file inputtest" name="image" id="image">
                  </div>

                </div>
              </div>
              <div class="form-group col-12">
                <div style="float:right;">
                  <button class="submit" type="Submit" style="background: #419F5D;color:#fff;font-family: 'Bai Jamjuree', sans-serif; font-weight: 700;padding:12px;border-radius:5px;border:none;"><i class="fas fa-plus"></i>
                    สร้างกิจกรรม</button>&nbsp;&nbsp;
                </div>
              </div>
            </div>




          </form>
        </div>
      </div>
    </div>
  </div>
  <br>
  <br>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <script src="../func/sweetalert2.all.min.js"></script>

  <script>
    $(document).on('click', '.submit', function(e) {
      e.preventDefault();
      var title = $('#title_video').val();
      var user_id = $('#user_id').val();
      var type = $('#type').val();
      var act_id = $('#act_id').val();
      var leaderActivity = $('#leaderActivity').val();
      var assistantActivity = $('#assistantActivity').val();
      var center = $('#center').val();
      var maxJoin = $('#maxJoin').val();
      var startDate = $('#startDate').val();
      var endDate = $('#endDate').val();
      var startTime = $('#startTime').val();
      var endTime = $('#endTime').val();
      var objective = $('#objective').val();
      var content = $('#content').val();
      var equipment = $('#equipment').val();
      var image = $('#image').val();

      if (title == '' || user_id == '' || image == '' || type == '' || act_id == '' || leaderActivity == '' || assistantActivity == '' || center == ''||maxJoin == '' || startDate == '' || endDate == '' || startTime == '' || endTime == '' || objective == '' || content == '' ||
        equipment == '') {
        Swal.fire({
          icon: 'error',
          title: 'กรอกข้อมูลให้ครบถ้วน'
        })
      } else {
        Swal.fire({
          icon: 'question',
          title: 'ยืนยันการสร้างกิจกรรม',
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
