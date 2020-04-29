<?php
$conn = mysqli_connect("localhost","root","","Alder");
$conn->set_charset('utf8');


$target_dir = "../images/";
$image = $_FILES["image"]["name"];
$image_name = basename($image);
$target_file = $target_dir . $image_name;
$uploadOk = 1; //
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
//
$check = getimagesize($_FILES["image"]["tmp_name"]);
if ($check !== false) {
     echo "File is an image - " . $check["mime"] . ".";
    $uploadOk = 1;
} else {
    echo json_encode(['message' => "File is not an image."]);
    $uploadOk = 0;
}

if ($uploadOk == 0) {
    echo json_encode(['message' => "Sorry, your file was not uploaded."]);
} else {
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
         echo "The file " . $image_name . " has been uploaded.";
         $title = $_POST["title"];
         $content = $_POST["content"];
         $image_path = "/images/" . $image_name;
         $center = $_POST["center"];
         $caption = $_POST["caption"];



        $sql = "INSERT INTO story (title,content,image,center,caption)
        VALUES ('$title','$content','$image_path','$center','$caption')";

        if ($conn->query($sql) === true){
            echo json_encode(['message' => "Created Article Successfully"]);
            header( "location: ../config/blogger.php" );
        }else{
            echo json_encode(['message' => "Error: " . $conn->error]);
        }
        $conn->close();

    } else {
        echo json_encode(['message' => "Sorry, there was an error uploading your file."]);
    }
}
?>
