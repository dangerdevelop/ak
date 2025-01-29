<?php
session_start();
include('config.php');

if (isset($_SESSION['id'])) {
    $userID = $_SESSION['id'];
    $ipAddress = $_SERVER['REMOTE_ADDR'];
    $currentTime = time() + 7;

    $result = mysqli_query($conn, "SELECT u.last_activity, i.lastOnline 
                                  FROM users u
                                  LEFT JOIN ips i ON i.ipAddress = '$ipAddress'
                                  WHERE u.id = $userID");

    if ($row = mysqli_fetch_assoc($result)) {
        $lastActivity = $row['last_activity'];
        $lastOnline = $row['lastOnline'];

        if ($currentTime - $lastActivity <= 10) {
            mysqli_query($conn, "UPDATE users SET last_activity = $currentTime WHERE id = $userID");
            mysqli_query($conn, "UPDATE ips SET lastOnline = $currentTime WHERE ipAddress = '$ipAddress'");
            echo "online";
        } else {
            echo "offline";
        }
    } else {
        echo "offline";
    }
} else {
    echo "offline";
}
