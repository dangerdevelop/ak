<?php
    $servername = "localhost"; //Elleme
    $host = "127.0.0.1"; //Elleme
	//-------------------------------
	
	
	//Aşağıdaki kısımlar düzeltilecek
    $username = "ak_user"; //değiştir
    $password = "nmpyE3msfkFjFbwB"; //değiştir
    $database = "ak_db"; //değiştir

    $conn = new mysqli($host, $username, $password, $database);
    $conn->set_charset("utf8mb4");
    mysqli_query($conn, "SET NAMES 'utf8mb4'");
    mysqli_query($conn, "SET CHARACTER SET utf8mb4");
    mysqli_query($conn, "SET COLLATION_CONNECTION = 'utf8mb4_unicode_ci'");

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    date_default_timezone_set('Europe/Istanbul');

?>