<?php

require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');
$string = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
$okotp = substr(str_shuffle($string), 0, 5);
//$id = $_GET["id"];
$sql = "UPDATE ad_post_timeline SET likePost = likePost + 1 WHERE id = 2";

if ($conn->query($sql) === true) {
    echo json_encode(['message' => "Created Article Successfully"]);
} else {
    echo json_encode(['message' => "Error: " . $conn->error]);
}
$conn->close();
