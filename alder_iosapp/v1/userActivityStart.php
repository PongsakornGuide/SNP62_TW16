<?php

require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');
date_default_timezone_set('Asia/Bangkok');
$id = $_GET["id"];
$sql = "SELECT post_timelines.* FROM join_activity LEFT JOIN post_timelines ON join_activity.post_timeline_id = post_timelines.id WHERE join_activity.user_id =  $id";
$result = $conn->query($sql);
$datas = array();
$timeauto = date("Y-m-d");
// $check = array();
$rows = array();
//Fetch into associative array
while ($row = $result->fetch_assoc()) {
    $check = $row["endDate"];
    if($timeauto < $check){
        $datas[] = $row;
    }else{

    }
}

echo json_encode($datas,JSON_NUMERIC_CHECK);
$conn->close();





