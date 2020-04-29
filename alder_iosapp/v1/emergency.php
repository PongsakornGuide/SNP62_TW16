<?php
//SELECT list_tel.* , emergency.* FROM emergency LEFT JOIN list_tel on list_tel.user_id = emergency.id = 1
require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST,DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');

//$sql = "SELECT * FROM ad_post_timeline";
$sql = "SELECT * FROM emergency order by id desc";
$result = $conn->query($sql);
$datas = array();
//Fetch into associative array

while ($row = $result->fetch_object()) {
    $datas[] = $row;
}

echo json_encode($datas, JSON_NUMERIC_CHECK);
$conn->close();
