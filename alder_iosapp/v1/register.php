<?php
require_once '../includes/DbOperation.php';
//
//$response = array();
//if ($_SERVER['REQUEST_METHOD'] == 'POST') {
//    if (!verifyRequiredParams(array('username', 'surname' , 'photo', 'birthday', 'gender', 'tel','address', 'religion', 'relative_name', 'relative_phone', 'relative_type'))) {
//
//        $username = $_POST['username'];
//        $surname = $_POST['surname'];
//        $photo = $_POST['photo'];
//        $birthday= $_POST['birthday'];
//        $gender = $_POST['gender'];
//        $tel = $_POST['tel'];
//        $address= $_POST['address'];
//        $religion = $_POST['religion'];
//        $relative_name= $_POST['relative_name'];
//        $relative_phone = $_POST['relative_phone'];
//        $relative_type = $_POST['relative_type'];
//
//        $db = new DbOperation();
//
//        $result = $db->createUser($username, $surname, $photo, $birthday, $gender, $tel, $address, $religion, $relative_name, $relative_phone, $relative_type);
//
//        if ($result == USER_CREATED) {
//            //สำเร็จ
//            $response['error'] = false;
//            $response['message'] = 'User created successfully';
//
//            $response['user'] = $db->getUserByUsername($_POST['tel']);
//
//        } elseif ($result == USER_ALREADY_EXIST) {
//            //ซ้ำ
//            $response['error'] = true;
//            $response['message'] = 'User already exist';
//
//        } elseif ($result == USER_NOT_CREATED) {
//            //error
//            $response['error'] = true;
//            $response['message'] = 'Some error occurred';
//        }
//
//    } else {
//        //กรณีเป็นค่าว่าง หรือลืมกรอก
//        $response['error'] = true;
//        $response['message'] = 'Required parameters are missing';
//    }
//} else {
//    //error
//    $response['error'] = true;
//    $response['message'] = 'Invalid request';
//}
//
////function to validate the required parameter in request
////กำนหดพารามิเตอร์
//function verifyRequiredParams($required_fields)
//{
//    //Getting the request parameters
//    $request_params = $_REQUEST;
//
//    //Looping through all the parameters
//    foreach ($required_fields as $field) {
//        //if any requred parameter is missing
//        // ถ้าพารามิเตอร์ที่กำหนดไม่ครบหรือหายไป
//        if (!isset($request_params[$field]) || strlen(trim($request_params[$field])) <= 0) {
//
//            //returning true;
//            return true;
//        }
//    }
//    return false;
//}
//
//echo json_encode($response);


require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST,DB_USERNAME, DB_PASSWORD, DB_NAME);

mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');

$target_dir = "../images/";
$image = $_FILES["image"]["name"];
$image_name = basename($image);
$target_file = $target_dir . $image_name;
$uploadOk = 1; //
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION)); //

$check = getimagesize($_FILES["image"]["tmp_name"]);
if ($check !== false) {
    // echo "File is an image - " . $check["mime"] . ".";
    $uploadOk = 1;
} else {
    echo json_encode(['message' => "File is not an image."]);
    $uploadOk = 0;
}
if ($uploadOk == 0) {
    echo json_encode(['message' => "Sorry, your file was not uploaded."]);
} else {
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
//        echo "The file " . $image_name . " has been uploaded.";

        $username = $_POST["username"];
        $surname = $_POST["surname"];
        $image_path = "/images/" . $image_name;
        $birthday = $_POST["birthday"];
        $gender = $_POST["gender"];
        $tel = $_POST["tel"];
        $address = $_POST["address"];
        $religion = $_POST["religion"];
        $relative_name = $_POST["relative_name"];
        $relative_phone = $_POST["relative_phone"];
        $relative_type =$_POST["relative_type"];

        $sql = "INSERT INTO user_apps (username, surname,photo,birthday,gender,tel,address,religion,relative_name,relative_phone,relative_type) VALUES ('$username','$surname','$image_path','$birthday','$gender','$tel','$address','$religion','$relative_name','$relative_phone','$relative_type')";

//        "INSERT INTO user_apps (username, surname, photo, birthday, gender, tel, address, religion, relative_name, relative_phone, relative_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        if ($conn->query($sql) === true){

//            $id = $_GET["id"];
            $sql2 = "SELECT * FROM user_apps ORDER BY id desc limit 1";


            $result = $conn->query($sql2);
            $datas = array();
            while ($row = $result->fetch_assoc()) {
                $datas[] = $row;
            }

            echo json_encode($datas[0], JSON_NUMERIC_CHECK);


        }else{
            echo json_encode(['message' => "Error: " . $conn->error]);
        }
        $conn->close();


    } else {
        echo json_encode(['message' => "Sorry, there was an error uploading your file."]);
    }
}