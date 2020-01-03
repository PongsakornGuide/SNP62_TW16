<?php

require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST,DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');
$id = $_GET["id"];
$sql = "SELECT * FROM exception_activity where activity_user_apps = ".$id;

$result = $conn->query($sql);
$datas = array();
//Fetch into associative array

while ($row = $result->fetch_assoc()) {
    $datas[] = $row;
}

foreach ($datas as $index => $data){
    $id = $data["activity_name"];
    $sql2 = "SELECT * FROM activity where id = $id";
//    $result = $conn->query($sql2);

    while ($row = $result->fetch_assoc()) {
//        $datas[$index]["activity"] = $row;
    }

    $sql3 = "SELECT * FROM post_timeline where id = $id";
    $result = $conn->query($sql3);

    while ($row = $result->fetch_assoc()) {
        $datas[$index] = $row;
//        $datas[$index]["post_activity"] = $row;
    }

}

//1. ->1->2








echo json_encode($datas, JSON_NUMERIC_CHECK);
$conn->close();
