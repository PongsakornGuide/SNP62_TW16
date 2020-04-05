<?php

$title = isset($_POST['title']) ? $_POST['title'] : '';
$type = isset($_POST['type']) ? $_POST['type'] : '';
$content = isset($_POST['content']) ? $_POST['content'] : '';
$objective = isset($_POST['objective']) ? $_POST['objective'] : '';
$leaderActivity = isset($_POST['leaderActivity']) ? $_POST['leaderActivity'] : '';
$assistantActivity = isset($_POST['assistantActivity']) ? $_POST['assistantActivity'] : '';
$startTime = isset($_POST['startTime']) ? $_POST['startTime'] : '';
$endTime = isset($_POST['endTime']) ? $_POST['endTime'] : '';
$startDate = isset($_POST['startDate']) ? $_POST['startDate'] : '';
$endDate = isset($_POST['endDate']) ? $_POST['endDate'] : '';
$equipment = isset($_POST['equipment']) ? $_POST['equipment'] : '';

$id = isset($_POST['id']) ? $_POST['id'] : '';

  $conn = mysqli_connect("localhost","root","","Alder");
  $conn->set_charset('utf8');

  $sql = "UPDATE `post_timelines` SET
  title = '".$title."',
  type = '".$type."',
  content = '".$content."',
  objective = '".$objective."',
  leaderActivity = '".$leaderActivity."',
  assistantActivity = '".$assistantActivity."',
  startTime = '".$startTime."',
  endTime = '".$endTime."',
  startDate = '".$startDate."',
  endDate = '".$endDate."',
  equipment = '".$equipment."'
  WHERE `post_timelines`.`id` = '".$id."'";
  $query = mysqli_query($conn,$sql);

  if($conn->affected_rows)
  {
  	echo "สำเร็จ".$sql;
  	header( "location: ../config/activity.php" );

  }
  else
  {
    echo $sql;
  	echo "ไม่สำเร็จ";
  }
  ?>
