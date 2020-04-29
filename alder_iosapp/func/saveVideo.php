
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
           $title_video = isset($_POST['title_video']) ? $_POST['title_video'] : '';
           $singerName = isset($_POST['singerName']) ? $_POST['singerName'] : '';
           $center = isset($_POST['center']) ? $_POST['center'] : '';
           $url = isset($_POST['url']) ? $_POST['url'] : '';
           $image = $_FILES['image']['name'];
           $image_temp = $_FILES['image']['tmp_name'];
           $id = isset($_POST['id']) ? $_POST['id'] : '';


           $conn = mysqli_connect("localhost","root","","Alder");
           $conn->set_charset('utf8');
           $sql = "UPDATE `upload_videos` SET
           title_video = '".$title_video."',
           center = '".$center."',
           singerName = '".$singerName."',
           url = '".$url."',
           img = '/images/".$image_name."'


           WHERE `upload_videos`.`id` = '".$id."'";

           $query = mysqli_query($conn,$sql);

           if($conn->affected_rows)
           {
           	echo "สำเร็จ".$sql;
           	header( "location: ../config/uploadVideo.php" );
              // echo "เกือบสำเร็จ";
           }
           else
           {
           	echo "ไม่สำเร็จ";
            header( "location: ../config/uploadVideo.php" );
           }
      }else{
            $title_video = isset($_POST['title_video']) ? $_POST['title_video'] : '';
            $singerName = isset($_POST['singerName']) ? $_POST['singerName'] : '';
            $center = isset($_POST['center']) ? $_POST['center'] : '';
            $url = isset($_POST['url']) ? $_POST['url'] : '';
            $id = isset($_POST['id']) ? $_POST['id'] : '';
            $conn = mysqli_connect("localhost","root","","Alder");
            $conn->set_charset('utf8');
            $sql = "UPDATE `upload_videos` SET
            title_video = '".$title_video."',
            center = '".$center."',
            singerName = '".$singerName."',
            url = '".$url."'
            WHERE `upload_videos`.`id` = '".$id."'";

            $query = mysqli_query($conn,$sql);

            if($conn->affected_rows)
            {
             echo "สำเร็จ".$sql;
             header( "location: ../config/uploadVideo.php" );
               // echo "เกือบสำเร็จ";
            }
            else
            {
             // echo "ไม่สำเร็จ";
             header( "location: ../config/uploadVideo.php" );
            }
      }
