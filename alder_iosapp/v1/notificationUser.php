<?php

require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');
$id = $_GET["id"];
// $sql = "SELECT * FROM notificationsPost where user_id = $id";

$sql = "SELECT notifications.contentAct,notifications.post_timeline_id,notifications.create_at as Timer,post_timelines.*
FROM notifications 
INNER JOIN post_timelines ON (notifications.post_timeline_id = post_timelines.id)WHERE notifications.user_id = $id ORDER BY notifications.id DESC";
$result = $conn->query($sql);
$datas = array();

while ($row = $result->fetch_object()){
        $datas[] = $row;
}

echo json_encode($datas, JSON_NUMERIC_CHECK);
$conn->close();

