<?php
include_once "koneksi.php";

$username = $_POST["username"];
$password = $_POST["password"];

$datauser = array();

$sqldatauser = $koneksi->query("SELECT * FROM user WHERE username = '$username' AND password = '$password'");
while ($rowdatauser = $sqldatauser->fetch_assoc()) {
    $datauser[] = $rowdatauser;
}

echo json_encode($datauser);

?>