<?php
include_once "koneksi.php";

$id = $_POST["id"];
$user_id = $_POST["user_id"];
$name = $_POST["name"];
$email = $_POST["email"];
$address = $_POST["address"];
$phone = $_POST["phone"];

$sql = "INSERT INTO profiles (id, user_id, name, email, address, phone) VALUES ('$id', '$user_id', '$name', '$email', '$address', '$phone')";

if (mysqli_query($koneksi, $sql)) {
  $response["success"] = true;
  $response["message"] = "Biodata saved successfully";
} else {
  $response["success"] = false;
  $response["message"] = "Error: " . $sql . "<br>" . mysqli_error($koneksi);
}

echo json_encode($response);
?>