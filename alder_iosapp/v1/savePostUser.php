<?php

// require_once '../includes/Constants.php';
// require_once '../includes/DbConnect.php';
// $conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
// mysqli_set_charset($conn, "utf8");
// header('Content-Type: application/json; charset=utf-8');
// $id = $_GET["id"];
// $sql = "SELECT ad_post_timeline.*,user_apps.username,user_apps.photo FROM user_apps LEFT JOIN ad_post_timeline ON user_apps.id = ad_post_timeline.user_app_id WHERE user_apps.id = $id";
// $result = $conn->query($sql);
// $datas = array();


// while ($row = $result->fetch_object()) {
//     $datas[] = $row;
// }

// echo json_encode($datas, JSON_NUMERIC_CHECK);
// $conn->close();


require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST,DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');
$id = $_GET["id"];
// $sql = "SELECT * FROM user_apps where id = ".$id;
// $sql = "SELECT * FROM ad_post_timeline where user_app_id = $id";
$sql = "SELECT ad_post_timeline.* , user_apps.username , user_apps.photo FROM ad_post_timeline LEFT JOIN user_apps ON ad_post_timeline.user_app_id = user_apps.id where ad_post_timeline.user_app_id = $id";
$result = $conn->query($sql);
$datas = array();
//Fetch into associative array
while ($row = $result->fetch_assoc()) {
   $datas[] = $row;
}

// foreach ($datas as $index => $data){

//    $id = $data["id"];
// $sql2 = "SELECT * FROM ad_post_timeline where user_app_id = $id";
//    $result = $conn->query($sql2);

//    while ($row = $result->fetch_assoc()) {
//        $datas[$index]["data"][] = $row;
//    }
// }

echo json_encode($datas, JSON_NUMERIC_CHECK);
$conn->close();
