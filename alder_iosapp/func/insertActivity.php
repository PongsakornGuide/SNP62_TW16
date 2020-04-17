<?php
$conn = mysqli_connect("localhost","root","","Alder");
$conn->set_charset('utf8');


$target_dir = "../images/";
$image = $_FILES["image"]["name"];
$image_name = basename($image);
$target_file = $target_dir . $image_name;
$uploadOk = 1; //
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
//
$check = getimagesize($_FILES["image"]["tmp_name"]);
if ($check !== false) {
     echo "File is an image - " . $check["mime"] . ".";
    $uploadOk = 1;
} else {
    echo json_encode(['message' => "File is not an image."]);
    $uploadOk = 0;
}

if ($uploadOk == 0) {
    echo json_encode(['message' => "Sorry, your file was not uploaded."]);
} else {
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
         echo "The file " . $image_name . " has been uploaded.";
         $user_id = $_POST["user_id"];
         $title = $_POST["title"];
         $type = $_POST["type"];
         $content = $_POST["content"];
         $maxJoin = $_POST["maxJoin"];
         $objective = $_POST["objective"];
         $equipment = $_POST["equipment"];
         $leaderActivity = $_POST["leaderActivity"];
         $assistantActivity = $_POST["assistantActivity"];
         $startTime = $_POST["startTime"];
         $endTime = $_POST["endTime"];
         $startDate = $_POST["startDate"];
         $endDate = $_POST["endDate"];
         $act_id = $_POST["act_id"];
         $image_path = "/images/" . $image_name;

        $sql = "INSERT INTO post_timelines (user_id,title,img,type,content,maxJoin,objective,equipment,leaderActivity,assistantActivity,startTime,endTime,startDate,endDate,act_id)
        VALUES ('$user_id','$title','$image_path','$type','$content','$maxJoin','$objective','$equipment','$leaderActivity','$assistantActivity','$startTime','$endTime','$startDate','$endDate','$act_id')";

        if ($conn->query($sql) === true){
            echo json_encode(['message' => "Created Article Successfully"]);
            header( "location: ../config/activity.php" );
        }else{
            echo json_encode(['message' => "Error: " . $conn->error]);
        }
        $conn->close();

    } else {
        echo json_encode(['message' => "Sorry, there was an error uploading your file."]);
    }
}


?>
