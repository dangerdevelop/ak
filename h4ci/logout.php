<?php
    include "config.php";
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

    // if (!isset($_SESSION['sec-username']) || $_SESSION['sec-username'] !== $settings['username']) {
    //     echo json_encode(['error' => 'Unauthorized access']);
    //     exit();
    // }

    session_destroy();
    header("Location: ./index.php");
    exit();
?>