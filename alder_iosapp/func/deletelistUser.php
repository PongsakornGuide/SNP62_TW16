<?php
$conn = $conn = mysqli_connect("localhost","root","","Alder");
  if($conn->connect_error)
  {
  die("Connection failed:".$conn->connect_error);
  }
$id = 0;
if(isset($_GET['delete']))
{
  $id = $_GET['delete'];
  echo "$id";
  $conn->query("DELETE FROM join_activity WHERE id = '$id'") or die($conn->error());
  header( "location: ../config/activity.php" );
}
else {
  echo "Error";
}
?>
