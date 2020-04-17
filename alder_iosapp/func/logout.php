<?php
    session_start();
    if(isset($_GET['logout'])){
        session_destroy();
        header("location: ../config/index.php");
    }else{
      echo "555";
    }

 ?>
