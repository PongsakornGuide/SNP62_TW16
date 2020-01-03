<?php
require_once '../includes/DbOperation.php';

$response = array();
$unotp = 1;

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if (isset($_POST['otp'])) {

        $db = new DbOperation();
        if ($db->checkOtp( $_POST['otp'])) {
            echo "OTP Correct";
            $response['error'] = false;
            $response = $db->updateStatus($_POST['otp']);
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