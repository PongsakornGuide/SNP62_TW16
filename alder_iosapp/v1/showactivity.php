<?php

require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');
$id = $_GET["id"];
$sql = "SELECT activity_type.id, activity_type.activity_type_name, activity_type.iconImage, activity.id AS activity_id, activity.activity_name
FROM activity_type  
LEFT JOIN activity ON activity_type.id = activity.activity_type_id  
WHERE activity.id IN (SELECT activity_name 
FROM exception_activity
WHERE activity_user_apps = $id)";

$result = $conn->query($sql);
$datas = array();

while ($row = $result->fetch_assoc()) {
    $datas[] =$row;
}

function _group_by($array, $key) {
    $return = array();
    $timeauto = date("Y-m-d");
    $conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
    mysqli_set_charset($conn, "utf8");
    foreach($array as $index => $val) {
        $return[$val[$key]]['id'] = $val['id'];
        $return[$val[$key]]['activity_type_name'] = $val['activity_type_name'];
        $return[$val[$key]]['iconImage'] = $val['iconImage'];
        $return[$val[$key]]['activities'][] = $val;

        foreach ($return[$val[$key]]['activities'] as $index2 => $dataIn){
            $sql2 = "SELECT * FROM post_timelines WHERE post_timelines.act_id = ".$dataIn['activity_id'];
            $result = $conn->query($sql2);
            $datas2 = array();
            while ($row = $result->fetch_assoc()) {
                $check = $row["endDate"];
                if($timeauto < $check){
                $datas2[] =$row;
                // echo $newDate;
                }else{
                }
            }
            $return[$val[$key]]['activities'][$index2]['posts'] = $datas2;
        }
        
    }
    return $return;
}

$datas = _group_by($datas,'id');
echo json_encode($datas, JSON_NUMERIC_CHECK);

$conn->close();




