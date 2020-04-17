<?php
$conn = mysqli_connect("localhost","root","","Alder");
  if($conn->connect_error)
  {
  die("Connection failed:".$conn->connect_error);
  }
$id = 0;
if(isset($_GET['delete']))
{
  $id = $_GET['delete'];
  $conn->query("DELETE FROM story WHERE id = '$id'") or die($conn->error());
  header( "location: ../config/blogger.php" );
}
else {
  echo "Error";
}
?>
