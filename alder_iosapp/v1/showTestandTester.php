<?php

require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST,DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');
$id = $_GET["id"];
$sql = "SELECT COUNT(join_activity.user_id) as joinUser, post_timelines.title, post_timelines.id as checkid
FROM join_activity
LEFT JOIN post_timelines ON join_activity.post_timeline_id = post_timelines.id where post_timelines.id =  ".$id;
$result = $conn->query($sql);
$datas = array();
//Fetch into associative array
while ($row = $result->fetch_assoc()) {
    $datas[] = $row;
}

foreach ($datas as $index => $data){

    $id = $data["checkid"];

    $sql2 = "SELECT * FROM post_timelines where id = $id";
    $result = $conn->query($sql2);

    while ($row = $result->fetch_assoc()) {
        $datas[$index]["activity"] = $row;
    }


//
//     $sql3 = "SELECT * FROM post_timeline where act_id = $id";
//     $result = $conn->query($sql3);
//
//     while ($row = $result->fetch_assoc()) {
//           $datas[$index] = $row;
// //        $datas[]["post_activity"] = $row;
//     }

}

echo json_encode($datas, JSON_NUMERIC_CHECK);
$conn->close();
