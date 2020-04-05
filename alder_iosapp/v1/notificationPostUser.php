<?php

require_once '../includes/Constants.php';
require_once '../includes/DbConnect.php';
$conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($conn, "utf8");
header('Content-Type: application/json; charset=utf-8');
$id = $_GET["id"];
// $sql = "SELECT * FROM notificationsPost where user_id = $id";

// $sql = "SELECT notificationsPost.*,user_apps.photo,user_apps.username ,ad_post_timeline.caption FROM notificationsPost 
// LEFT JOIN user_apps ON notificationsPost.other_id = user_apps.id
// LEFT JOIN ad_post_timeline ON notificationsPost.ad_post_timeline_id = ad_post_timeline.id
// WHERE notificationsPost.user_id = $id AND notificationsPost.other_id != $id ORDER BY notificationsPost.id DESC";

$sql = "SELECT notificationsPost.id,notificationsPost.user_id,notificationsPost.other_id,notificationsPost.ad_post_timeline_id,notificationsPost.create_at as Timer ,user_apps.photo,user_apps.username,ad_post_timeline.user_app_id,ad_post_timeline.user_app_id,ad_post_timeline.caption,ad_post_timeline.img,ad_post_timeline.created_at 
,COUNT(likeActivity.id) AS likeActivity, COUNT(comments.id) AS commentsActivity FROM notificationsPost 
LEFT JOIN user_apps ON notificationsPost.other_id = user_apps.id
LEFT JOIN ad_post_timeline ON notificationsPost.ad_post_timeline_id = ad_post_timeline.id
LEFT JOIN likeActivity ON likeActivity.ad_post_timeline_id = ad_post_timeline.id 
LEFT JOIN comments ON comments.ad_post_timeline_id = ad_post_timeline.id
WHERE notificationsPost.user_id = $id AND notificationsPost.other_id != $id ORDER BY notificationsPost.id DESC";

$result = $conn->query($sql);
$datas = array();

while ($row = $result->fetch_object()){
        $datas[] = $row;
}

echo json_encode($datas, JSON_NUMERIC_CHECK);
$conn->close();
