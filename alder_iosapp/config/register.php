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
<img src="../images/bg-login.jpg" alt="" style="width:100%;position:absolute;">
  <div class="container" style="position: fixed; margin-left: 150px;">
    <div class="row" style="margin-top: 40px;">
      <div class="box card col-lg-4 mt-4 center" style="border-radius:15px;">
        <div class="panel panel-default">
          <div class="panel-body center">
            <!-- <form class="form-horizontal mt-5" action="../func/loginAdmin.php" method="post" enctype="multipart/form-data"> -->
            <form  id="myForm" action="../func/registerUser.php" method="post" enctype="multipart/form-data">
              <p class="text-center mt-4" style="font-family:'Bai Jamjuree', sans-serif; font-weight:Bold; font-size:16px;">Welcome to</p>
              <p class="text-center" style="font-family:'Bai Jamjuree', sans-serif; font-weight:Bold; font-size:40px;color:black;">Alder</p>
              <h5 class="card-title text-center" style="font-family: 'Poppins', sans-serif; font-weight:bolder; font-size:30px;"><img src="https://uppic.cc/d/6m76" style="height: 100px;"></h5>

              <div class="form-group">
                <label for="email" class="col-md-12 control-label offset-1" style="font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">E-Mail</label>

                <div class="col-md-10 offset-1">
                  <input id="email" type="email" class="form-control" name="email" required autofocus>

                  <span class="help-block">
                    <strong></strong>
                  </span>

                </div>
              </div>

              <div class="form-group">
                <label for="password" class="col-md-12 control-label offset-1" style="font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">Name</label>
                <div class="col-md-10 offset-1">
                  <input class="form-control" id="name" name="name" required>
                  <span class="help-block">
                    <strong></strong>
                  </span>

                </div>
              </div>

              <div class="form-group">
                <label for="password" class="col-md-12 control-label offset-1" style="font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">Password</label>

                <div class="col-md-10 offset-1">
                  <input id="password" type="password" class="form-control" name="password" required>
                  <span class="help-block">
                    <strong></strong>
                  </span>

                </div>
              </div>

              <div class="form-group">
                <label for="password" class="col-md-12 control-label offset-1" style="font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold;">Confirm Password *</label>

                <div class="col-md-10 offset-1">
                  <input id="remember_token" type="password" class="form-control" name="remember_token" required>
                  <span class="help-block">
                    <strong></strong>
                  </span>

                </div>
              </div>

              <div class="form-group mt-4" style="margin-left: 95px;">
                <div class="col-md-8 col-md-offset-4 mb-5">
                  <button class="submit" type="Submit" style="font-family: 'Bai Jamjuree', sans-serif; font-weight:Bold; border-radius:5px; background: #174495; color:#fff; width:150px; height: 40px;">
                    สมัครสมาชิก
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>


  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <script src="../func/sweetalert2.all.min.js"></script>


  <script>
  $(document).on('click', '.submit', function(e) {
    e.preventDefault();
    var email = $('#email').val();
    var name = $('#name').val();
    var password = $('#password').val();
    var remember_token = $('#remember_token').val();


    if(email == '' || name == '' || password == ''|| remember_token == '' ){
      Swal.fire({
        icon: 'error',
        title: 'กรอกข้อมูลให้ครบถ้วน',
        text: 'กรอกข้อมูลให้ครบถ้วน'
      })
    }else{
        Swal.fire({
          icon : 'question',
          title: 'ต้องการสร้างกิจกรรม',
          text: 'สร้างกิจกรรม',
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

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>

</html>
