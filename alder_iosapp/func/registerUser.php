<?php

$name = $_POST['name'];

$email = $_POST['email'];
$password = $_POST['password'];
$remember_token = $_POST['remember_token'];


$conn = mysqli_connect("localhost","root","","Alder");
$conn->set_charset('utf8');

$sql = "INSERT INTO users (name,email,password,remember_token)
VALUES ('$name','$email','$password','$remember_token')";

if ($conn->query($sql) === true){
  	echo "สำเร็จบน".$sql;
    header( "location: ../config/index.php" );
    echo json_encode(['message' => "Created Article Successfully"]);
}else{
  	echo "ไม่สำเร็จ".$sql;
    header( "location: ../config/index.php" );
    echo json_encode(['message' => "Error: " . $conn->error]);
}
$conn->close();


 ?>
