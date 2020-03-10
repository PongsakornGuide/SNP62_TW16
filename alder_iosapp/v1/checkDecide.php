<?php
require_once '../includes/DbOperation.php';
$response = array();
//$unotp = 1;
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if (isset($_POST['post_timeline_id'],$_POST['user_id'])){
        $db = new DbOperation();
        if ($db->checkjoin2( $_POST['post_timeline_id'],$_POST['user_id'])) {
            $response['error'] = false;
        } else {
            $response['error'] = true;
            $response['message'] = 'Invalid Join or Activity';
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
