<?php

require_once('connection.php');
session_start();



      if(empty($_POST['email']) || empty($_POST['password']))
      {
            header( "location: ../config/index.php?Empty = LOGIN NOT PASS" );
      }else{

            $sql = "SELECT * FROM users WHERE email ='".$_POST['email']."' AND password = '".$_POST['password']."' ";
            $result = mysqli_query($conn,$sql);

            if(mysqli_fetch_assoc($result))
            {
                $_SESSION['email'] = $_POST['email'];
                header("location: ../config/home.php");
            }else{
                header("location: ../config/index.php?Invalid=Please Enter Correct Email and Password.");
            }
      }


 ?>
