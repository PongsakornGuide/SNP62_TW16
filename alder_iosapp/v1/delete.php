<?php
require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST,DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');

$id = $_POST["id"];

$sql = "DELETE FROM ad_post_timeline WHERE id = $id";

if ($conn->query($sql) === true) {
    echo json_encode(['message' => "Delete Article Successfully"]);
} else {
    echo json_encode(['message' => "Error: " . $conn->error]);
}

$conn->close();



