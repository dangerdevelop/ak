<?php
session_start();
include('config.php');

if (isset($_SESSION['id'])) {
    $ipAddress = $_SERVER['REMOTE_ADDR'];
    $result = mysqli_query($conn, "SELECT lastOnline FROM ips WHERE ipAddress = '$ipAddress'");

    if ($row = mysqli_fetch_assoc($result)) {
        $lastActivity = $row['lastOnline'];
        $currentTime = time();

        if ($currentTime - $lastActivity <= 10) {
            echo "online";
        } else {
            echo "offline";
        }
    } else {
        echo "offline";
    }
} else {
    $ipAddress = $_SERVER['REMOTE_ADDR'];
    $timer = time() + 7;
    
    $checkResult = mysqli_query($conn, "SELECT * FROM ips WHERE ipAddress = '$ipAddress'");
    
    if (mysqli_num_rows($checkResult) > 0) {
        $sql = "UPDATE ips SET lastOnline = $timer WHERE ipAddress = '$ipAddress'";
    } else {
        $sql = "INSERT INTO ips (ipAddress, lastOnline) VALUES ('$ipAddress', $timer)";
    }
    mysqli_query($conn, $sql);
}
?>
