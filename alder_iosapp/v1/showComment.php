<?php
require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST,DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');

$id = $_GET["id"];
$sql = "SELECT comments.id ,comments.ad_post_timeline_id , comments.user_id , user_apps.username ,user_apps.photo , comments.post , comments.likepost , comments.created_at  FROM comments LEFT JOIN user_apps ON comments.user_id = user_apps.id WHERE ad_post_timeline_id = " .$id;
$result = $conn->query($sql);
$datas = array();
while ($row = $result->fetch_object()) {
    $datas[] = $row;
}




echo json_encode($datas, JSON_NUMERIC_CHECK);
$conn->close();
