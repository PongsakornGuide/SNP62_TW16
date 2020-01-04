<?php

class DbOperation
{
    private $conn;

    //Constructor
    function __construct()
    {
        require_once dirname(__FILE__) . '/Constants.php';
        require_once dirname(__FILE__) . '/DbConnect.php';
        // opening db connection
        $db = new DbConnect();
        $this->conn = $db->connect();
    }

    //Function Login
    public function userLogin($tel)
    {
        $stmt = $this->conn->prepare("SELECT id FROM user_apps WHERE tel = ? ");
        $stmt->bind_param("i", $tel);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }




    //Function to create a new user
    public function createUser($username, $surname, $photo, $birthday, $gender, $tel, $address, $religion, $relative_name, $relative_phone, $relative_type)
    {

        if (!$this->isUserExist($username, $tel)) {
            $stmt = $this->conn->prepare("INSERT INTO user_apps (username, surname, photo, birthday, gender, tel, address, religion, relative_name, relative_phone, relative_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("sssssisssss", $username, $surname, $photo, $birthday, $gender, $tel, $address, $religion, $relative_name, $relative_phone, $relative_type);
            if ($stmt->execute()) {
                return USER_CREATED;
            } else {
                return USER_NOT_CREATED;
            }
        } else {
            return USER_ALREADY_EXIST;
        }

    }

    //
    private function isUserExist($username, $tel)
    {
        $stmt = $this->conn->prepare("SELECT id FROM user_apps WHERE username = ? OR tel = ?");
        $stmt->bind_param("si", $username, $tel);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }

    public function getUserByUsername($tel)
    {
        $stmt = $this->conn->prepare("SELECT id, username, tel , photo FROM user_apps WHERE tel = ?");
        $stmt->bind_param("i", $tel);
        $stmt->execute();
        $stmt->bind_result($id, $username, $tel,$photo);
        $stmt->fetch();
        $user = array();
        $_SESSION['id'] = $id;
        $user['id'] = $id;
        $user['username'] = $username;
        $user['tel'] = $tel;
        $user['photo'] = $photo;
        return $user;
    }

    public function getUserByActivity($tel)
    {
        $stmt = $this->conn->prepare("SELECT id, username, tel FROM user_apps WHERE tel = ?");
        $stmt->bind_param("i", $tel);
        $stmt->execute();
        $stmt->bind_result($id, $username, $tel);
        $stmt->fetch();
        $user_act = array();
        $_SESSION['id'] = $id;
        $user_act['id'] = $id;
        $user_act['username'] = $username;
        $user_act['tel'] = $tel;
        return $user_act;
    }

    //SELECT exception_activity.*, user_apps.username , user_apps.tel FROM exception_activity INNER JOIN user_apps ON exception_activity.activity_user_apps = user_apps.id WHERE exception_activity.activity_user_apps = ?
    //Function update status
    public function updateStatus($otp)
    {
        $stmt = $this->conn->prepare("UPDATE otp SET status = '1' WHERE otp = ?");
        $stmt->bind_param("s", $otp);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }

    //Function Check status otp
    public function checkOtp($otp)
    {
        $stmt = $this->conn->prepare("SELECT id FROM otp WHERE otp = ?");
        $stmt->bind_param("s", $otp);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }


    //Function Post
    public function createPost($user_app_id, $caption, $img)
    {
        $stmt = $this->conn->prepare("INSERT INTO ad_post_timeline (user_app_id,caption,img) VALUES (?,?,?)");
        $stmt->bind_param("iss", $user_app_id, $caption, $img);
        $stmt->execute();
    }



    //Function to create a new user
    public function add_activity($activity_user_apps,$activity_name,$disease_user_apps,$disease_id,$disease_detail)
    {

            $stmt = $this->conn->prepare("INSERT INTO exception_disease (disease_user_apps,disease_id,disease_detail) VALUES (?, ?, ?)");
            $stmt->bind_param("iis", $disease_user_apps, $disease_id,$disease_detail);

            $stmt2 = $this->conn->prepare("INSERT INTO exception_activity (activity_user_apps,activity_name) VALUES (?, ?)");
            $stmt2->bind_param("ii", $activity_user_apps, $activity_name);

            if ($stmt->execute() && $stmt2->execute()){
                return USER_CREATED;
            } else {
                return USER_NOT_CREATED;
            }
    }

    //Function Delete
//    public function delete($user_app_id){
//        $stmt = $this->conn->prepare("DELETE FROM ad_post_timeline WHERE user_app_id = $user_app_id");
//        $stmt->bind_param("i", $user_app_id);
//        if($this->conn->query($stmt) === true){
//            echo json_encode(['message' => "Delete Article Successfully"]);
//        }else{
//            echo json_encode(['message' => "Error: " . $stmt->error]);
//        }
//    }

}