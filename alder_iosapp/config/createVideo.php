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
    .popover-dismiss:hover i{
        top: 15%;
        font-size: 2em;
        color:#1B4793;
        transition: 0.3s all;
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

        <li class="menu-active">
          <a href="/alder_iosapp/config/uploadVideo.php">
            <i class="menu-icon far fa-file-video" style="color: #174495;"></i><span style="color: #174495; font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">&nbsp;วิดีโอ / เพลง</span>
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
      <h2 class="mt-4" style="font-family: 'Bai Jamjuree', sans-serif; font-weight: bold;font-size:40px;color:#1B4793;">อัพโหลดวิดีโอ &nbsp;<i class="far fa-file-video"></i></h2>
      <!-- <div style="text-align: center"><a class="btn btn-info" href="/"><i class="fas fa-chevron-left"></i> Go Back</a></div> -->
      <div class="card mt-2 col-lg-12" style="margin-top: 30px !important; border-radius:15px;">
        <div class="card-body" style="font-family: 'Bai Jamjuree', sans-serif;">
          <form id="myForm" action="../func/upload.php" method="post" enctype="multipart/form-data">
            <div class="row">
              <div class="form-group col-12">
                <label for="text" class="control-label" style="font-weight:bold;">ชื่อวิดีโอ : </label>
                <input class="form-control" id="title_video" name="title_video" type="text" placeholder="ชื่อวิดีโอ">
              </div>
            </div>

            <div class="row">
              <div class="form-group col-12">
                <label for="text" class="control-label" style="font-weight:bold;">ศิลปิน : </label>
                <input class="form-control" id="singerName" name="singerName" type="text" placeholder="ศิลปิน">
              </div>
            </div>

            <div class="row">
              <div class="form-group col-12">
                <label for="exampleFormControlSelect2" style="font-weight:bold;">ศูนย์ : </label>
                <input class="form-control" name="center" type="text" id="center" placeholder="ศูนย์">
              </div>
            </div>

            <div class="row">
              <div class="form-group col-12">
                <label for="text" class="control-label" style="font-weight:bold;">url : <span style="font-size:12px;color:red;">สามารถใช้ได้กับ link ของ Youtube เท่านั้น </span></label>
                <a tabindex="0" class="popover-dismiss" role="button" data-toggle="popover" data-trigger="focus" title="*ยกตัวอย่าง" data-content="สามารถ copy link youtube มาใส่ได้เลย"> <i class="fas fa-info-circle" style="font-size:20px;"></i> </a>
                <input class="form-control" id="url" name="url" type="text" placeholder="PGupI8fgZCM">
              </div>
            </div>

            <div class="row">
              <div class="form-group col-12">
                <label for="due" class="control-label" style="font-weight:bold;">รูปภาพปก:</label>
                <div class="upload imgpreview">
                  <img class="imgtest" src="" alt="" width="400">

                  <div class="controls">
                    <input type="file" class="input-file inputtest" name="image" id="image">
                  </div>
                </div>
              </div>
              <div class="form-group col-12">
                <div style="float:right;">
                  <button class="submit" type="submit" style="background: #419F5D;color:#fff;font-family: 'Bai Jamjuree', sans-serif; font-weight: 700;padding:12px;border-radius:5px;border:none;"><i class="fas fa-plus"></i>
                    สร้างวิดีโอ</button>&nbsp;&nbsp;
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
      <br>
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
      var content = $('#url').val();
      var caption = $('#singerName').val();
      var center = $('#center').val();
      var image = $('#image').val();
      if (title == '' || content == '' || caption == '' || center == '' || image == '') {
        Swal.fire({
          icon: 'error',
          title: 'กรอกข้อมูลให้ครบถ้วน',
          text: 'กรอกข้อมูลให้ครบถ้วน'
        })
      } else {
        Swal.fire({
          icon: 'question',
          title: 'ต้องการอัพโหลดวิดีโอ',
          text: 'อัพโหลดวิดีโอ',
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
  <script type="text/javascript">
  $('.popover-dismiss').popover({
trigger: 'focus'
})

  </script>
</body>

</html>
