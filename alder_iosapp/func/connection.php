<?php
      $conn = mysqli_connect("localhost","root","","Alder");

      if(!$conn){
          die('Please Check Your Connection'.mysqli_error($conn));
      }

 ?>
