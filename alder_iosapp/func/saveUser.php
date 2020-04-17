<?php

$conn = mysqli_connect("localhost","root","","Alder");
$conn->set_charset('utf8');


  $birthday = isset($_POST['birthday']) ? $_POST['birthday'] : '';
  $gender = isset($_POST['gender']) ? $_POST['gender'] : '';
  $religion = isset($_POST['religion']) ? $_POST['religion'] : '';
  $tel = isset($_POST['tel']) ? $_POST['tel'] : '';
  $address = isset($_POST['address']) ? $_POST['address'] : '';
  $relative_name = isset($_POST['relative_name']) ? $_POST['relative_name'] : '';
  $relative_phone = isset($_POST['relative_phone']) ? $_POST['relative_phone'] : '';
  $relative_type = isset($_POST['relative_type']) ? $_POST['relative_type'] : '';
  $id = isset($_POST['id']) ? $_POST['id'] : '';
  $conn = mysqli_connect("localhost","root","","Alder");
  $conn->set_charset('utf8');

  $sql = "UPDATE `user_apps` SET
  	birthday = '".$birthday."',
  	gender = '".$gender."',
  	religion = '".$religion."',
  	tel = '".$tel."',
    address = '".$address."',
    relative_name = '".$relative_name."',
    relative_phone = '".$relative_phone."',
    relative_type = '".$relative_type."'
    WHERE `user_apps`.`id` = '".$id."'";
  $query = mysqli_query($conn,$sql);



//

  if($conn->affected_rows)
  {
  	echo "สำเร็จ".$sql;
  	header( "location: ../config/home.php" );


  }
  else
  {
  	// echo "ไม่สำเร็จ";
    header( "location: ../config/home.php" );
  }
  ?>