//
////header('Content-Type: application/json; charset=utf-8');
////
////$datas = [
////    [
////        "id" => 1,
////        "activity_type_name" => 'กระตุ้นสมอง',
////        "iconimage" => '/a.jpg',
////        "data" => [
////            [
////                "id" => 1,
////                "title" => "มาขยับแขนขยับขา",
////                "caption" => "โดย ไกด์ ฐิติวัฒน์",
////                "content" => "เรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไร",
////                "img"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgact"=> "https://vuejs.org/images/stdlib.png",
////                "imgtime"=> "http://onlineqda.hud.ac.uk/Step_by_step_software/images/Framework_logo.jpg",
////                "created_at"=> "2020-01-16 00:50:51"
////            ],
////            [
////                "id" => 2,
////                "title" => "เชิญชวนผู้สูงอายุเต้นรำ",
////                "caption" => "โดย ฝน จริญญา์",
////                "content" => "เรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไร",
////                "img"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgact"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgtime"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "created_at"=> "2020-01-16 00:50:51"
////            ],
////            [
////                "id" => 3,
////                "title" => "วิ่งเล่นสุขหรรษา",
////                "caption" => "โดย ไกด์ ฐิติวัฒน์",
////                "content" => "เรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไร",
////                "img"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgact"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgtime"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "created_at"=> "2020-01-16 00:50:51"
////            ]
////        ]
////    ],
////    [
////        "id" => 2,
////        "activity_type_name" => 'กายภาพบําบัด',
////        "iconiamge" => '/a.jpg',
////        "data" => [
////            [
////                "id" => 1,
////                "title" => "มาขยับแขนขยับขา",
////                "caption" => "โดย ไกด์ ฐิติวัฒน์",
////                "content" => "เรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไร",
////                "img"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgact"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgtime"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "created_at"=> "2020-01-16 00:50:51"
////            ],
////            [
////                "id" => 2,
////                "title" => "เชิญชวนผู้สูงอายุเต้นรำ",
////                "caption" => "โดย ไกด์ ฐิติวัฒน์",
////                "content" => "เรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไร",
////                "img"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgact"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgtime"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "created_at"=> "2020-01-16 00:50:51"
////            ],
////            [
////                "id" => 3,
////                "title" => "วิ่งเล่นสุขหรรษา",
////                "caption" => "โดย ไกด์ ฐิติวัฒน์",
////                "content" => "เรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไร",
////                "img"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgact"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgtime"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "created_at"=> "2020-01-16 00:50:51"
////            ]
////        ]
////    ],
////    [
////        "id" => 3,
////        "activity_type_name" => 'นันทนาการ',
////        "iconiamge" => '/a.jpg',
////        "data" => [
////            [
////                "id" => 1,
////                "title" => "มาขยับแขนขยับขา",
////                "caption" => "โดย ไกด์ ฐิติวัฒน์",
////                "content" => "เรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไร",
////                "img"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgact"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgtime"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "created_at"=> "2020-01-16 00:50:51"
////            ],
////            [
////                "id" => 2,
////                "title" => "เชิญชวนผู้สูงอายุเต้นรำ",
////                "caption" => "โดย ไกด์ ฐิติวัฒน์",
////                "content" => "เรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไร",
////                "img"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgact"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgtime"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "created_at"=> "2020-01-16 00:50:51"
////
////            ],
////            [
////                "id" => 3,
////                "title" => "วิ่งเล่นสุขหรรษา",
////                "caption" => "โดย ไกด์ ฐิติวัฒน์",
////                "content" => "เรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไร",
////                "img"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgact"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "imgtime"=> "/images/why-moderate-physical-activity-affects-memory.jpg",
////                "created_at"=> "2020-01-16 00:50:51"
////            ]
////        ]
////    ]
////
////];
////echo json_encode($datas, JSON_NUMERIC_CHECK);
//
////
////
////require_once '../includes/Constants.php';
////require_once '../includes/DbConnect.php';
////$conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
////mysqli_set_charset($conn, "utf8");
////header('Content-Type: application/json; charset=utf-8');
////
////$id = $_GET["id"];
////$sql = "SELECT activity_type.id,activity_type.activity_type_name,activity_type.iconImage,activity.id AS activity_id,activity.activity_name
////FROM activity_type
////LEFT JOIN activity
////ON activity_type.id = activity.activity_type_id
////WHERE activity.id IN (SELECT activity_name
////                FROM exception_activity
////               WHERE activity_user_apps = $id)";
////$result = $conn->query($sql);
////$datas = array();
////while ($row = $result->fetch_assoc()) {
////    $datas[] =$row;
////}
//
//
//
//
////foreach ($datas as $index => $data){
////    $id = $data["id"];
////    $sql2 = "SELECT *  FROM activity where activity_type_id = $id";
////    $result = $conn->query($sql2);
////
////    while ($row = $result->fetch_assoc()){
//////        $datas[$index]['data'][] = $row;
////    }
//////
////    $sql3 = "SELECT post_timeline.id, post_timeline.title ,post_timeline.caption, post_timeline.img  FROM post_timeline LEFT JOIN exception_activity ON post_timeline.act_id = exception_activity.activity_name WHERE exception_activity.activity_user_apps = $id";
////    $result = $conn->query($sql3);
////
////    while ($row = $result->fetch_assoc()){
////        $datas[$index]['data'][] = $row;
////
////    }
////
////}
//
////function _group_by($array, $key) {
////    $return = array();
////    $conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
////    mysqli_set_charset($conn, "utf8");
////    foreach($array as $index => $val) {
////        $return[$val[$key]]['id'] = $val['id'];
////        $return[$val[$key]]['activity_type_name'] = $val['activity_type_name'];
////        $return[$val[$key]]['iconImage'] = $val['iconImage'];
////        $return[$val[$key]]['activities'][] = $val;
////
////        foreach ($return[$val[$key]]['activities'] as $index2 => $dataIn){
////
////            $sql2 = "SELECT * FROM post_timeline WHERE post_timeline.act_id = ".$dataIn['activity_id'];
////            $result = $conn->query($sql2);
////            $datas2 = array();
////            while ($row = $result->fetch_assoc()) {
////                $datas2[] =$row;
////            }
////            $return[$val[$key]]['activities'][$index2]['posts'] = $datas2;
////        }
////    }
////    return $return;
////
////}
////$datas = _group_by($datas,'id');
////echo json_encode($datas, JSON_NUMERIC_CHECK);
////$conn->close();
//
//
////
////
////require_once '../includes/Constants.php';
////require_once '../includes/DbConnect.php';
////$conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
////mysqli_set_charset($conn, "utf8");
////header('Content-Type: application/json; charset=utf-8');
////
////$id = $_GET["id"];
//////$sql = "SELECT exception_activity.*, activity.activity_type_id FROM exception_activity LEFT JOIN
//////activity ON exception_activity.activity_name = activity.id WHERE exception_activity.activity_user_apps = $id";
////$sql = "SELECT  activity_type.id,activity_type.activity_type_name,activity_type.iconImage,activity.id AS activity_id,activity.activity_name
////FROM activity_type
////LEFT JOIN activity
////ON activity_type.id = activity.activity_type_id
////WHERE activity.id IN (SELECT activity_name
////                FROM exception_activity
////               WHERE activity_user_apps = $id)";
////$result = $conn->query($sql);
////$datas = array();
////while ($row = $result->fetch_assoc()) {
////    $datas[] = $row;
////}
//
//
////function _group_by($array, $key) {
////    $return = array();
////    $conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
////    mysqli_set_charset($conn, "utf8");
////    foreach($array as $index => $val) {
////        $return[$val[$key]]['id'] = $val['id'];
////        $return[$val[$key]]['activity_type_name'] = $val['activity_type_name'];
////        $return[$val[$key]]['iconImage'] = $val['iconImage'];
////        $return[$val[$key]]['activities'][] = $val;
////
////        foreach ($return[$val[$key]]['activities'] as $index2 => $dataIn){
////
////            $sql2 = "SELECT * FROM post_timeline WHERE post_timeline.act_id = ".$dataIn['activity_id'];
////            $result = $conn->query($sql2);
////            $datas2 = array();
////            while ($row = $result->fetch_assoc()) {
////                $datas2[] =$row;
////            }
////            $return[$val[$key]]['activities'][$index2]['posts'] = $datas2;
////        }
////    }
////    return $return;
////}
////$datas = _group_by($datas,'id');
////
////foreach ($datas as $index => $data){
////    $id = $data["activity_id"];
////    $sql2 = "SELECT *  FROM post_timeline where act_id = $id";
////    $result = $conn->query($sql2);
////    while ($row = $result->fetch_assoc()){
////        $datas[$index]['data'] = $row;
////    }
////}
////
////echo json_encode($datas, JSON_NUMERIC_CHECK);
////$conn->close();
//
//
//require_once '../includes/Constants.php';
//require_once '../includes/DbConnect.php';
//$conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
//mysqli_set_charset($conn, "utf8");
//header('Content-Type: application/json; charset=utf-8');
//include_once ('../config/db.php');
//
//$req= $_REQUEST;
//$request = (object) $req;
//$response = array();
//
//$id = $_GET["id"];
//
//
//$sql = "SELECT activity_type.id,activity_type.activity_type_name,activity_type.iconImage,activity.id AS activity_id,activity.activity_name
//FROM activity_type
//LEFT JOIN activity
//ON activity_type.id = activity.activity_type_id
//WHERE activity.id IN (SELECT activity_name
//                FROM exception_activity
//               WHERE activity_user_apps = $id)";
//$result = $conn->query($sql);
//$datas = array();
//while ($row = $result->fetch_assoc()) {
//    $datas[] =$row;
//}
//
//
//function _group_by($array, $key) {
//    $return = array();
//    $conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
//    mysqli_set_charset($conn, "utf8");
//    foreach($array as $index => $val) {
//        $return[$val[$key]]['id'] = $val['id'];
//        $return[$val[$key]]['activity_type_name'] = $val['activity_type_name'];
//        $return[$val[$key]]['iconImage'] = $val['iconImage'];
//        $return[$val[$key]]['activities'][] = $val;
//
//        foreach ($return[$val[$key]]['activities'] as $index2 => $dataIn){
//
//            $sql2 = "SELECT * FROM post_timeline WHERE post_timeline.act_id = ".$dataIn['activity_id'];
//            $result = $conn->query($sql2);
//            $datas2 = array();
//            while ($row = $result->fetch_assoc()) {
//                $datas2[] =$row;
//            }
////            $return[$val[$key]]['activities'][$index2]['posts'] = $datas2;
////            $return[$val[$key]]['datas'][] = $datas2[0];
//
////            $return[$val[$key]]['activities']['22'] = $datas2;
//
//
//        }
//
//    }
//    return $return;
//}
//
//
//$datas = _group_by($datas,'id');
//
//foreach ($datas as $d){
////    $d[]
//}
//echo json_encode($datas, JSON_NUMERIC_CHECK);
//$conn->close();

