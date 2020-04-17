
  <?php
  $conn = mysqli_connect("localhost","root","","Alder");
  $conn->set_charset('utf8');


  $target_dir = "../images/";
  $image = $_FILES["image"]["name"];
  $image_name = basename($image);
  $target_file = $target_dir . $image_name;
  $uploadOk = 1; //
  $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
      if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {

           $title = isset($_POST['title']) ? $_POST['title'] : '';
           $content = isset($_POST['content']) ? $_POST['content'] : '';
           $credit = isset($_POST['credit']) ? $_POST['credit'] : '';
           $image = $_FILES['image']['name'];
           $image_temp = $_FILES['image']['tmp_name'];
           $id = isset($_POST['id']) ? $_POST['id'] : '';


           $conn = mysqli_connect("localhost","root","","Alder");
           $conn->set_charset('utf8');
           $sql = "UPDATE `prayer` SET
           title = '".$title."',
           content = '".$content."',
           credit = '".$credit."',
           image = '/images/".$image_name."'


           WHERE `prayer`.`id` = '".$id."'";

           $query = mysqli_query($conn,$sql);

           if($conn->affected_rows)
           {
           	echo "สำเร็จบน".$sql;
           	header( "location: ../config/blogger.php" );
              // echo "เกือบสำเร็จ";
           }
           else
           {
             header( "location: ../config/blogger.php" );
           	// echo "ไม่สำเร็จ";
             echo "ไม่สำเร็จ".$sql;
           }
      }else{


                   $title = isset($_POST['title']) ? $_POST['title'] : '';
                   $content = isset($_POST['content']) ? $_POST['content'] : '';
                   $credit = isset($_POST['credit']) ? $_POST['credit'] : '';
                   $id = isset($_POST['id']) ? $_POST['id'] : '';


                   $conn = mysqli_connect("localhost","root","","Alder");
                   $conn->set_charset('utf8');


                   $sql = "UPDATE `prayer` SET
                   title = '".$title."',
                   content = '".$content."',
                   credit = '".$credit."'


                   WHERE `prayer`.`id` = '".$id."'";

                   $query = mysqli_query($conn,$sql);

                   if($conn->affected_rows)
                   {
                     echo "สำเร็จล่าง".$sql;
                     header( "location: ../config/blogger.php" );
                      // echo "เกือบสำเร็จ";
                   }
                   else
                   {
                     echo "ไม่สำเร็จ".$sql;
                     header( "location: ../config/blogger.php" );

                   }
      }
