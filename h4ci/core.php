<?php
$psec_version = "5.0.2";

require 'config.php';

if (!isset($_SESSION)) {
  session_start();
}

if (!isset($_SESSION['user_id'])) {
  echo '<meta http-equiv="refresh" content="0; url=index.php" />';
  exit;
}

if (basename($_SERVER['SCRIPT_NAME']) != 'warning-pages.php') {
  $_GET  = filter_input_array(INPUT_GET, FILTER_SANITIZE_SPECIAL_CHARS);
  $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_SPECIAL_CHARS);
}

if ($settings['dark_mode']) {
  $thead = 'thead-dark';
} else {
  $thead = 'thead-light';
}
function get_banned($ip)
{
  include 'config.php';

  $query = $mysqli->query("SELECT * FROM `psec_bans` WHERE ip='$ip' LIMIT 1");
  $count = mysqli_num_rows($query);
  if ($count > 0) {
    return 1;
  } else {
    return 0;
  }
}

function get_bannedid($ip)
{
  include 'config.php';

  $query = $mysqli->query("SELECT * FROM `psec_bans` WHERE ip='$ip' LIMIT 1");
  $row   = mysqli_fetch_array($query);
  return $row['id'];
}

function head()
{
  include 'config.php';
?>
  <!DOCTYPE html>
  <html class="height_auto">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="DMNTR">
    <meta name="generator" content="DMN SEC" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="theme-color" content="#000000">
    <link rel="shortcut icon" href="assets/img/favicon.png">
    <title>DMN &rsaquo; Panel</title>

    <!-- STYLESHEETS -->
    <!--=================================================-->

    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.0/css/all.css">

    <!-- Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css" rel="stylesheet">
    <link href="assets/css/psec.css" rel="stylesheet">

    <!-- OverlayScrollbars -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.13.3/css/OverlayScrollbars.min.css" rel="stylesheet">

    <!-- Switchery -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/switchery/0.8.2/switchery.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/switchery/0.8.2/switchery.min.js"></script>

    <!-- Select2 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">

    <!-- DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.13.4/b-2.3.6/b-html5-2.3.6/r-2.4.1/datatables.min.css" />

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
    <link href="assets/plugins/flags/flags.css" rel="stylesheet">

    <!-- SCRIPTS -->
    <!--=================================================-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>

    <?php
    if (basename($_SERVER['SCRIPT_NAME']) == 'dashboard.php' || basename($_SERVER['SCRIPT_NAME']) == 'visit-analytics.php') {
      echo '
	<!--Chart.js-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>';
    }
    ?>

    <?php
    if (basename($_SERVER['SCRIPT_NAME']) == 'log-details.php' || basename($_SERVER['SCRIPT_NAME']) == 'ip-lookup.php') {
      echo '
	
    <!-- Map -->
    <script src="https://openlayers.org/api/OpenLayers.js"></script>';
    }
    ?>
  </head>

  <body class="sidebar-mini layout-fixed layout-navbar-fixed control-sidebar-slide-open <?php
                                                                                        if ($settings['dark_mode'] == 1) {
                                                                                          echo 'dark-mode';
                                                                                        }
                                                                                        ?> height_auto">
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&family=Noto+Sans:wght@600&display=swap');

      div.card-body {
        background-color: rgb(8, 16, 40) !important;
      }

      div.card-header {
        background-color: rgb(8, 16, 40) !important;
      }

      input.form-control {
        background-color: rgb(8, 16, 40) !important;
      }

      select.form-control {
        background-color: rgb(8, 16, 40) !important;
      }

      th.sorting {
        background-color: rgb(8, 16, 40) !important;
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      div.card-footer {
        background-color: rgb(8, 16, 40) !important;
      }

      div.row {
        background-color: rgb(8, 16, 40) !important;
      }

      div.content-header {
        background-color: rgb(8, 16, 40) !important;
      }

      li.paginate_button.page-item.next.disabled {
        background-color: rgb(8, 16, 40) !important;
      }

      li.paginate_button.page-item.previous.disabled {
        background-color: rgb(8, 16, 40) !important;
      }

      div.os-content {
        background-color: rgb(8, 16, 40) !important;
      }

      a.brand-link {
        background-color: rgb(8, 16, 40) !important;
      }

      div.content {
        background-color: rgb(8, 16, 40) !important;
      }

      div.content-wrapper {
        background-color: rgb(8, 16, 40) !important;
      }

      div.container-fluid {
        background-color: rgb(8, 16, 40) !important;
      }

      span.select2-selection.select2-selection--single {
        background-color: rgb(8, 16, 40) !important;
      }

      span.select2-selection__rendered {
        color: #fafafa !important;
        font-weight: 700;
        font-style: normal;

      }

      input.form-control {
        color: #fafafa !important;
        font-weight: 500;
        font-style: normal;
      }

      div div p {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      td.sorting_1 {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      td.dtr-control {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      tbody tr td {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      li a p {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      h1.m-0 {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      span.navbar-text.ml-auto {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
        font-size: 18px;
      }

      a.btn.btn-sm.btn-danger.btn-flat {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      h3.card-title {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      button.btn.btn-block.btn-flat.btn-danger {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      ol li a {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      li.breadcrumb-item.active {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      div button span {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      a.page-link {
        color: #bdbdbd;
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;

      }

      a.btn.btn-flat.btn-primary.btn-sm {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      a.btn.btn-flat.btn-danger.btn-sm {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        font-variation-settings:
          "wdth" 100;
      }

      div div p {
        font-family: "Noto Sans", sans-serif !important;
        font-weight: 600;
      }

      h1.m-0 {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
      }

      a.btn.btn-sm.btn-secondary.btn-flat {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        color: #ffffff;
        text-transform: uppercase;
      }

      h4.card-title {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
      }

      td.dataTables_empty {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
      }

      div div label {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
      }

      body footer strong {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
      }

      a.btn.btn-sm.btn-danger.btn-flat {
        font-family: "Noto Sans", sans-serif !important;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
        color: #ffffff;
        text-transform: uppercase;
      }


      li a p {
        text-transform: uppercase;
        font-weight: 700;
        font-style: normal;
        font-family: Montserrat
      }

      ul a p {
        font-weight: 700;
        font-style: normal;
        font-family: Montserrat;
        text-transform: uppercase;
      }

      li.nav-header {
        color: #cc0000;
        font-weight: 700;
        font-style: normal;
        font-family: Montserrat;
        margin-bottom: 5px;
      }

      .main-content {
        flex: 1;
      }

      .footer {
        text-align: center;
        margin-top: 136%;
        padding: 10px;
      }

      div.content-wrapper {
        background-color: #1b1d1e;

      }

      i.fa-brands.fa-telegram {
        color: #fdd835
      }

      i.fas.fa-align-justify {
        color: #fdd835;
      }

      i.fas.fa-history {
        color: #fdd835;
      }

      i.fas.fa-home {
        color: #fdd835;
      }

      i.fas.fa-globe {
        color: #fdd835;
      }

      i.fas.fa-chart-line {
        color: #fdd835;
      }

      div.wrapper {
        background-color: #081028 !important;
      }

      html.height_auto {
        background-color: #081028 !important;
      }

      button.btn.btn-primary.btn-sm {
        font-weight: 700;
        font-style: normal;
      }

      a.btn.btn-danger.btn-sm {
        font-weight: 700;
        font-style: normal;
      }

      button.btn.btn-primary {
        font-weight: 700;
        font-style: normal;
      }

      div.container {
        text-align: center;
      }

      div.sidebar {
        background-color: #081028 !important;
      }

      .main-header {
        display: none;
      }

      @media (max-width: 768px) {
        .main-header {
          display: block;
        }

        .wrapper {
          margin-top: 40px;
        }

        .dark-mode .navbar-dark {
          background-color: #1a191900;
        }
      }
    </style>
    <div class="wrapper">

      <nav class="main-header navbar navbar-expand navbar-dark">

        <ul class="nav navbar-nav">
          <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
          </li>
        </ul>




      </nav>
      <aside class="main-sidebar sidebar-dark-primary elevation-4">

        <center><a href="dashboard.php" class="brand-link">
            <img src="./assets/logo.png" style="width: 85px;" alt="dmntr" />
          </a></center>

        <div class="sidebar" style="margin-top: calc(3.5rem + 54px);">

          <div class="user-panel mt-3 d-flex align-content-center justify-content-center flex-wrap">
            <p class="margin_auto">
              <a href="account.php" class="btn btn-sm btn-secondary btn-flat" style="background-color: #0b5394"><i class="fas fa-user fa-fw"></i> HESAP</a>
              &nbsp;&nbsp;
              <a href="logout.php" class="btn btn-sm btn-danger btn-flat"><i class="fas fa-sign-out-alt fa-fw"></i> ÇIKIŞ</a>
            </p>
            <button id="usomCheckButton" class="btn btn-sm btn-info btn-flat" style="margin-top: 10px; margin-bottom: 10px; width: 174px;">
              <i class="fas fa-shield-alt"></i> USOM Kontrol Et
            </button>

            <script>
              async function checkUsom() {
                const button = document.getElementById('usomCheckButton');
                button.disabled = true;
                const originalText = button.innerHTML;
                button.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Sorgulanıyor';

                try {
                  const response = await fetch('usom_check.php', {
                    method: 'POST',
                    headers: {
                      'Content-Type': 'application/json'
                    }
                  });

                  if (!response.ok) {
                    throw new Error('Network response was not ok');
                  }

                  const blockedUrls = await response.text();
                  const currentPath = window.location.hostname;

                  const urlList = blockedUrls.includes(currentPath)

                  if (urlList) {
                    const warningDiv = document.createElement('div');
                    warningDiv.style.cssText = `
                  background-color: #dc3545; 
                  color: white;
                  padding: 10px;
                  margin: 10px 0;
                  font-size: 14px;
                  border-radius: 5px;
                  text-align: center;
                  word-wrap: break-word;
                  white-space: pre-wrap;
                  max-width: 100%;
                `;
                    warningDiv.innerHTML = '<strong>Uyarı!</strong><br>Bu site USOM tarafından engellenmiştir.';
                    document.querySelector('.user-panel').appendChild(warningDiv);
                  } else {
                    Swal.fire({
                      icon: 'success',
                      title: 'Sonuç bulunamadı',
                      text: 'Bir sorun gözükmüyor.',
                      confirmButtonText: 'Tamam'
                    });
                  }
                } catch (error) {
                  console.error('USOM kontrolü sırasında hata:', error);
                  Swal.fire({
                    icon: 'error',
                    title: 'Hata',
                    text: 'USOM kontrolü sırasında bir hata oluştu.',
                    confirmButtonText: 'Tamam'
                  });
                } finally {
                  button.disabled = false;
                  button.innerHTML = originalText;
                }
              }

              document.getElementById('usomCheckButton').addEventListener('click', checkUsom);
            </script>

          </div>

          <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar nav-compact flex-column" data-widget="treeview" role="menu">
              <li class="nav-header">SAYFALAR</li>

              <li class="nav-item <?php
                                  if (basename($_SERVER['SCRIPT_NAME']) == 'dashboard.php') {
                                    echo 'active';
                                  }
                                  ?>">
                <a href="dashboard.php" class="nav-link <?php
                                                        if (basename($_SERVER['SCRIPT_NAME']) == 'dashboard.php') {
                                                          echo 'active';
                                                        }
                                                        ?>">
                  <i class="fas fa-home"></i>&nbsp; <p>ANASAYFA</p>
                </a>
              </li>



              <li class="nav-item ">
                <a href="logs.php" class="nav-link <?php
                                                    if (basename($_SERVER['SCRIPT_NAME']) == 'logs.php') {
                                                      echo 'active';
                                                    }
                                                    ?>">

                  <?php
                  $lquery1 = $mysqli->query("SELECT * FROM `users`");
                  $lcount1 = mysqli_num_rows($lquery1);

                  ?> <i class="fa-solid fa-staff-snake" style=" color: #f1c232;"></i>&nbsp; &nbsp;<p>LOGLAR</p>
                  <span class="badge right badge-primary"><?php
                                                          echo $lcount1;
                                                          ?></span> </a>
              </li>


              <li class="nav-item <?php
                                  if (basename($_SERVER['SCRIPT_NAME']) == 'users.php') {
                                    echo 'active';
                                  }
                                  ?>">
                <a href="login-history.php" class="nav-link <?php
                                                            if (basename($_SERVER['SCRIPT_NAME']) == 'login-history.php') {
                                                              echo 'active';
                                                            }
                                                            ?>">
                  <i class="fas fa-history"></i>&nbsp; <p>Login Geçmişi</p>
                </a>
              </li>
              <li class="nav-item <?php
                                  if (basename($_SERVER['SCRIPT_NAME']) == 'users.php') {
                                    echo 'active';
                                  }
                                  ?>">
              </li>

              <li class="nav-header" style="
    margin-top: 10px;
">BAN </li>



              <a href="bans-ip.php" class="nav-link <?php
                                                    if (basename($_SERVER['SCRIPT_NAME']) == 'bans-ip.php') {
                                                      echo 'active';
                                                    }
                                                    ?>"> <i class="fas fa-align-justify"></i>&nbsp; <p>Ban Tablosu </p>

              </a>

              <a href="bans-country.php" class="nav-link <?php
                                                          if (basename($_SERVER['SCRIPT_NAME']) == 'bans-country.php') {
                                                            echo 'active';
                                                          }
                                                          ?>"> <i class="fa-solid fa-gear" style=" color: #f1c232;"></i>&nbsp; <p>Ülke Ban </p>

              </a>

              <a href="bans-other.php" class="nav-link <?php
                                                        if (basename($_SERVER['SCRIPT_NAME']) == 'bans-other.php') {
                                                          echo 'active';
                                                        }
                                                        ?>"> <i class="fa-solid fa-gear" style=" color: #f1c232;"></i>&nbsp; <p>Ban Ayarları </p>

              </a>


              <li class="nav-header" style="
    margin-top: 10px;
">ANALYTICS &nbsp;
                <?php
                if ($settings['live_traffic'] == 1) {
                  echo '<span class="right badge badge-success">ON</span>';
                } else {
                  echo '<span class="right badge badge-primary">OFF</span>';
                }
                ?></li>

              <li class="nav-item <?php
                                  if (basename($_SERVER['SCRIPT_NAME']) == 'live-traffic.php') {
                                    echo 'active';
                                  }
                                  ?>">
                <a href="live-traffic.php" class="nav-link <?php
                                                            if (basename($_SERVER['SCRIPT_NAME']) == 'live-traffic.php') {
                                                              echo 'active';
                                                            }
                                                            ?>">
                  <i class="fas fa-globe"></i>&nbsp; <p>Ziyaretçi Trafik</p>
                </a>
              </li>

              <li class="nav-item <?php
                                  if (basename($_SERVER['SCRIPT_NAME']) == 'visit-analytics.php') {
                                    echo 'active';
                                  }
                                  ?>">
                <a href="visit-analytics.php" class="nav-link <?php
                                                              if (basename($_SERVER['SCRIPT_NAME']) == 'visit-analytics.php') {
                                                                echo 'active';
                                                              }
                                                              ?>">
                  <i class="fas fa-chart-line"></i>&nbsp; <p>Ziyaretçi Analiz</p>
                </a>
              </li>

              <li class="nav-header" style="margin-top: 10px;">
                SAYFA AYARLARI
              </li>
              <li class="nav-item">
                <a href="edit-page.php" class="nav-link <?php if (basename($_SERVER['SCRIPT_NAME']) == 'edit-page.php') {
                                                          echo 'active';
                                                        } ?>">
                  <i class="fas fa-edit" style="color: #fdd835;"></i>&nbsp; <p>Sayfa Düzenle</p>
                </a>
              </li>


            </ul>

          </nav>
          <div class="footer">
            <strong>&copy; <?php echo date("Y"); ?> <a href="https://t.me/DMN_TR" target="_blank">DMNTR</a></strong>
          </div>
        </div>



      </aside>
    <?php
  }

  function footer()
  {
    include 'config.php';

    global $psec_version;
    ?>


    </div>

    <!--JAVASCRIPT-->
    <!--=================================================-->

    <!--Bootstrap 4-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!--AdminLTE-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/js/adminlte.min.js"></script>
    <script src="assets/js/psec.js"></script>

    <!--OverlayScrollbars-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.13.3/js/jquery.overlayScrollbars.min.js"></script>

    <!--Select2-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.full.min.js"></script>

    <!--DataTables-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.min.js"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.13.4/b-2.3.6/b-html5-2.3.6/r-2.4.1/datatables.min.js"></script>

  </body>

  </html>
<?php
  }
?>