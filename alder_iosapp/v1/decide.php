<?php

include_once('../config/db.php');

$req = $_REQUEST;
$request = (object)$req;
$response = array();

if (isset($req['user_id']) && isset($req['post_timeline_id']) && isset($req['more']) && isset($req['feel_id'])) {

    foreach ($request->feel_id as $id) {
        $database->insert("decides", [
            "user_id" => $request->user_id,
            "post_timeline_id" => $request->post_timeline_id,
            "more" => $request->more,
            "feel_id" => $id,
        ]);
    }

} else {
    $response['error'] = true;
    $response['message'] = 'Invalid username or password';
}
echo json_encode($response);