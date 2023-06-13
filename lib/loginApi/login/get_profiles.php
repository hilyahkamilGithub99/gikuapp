<?php
include_once "koneksi.php";

// Ambil data profiles dari database
$sql = "SELECT * FROM profiles";
$result = mysqli_query($koneksi, $sql);

$response = array();

if (mysqli_num_rows($result) > 0) {
  $response["success"] = true;
  $response["message"] = "Profiles retrieved successfully";
  $response["profiles"] = array();

  while ($row = mysqli_fetch_assoc($result)) {
    $profile = array(
      "id" => $row["id"],
      "user_id" => $row["user_id"],
      "name" => $row["name"],
      "email" => $row["email"],
      "address" => $row["address"],
      "phone" => $row["phone"]
    );

    array_push($response["profiles"], $profile);
  }
} else {
  $response["success"] = false;
  $response["message"] = "No profiles found";
}

echo json_encode($response);
?>
