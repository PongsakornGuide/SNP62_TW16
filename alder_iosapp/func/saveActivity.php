
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

             // $title = isset($_POST['title']) ? $_POST['title'] : '';
             // $content = isset($_POST['content']) ? $_POST['content'] : '';
             // $credit = isset($_POST['credit']) ? $_POST['credit'] : '';

             $image = $_FILES['image']['name'];
             $image_temp = $_FILES['image']['tmp_name'];
             $id = isset($_POST['id']) ? $_POST['id'] : '';

             $title = isset($_POST['title']) ? $_POST['title'] : '';
             $type = isset($_POST['type']) ? $_POST['type'] : '';
             $content = isset($_POST['content']) ? $_POST['content'] : '';
             $objective = isset($_POST['objective']) ? $_POST['objective'] : '';
             $leaderActivity = isset($_POST['leaderActivity']) ? $_POST['leaderActivity'] : '';
             $assistantActivity = isset($_POST['assistantActivity']) ? $_POST['assistantActivity'] : '';
             $startTime = isset($_POST['startTime']) ? $_POST['startTime'] : '';
             $endTime = isset($_POST['endTime']) ? $_POST['endTime'] : '';
             $startDate = isset($_POST['startDate']) ? $_POST['startDate'] : '';
             $endDate = isset($_POST['endDate']) ? $_POST['endDate'] : '';
             $equipment = isset($_POST['equipment']) ? $_POST['equipment'] : '';




             $conn = mysqli_connect("localhost","root","","Alder");
             $conn->set_charset('utf8');


             $sql = "UPDATE `post_timelines` SET
             title = '".$title."',
             type = '".$type."',
             content = '".$content."',
             objective = '".$objective."',
             leaderActivity = '".$leaderActivity."',
             assistantActivity = '".$assistantActivity."',
             startTime = '".$startTime."',
             endTime = '".$endTime."',
             startDate = '".$startDate."',
             endDate = '".$endDate."',
             equipment = '".$equipment."',
             img = '/images/".$image_name."'
             WHERE `post_timelines`.`id` = '".$id."'";
             $query = mysqli_query($conn,$sql);



             $query = mysqli_query($conn,$sql);

             if($conn->affected_rows)
             {
             	echo "สำเร็จบน".$sql;
             	header( "location: ../config/activity.php" );
                // echo "เกือบสำเร็จ";
             }
             else
             {
               header( "location: ../config/activity.php" );
             	// echo "ไม่สำเร็จ";
               echo "ไม่สำเร็จ".$sql;
             }
        }else{

          $id = isset($_POST['id']) ? $_POST['id'] : '';
          $title = isset($_POST['title']) ? $_POST['title'] : '';
          $type = isset($_POST['type']) ? $_POST['type'] : '';
          $content = isset($_POST['content']) ? $_POST['content'] : '';
          $objective = isset($_POST['objective']) ? $_POST['objective'] : '';
          $leaderActivity = isset($_POST['leaderActivity']) ? $_POST['leaderActivity'] : '';
          $assistantActivity = isset($_POST['assistantActivity']) ? $_POST['assistantActivity'] : '';
          $startTime = isset($_POST['startTime']) ? $_POST['startTime'] : '';
          $endTime = isset($_POST['endTime']) ? $_POST['endTime'] : '';
          $startDate = isset($_POST['startDate']) ? $_POST['startDate'] : '';
          $endDate = isset($_POST['endDate']) ? $_POST['endDate'] : '';
          $equipment = isset($_POST['equipment']) ? $_POST['equipment'] : '';




          $conn = mysqli_connect("localhost","root","","Alder");
          $conn->set_charset('utf8');


          $sql = "UPDATE `post_timelines` SET
          title = '".$title."',
          type = '".$type."',
          content = '".$content."',
          objective = '".$objective."',
          leaderActivity = '".$leaderActivity."',
          assistantActivity = '".$assistantActivity."',
          startTime = '".$startTime."',
          endTime = '".$endTime."',
          startDate = '".$startDate."',
          endDate = '".$endDate."',
          equipment = '".$equipment."'
          WHERE `post_timelines`.`id` = '".$id."'";
          $query = mysqli_query($conn,$sql);



          $query = mysqli_query($conn,$sql);

          if($conn->affected_rows)
          {
            echo "สำเร็จล่าง".$sql;
            header( "location: ../config/activity.php" );
             // echo "เกือบสำเร็จ";
          }
          else
          {
            header( "location: ../config/activity.php" );
            // echo "ไม่สำเร็จ";
            echo "ไม่สำเร็จล่าง".$sql;
          }
        }
