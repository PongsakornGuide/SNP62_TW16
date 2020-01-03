<?php
require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST,DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');

//$sql = "SELECT * FROM ad_post_timeline";
$sql = "SELECT ad_post_timeline.*, user_apps.username ,user_apps.photo FROM ad_post_timeline LEFT JOIN user_apps on ad_post_timeline.user_app_id = user_apps.id";
$result = $conn->query($sql);
$datas = array();
//Fetch into associative array

while ($row = $result->fetch_object()) {
    $datas[] = $row;
}

echo json_encode($datas, JSON_NUMERIC_CHECK);
$conn->close();