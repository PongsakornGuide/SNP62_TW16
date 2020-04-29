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
        mysqli_set_charset($this->conn, "utf8");
        header('Content-Type: application/json; charset=utf-8');
        $stmt = $this->conn->prepare("SELECT id FROM user_apps WHERE username = ? OR tel = ?");
        $stmt->bind_param("si", $username, $tel);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }

    public function getUserByUsername($tel)
    {
        mysqli_set_charset($this->conn, "utf8");
        header('Content-Type: application/json; charset=utf-8');

        $stmt = $this->conn->prepare("SELECT id, username, tel , photo , birthday FROM user_apps WHERE tel = ?");
        $stmt->bind_param("i", $tel);
        $stmt->execute();
        $stmt->bind_result($id, $username, $tel,$photo,$birthday);
        $stmt->fetch();
        $user = array();
        $_SESSION['id'] = $id;
        $user['id'] = $id;
        $user['username'] = $username;
        $user['tel'] = $tel;
        $user['photo'] = $photo;
        $user['birthday'] = $birthday;
        return $user;
    }

    public function getUserByActivity($tel)
    {
        mysqli_set_charset($this->conn, "utf8");
        header('Content-Type: application/json; charset=utf-8');
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
        mysqli_set_charset($this->conn, "utf8");
        header('Content-Type: application/json; charset=utf-8');
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
        mysqli_set_charset($this->conn, "utf8");
        header('Content-Type: application/json; charset=utf-8');
        $stmt = $this->conn->prepare("INSERT INTO ad_post_timeline (user_app_id,caption,img) VALUES (?,?,?)");
        $stmt->bind_param("iss", $user_app_id, $caption, $img);
        $stmt->execute();
    }



    //Function to create a new user
    public function add_activity($activity_user_apps,$activity_name,$disease_user_apps,$disease_id,$disease_detail)
    {
            mysqli_set_charset($this->conn, "utf8");
            header('Content-Type: application/json; charset=utf-8');
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


    //Function Check status otp
    public function checkjoin($post_timeline_id,$user_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM join_activity WHERE post_timeline_id = ? AND user_id = ?");
        $stmt->bind_param("ii", $post_timeline_id,$user_id);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }

    //Function Check user join Activity
    public function checkjoin2($post_timeline_id,$user_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM decide_afters WHERE post_timeline_id = ? AND user_id = ?");
        $stmt->bind_param("ii", $post_timeline_id,$user_id);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }

    //Function Check user like Post
    public function checkLike($ad_post_timeline_id,$user_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM likeActivity WHERE ad_post_timeline_id = ? AND user_id = ?");
        $stmt->bind_param("ii", $ad_post_timeline_id,$user_id);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }

    //Function Check user comment Post
    public function checkLikeComment($user_id,$ad_post_timeline_id,$comment_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM likeActivityComment WHERE user_id = ? AND ad_post_timeline_id = ? AND comment_id = ?");
        $stmt->bind_param("iii", $user_id,$ad_post_timeline_id,$comment_id);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }

}
