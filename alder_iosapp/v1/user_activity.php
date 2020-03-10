<?php

include_once ('../config/db.php');
header('Content-Type: application/json; charset=utf-8');
$req= $_REQUEST;
$request = (object) $req;
$response = array();

    if (isset($req['activity_user_apps']) && isset($req['activity_name']) && isset($req['tel']) && isset($req['disease_user_apps']) && isset($req['disease_id'])&& isset($req['disease_detail']) ) {
        $request->activity_name = explode(',',$request->activity_name);
        foreach($request->activity_name as $id){
                $database->insert("exception_activity", [
                    "activity_user_apps" => $request->activity_user_apps,
                    "activity_name" => $id,

                ]);
               $response['message'] = 'User created successfully';
               $response['error'] = false;
        }
        $database->insert("exception_disease", [

            "disease_user_apps" => $request->disease_user_apps,
            "disease_detail" => $request->disease_detail,
            "disease_id" => $request->disease_id,
        ]);


    } else {
            $response['error'] = true;
            $response['message'] = 'Invalid username or password';
    }
    echo json_encode($response);

