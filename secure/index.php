<?php
require_once "config.php";

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Redirect if already logged in
if (isset($_SESSION["sec-username"]) && $_SESSION["sec-username"] === $settings["username"]) {
    header("Location: dashboard.php");
    exit();
}

// Sanitize inputs
$_GET = filter_input_array(INPUT_GET, FILTER_SANITIZE_SPECIAL_CHARS);
$_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_SPECIAL_CHARS);

$error = 0;
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="dmntr">
        <meta name="generator" content="dmntr secure" />
        <meta name="robots" content="noindex, nofollow">
        <meta name="theme-color" content="#000000">
        <title>DMN&rsaquo; Panel</title>

        <!-- CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.0/css/all.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css" rel="stylesheet">

        <!-- Favicon -->
        <link rel="shortcut icon" href="assets/img/favicon.png">
    </head>

    <body class="login-page <?php echo ($settings["dark_mode"] == 1) ? "dark-mode" : ""; ?>">
    <div class="login-box">
        <form action="" method="post">
        <div class="card card-outline card-primary">
            <div class="card-header text-center">
                <img src="./assets/logo.png" style="width: 70px;" alt="dmntr">
            </div>
            <div class="card">
                <div class="card-body text-white card-primary card-outline">
                <?php 
                if (isset($_POST["signin"])) {
                    $ip = filter_var($_SERVER["REMOTE_ADDR"], FILTER_VALIDATE_IP) === "::1" ? "127.0.0.1" : $_SERVER["REMOTE_ADDR"];
                    $date = date("d F Y");
                    $time = date("H:i");

                    $username = mysqli_real_escape_string($mysqli, $_POST["username"]);
                    $password = hash("sha256", $_POST["password"]);

                    if ($username === $settings["username"] && $password === $settings["password"]) {
                        $stmt = $mysqli->prepare("SELECT id FROM `psec_logins` WHERE `username`=? AND ip=? AND date=? AND time=? AND successful='1'");
                        $stmt->bind_param("ssss", $username, $ip, $date, $time);
                        $stmt->execute();
                        $result = $stmt->get_result();

                        if ($result->num_rows === 0) {
                            $stmt = $mysqli->prepare("INSERT INTO `psec_logins` (username, ip, date, time, successful) VALUES (?, ?, ?, ?, '1')");
                            $stmt->bind_param("ssss", $username, $ip, $date, $time);
                            $stmt->execute();
                        }

                        $_SESSION["sec-username"] = $username;
                        header("Location: dashboard.php");
                        exit();
                    } else {
                        $stmt = $mysqli->prepare("SELECT id FROM `psec_logins` WHERE `username`=? AND ip=? AND date=? AND time=? AND successful='0'");
                        $stmt->bind_param("ssss", $username, $ip, $date, $time);
                        $stmt->execute();
                        $result = $stmt->get_result();

                        if ($result->num_rows === 0) {
                            $stmt = $mysqli->prepare("INSERT INTO `psec_logins` (username, ip, date, time, successful) VALUES (?, ?, ?, ?, '0')");
                            $stmt->bind_param("ssss", $username, $ip, $date, $time);
                            $stmt->execute();
                        }

                        echo '<div class="alert alert-danger"><i class="fas fa-exclamation-circle"></i> The entered <strong>Username</strong> or <strong>Password</strong> is incorrect.</div>';
                        $error = 1;
                    }
                }
                ?> 
                <div class="form-group has-feedback <?php echo ($error == 1) ? "has-danger" : ""; ?>">
                    <div class="input-group mb-3">
                        <input type="username" name="username" class="form-control <?php echo ($error == 1) ? "is-invalid" : ""; ?>" placeholder="Username" <?php echo ($error == 1) ? "autofocus" : ""; ?> required>
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <div class="input-group mb-3">
                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button type="submit" name="signin" class="btn btn-md btn-primary btn-block btn-flat"><i class="fas fa-sign-in-alt"></i>&nbsp;Sign In</button>
                    </div>
                </div>
                </div>
            </div>
        </form>
        </div>
    </body>
</html>