<?php

include_once ('../config/db.php');
header('Content-Type: application/json; charset=utf-8');
$req= $_REQUEST;
$request = (object) $req;
$response = array();

    if (isset($req['user_id']) && isset($req['post_timeline_id']) && isset($req['decide_supplement_id'])){

        $request->decide_supplement_id = explode(',',$request->decide_supplement_id);

        foreach($request->decide_supplement_id as $id){
                $database->insert("supplementAfter", [
                    "user_id" => $request->user_id,
                    "post_timeline_id" => $request->post_timeline_id,
                    "decide_supplement_id" => $id,
                ]);
               $response['message'] = 'User created successfully';
               $response['error'] = false;
        }
    } else {
            $response['error'] = true;
            $response['message'] = 'Invalid username or password';
    }
    echo json_encode($response);

