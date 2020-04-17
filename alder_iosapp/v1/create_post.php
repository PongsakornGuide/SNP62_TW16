<?php

require_once '../includes/DbOperation.php';
require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST,DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');

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
//         echo json_encode(['message' => "Uploade Image Successfully"]);
         $user_app_id = $_POST["user_app_id"];
         $caption = $_POST["caption"];
         $image_path = "/images/" . $image_name;

        $sql = "INSERT INTO ad_post_timeline (user_app_id, caption,img) VALUES ('$user_app_id','$caption','$image_path')";

        if ($conn->query($sql) === true){
            echo json_encode(['message' => "Created Article Successfully"]);
        }else{
            echo json_encode(['message' => "Error: " . $conn->error]);
        }
        $conn->close();

    } else {
        echo json_encode(['message' => "Sorry, there was an error uploading your file."]);
    }
}
