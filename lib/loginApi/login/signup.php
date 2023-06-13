<?php
include_once "koneksi.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];
    $status = $_POST["status"]; // Menangkap opsi jenis akun (admin atau user)

    // Cek apakah username sudah digunakan
    $cekUsername = mysqli_query($koneksi, "SELECT * FROM user WHERE username = '$username'");
    if (mysqli_num_rows($cekUsername) > 0) {
        $response["status"] = "error";
        $response["message"] = "Username already exists";
        echo json_encode($response);
        exit;
    }

    // Proses insert data ke database dengan menyertakan nilai status
    $query = "INSERT INTO user (username, password, status) VALUES ('$username', '$password', '$status')";
    $result = mysqli_query($koneksi, $query);

    if ($result) {
        $response["status"] = "success";
        $response["message"] = "Registration successful";
    } else {
        $response["status"] = "error";
        $response["message"] = "Registration failed";
    }

    echo json_encode($response);
}
?>
