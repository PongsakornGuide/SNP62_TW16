<?php
require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
require_once '../includes/DbOperation.php';
$conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');

$response = array();
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['tel']) && isset($_POST['otp'])) {
        $db = new DbOperation();
        if ($db->userLogin( $_POST['tel']) && $db->checkOtp($_POST['otp'])){
            $response['message'] = 'User Login successfully';
            $response = $db->updateStatus($_POST['otp']);
            $response['user'] = $db->getUserByUsername($_POST['tel']);
            $response['error'] = false;
        } else {
            $response['error'] = true;
            $response['message'] = 'Invalid username or password';
        }
    } else {
        $response['error'] = true;
        $response['message'] = 'Parameters are missing';
    }
}

else {
    $response['error'] = true;
    $response['message'] = "Request not allowed";
}
echo json_encode($response);
