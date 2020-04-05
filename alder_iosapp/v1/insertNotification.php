<?php

require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');

if (!verifyRequiredParams(array('user_id','post_timeline_id','contentAct'))) {
    echo "55";
        $user_id = $_POST["user_id"];
        $post_timeline_id = $_POST["post_timeline_id"];
        $contentAct = $_POST["contentAct"];
    $sql = "INSERT INTO notifications (user_id,post_timeline_id,contentAct) VALUES ('$user_id','$post_timeline_id','$contentAct')";
    if ($conn->query($sql) === true) {
        echo json_encode(['message' => "Created Article Successfully"]);
    } else {
        echo json_encode(['message' => "Error: " . $conn->error]);
    }
    $conn->close();

} else {
    echo json_encode(['message' => "Sorry, there was an error uploading your file."]);
}

function verifyRequiredParams($required_fields)
{
    //Getting the request parameters
    $request_params = $_REQUEST;

    //Looping through all the parameters
    foreach ($required_fields as $field) {
        //if any requred parameter is missing
        // ถ้าพารามิเตอร์ที่กำหนดไม่ครบหรือหายไป
        if (!isset($request_params[$field]) || strlen(trim($request_params[$field])) <= 0) {

            //returning true;
            return true;
        }
    }
    return false;
}