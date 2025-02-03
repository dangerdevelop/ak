<?php
require "core.php";
head();
// Delete outdated cache files
$now   = time();

$files = glob("modules/cache/ip-details" . "/*");
foreach ($files as $file) {
  if (is_file($file)) {
    if (($now - filemtime($file)) >= (1 * 24 * 60 * 60)) { // 1 day
      unlink($file);
    }
  }
}
$files = glob("modules/cache/live-traffic" . "/*");
foreach ($files as $file) {
  if (is_file($file)) {
    if (($now - filemtime($file)) >= (1 * 24 * 60 * 60)) { // 1 day
      unlink($file);
    }
  }
}
$files = glob("modules/cache/proxy" . "/*");
foreach ($files as $file) {
  if (is_file($file)) {
    if (($now - filemtime($file)) >= (1 * 24 * 60 * 60)) { // 1 day
      unlink($file);
    }
  }
}
?>
<div class="content-wrapper" style="margin-top: 0px!important;background-color: #1b1d1e;">
  <style>
    div.card-body {
      background-color: #1b1d1e;
    }

    div.card-header {
      background-color: #1b1d1e;
    }

    div.content-header {
      background-color: #1b1d1e;
    }

    div.col-md-12 {
      background-color: #1b1d1e;
    }

    div.content-wrapper {
      background-color: #1b1d1e;
    }

    body.sidebar-mini.layout-fixed.layout-navbar-fixed.control-sidebar-slide-open.dark-mode.height_auto {
      background-color: #1b1d1e;
    }

    th.sorting {
      text-transform: uppercase;
    }

    td.dtr-control {
      font-weight: 700;
      font-style: normal;
      text-align: center;
    }

    div button span {
      font-weight: 700;
      font-style: normal;

    }

    button.btn.btn-secondary.buttons-excel.buttons-html5 {
      background-color: #f4511e;
    }

    button.btn.btn-secondary.buttons-csv.buttons-html5 {
      background-color: #f4511e;
    }

    button.btn.btn-secondary.buttons-pdf.buttons-html5 {
      background-color: #f4511e;
    }

    div.container-fluid {
      background-color: #1b1d1e;
    }

    div.content-wrapper {
      background-color: #1b1d1e;
    }

    body.sidebar-mini.layout-fixed.layout-navbar-fixed.control-sidebar-slide-open.dark-mode.height_auto {
      background-color: #1b1d1e;
    }
  </style>
  <!--CONTENT CONTAINER-->
  <!--===================================================-->
  <div class="content-header">

    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">

          </ol>
        </div>
      </div>
    </div>
  </div>

  <!--Page content-->
  <!--===================================================-->
  <div class="content">
    <div class="container-fluid">

      <h4 class="card-title">Bugünün İstatistikleri</h4><br />
      <?php
      $date   = date('d F Y');

      $query  = $mysqli->query("SELECT * FROM `psec_logs` WHERE `date`='$date' AND `type`='SQLi'");
      $count  = mysqli_num_rows($query);
      $query2 = $mysqli->query("SELECT COUNT(*) AS total FROM `psec_bans`");
      $row = $query2->fetch_assoc();
      $count2 = $row['total'];

      $query3 = $mysqli->query("SELECT COUNT(*) AS total FROM `users`");
      $row = $query3->fetch_assoc();
      $count3 = $row['total'];
      $query4 = $mysqli->query("SELECT * FROM `psec_logs` WHERE `date`='$date' AND `type`='Spammer'");
      $count4 = mysqli_num_rows($query4);
      ?>
      <div class="row">

        <div class="col-sm-6 col-lg-3">
          <div class="small-box bg-info">
            <div class="inner">
              <h3><?php
                  echo $count;
                  ?></h3>
              <p>SQLi Attacks</p>
            </div>
            <div class="icon">
              <i class="fas fa-code"></i>
            </div>
            <a href="sqli-logs.php" class="small-box-footer">View Logs <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-sm-6 col-lg-3">
          <div class="small-box bg-danger">
            <div class="inner">
              <h3><?php
                  echo $count2;
                  ?></h3>
              <p>BAN</p>
            </div>
            <div class="icon">
              <i class="fas fa-robot"></i>
            </div>
            <a href="bans-ip.php" class="small-box-footer">Tümünü Aç <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-sm-6 col-lg-3">
          <div class="small-box bg-success">
            <div class="inner">
              <h3><?php
                  echo $count3;
                  ?></h3>
              <p>LOGLAR</p>
            </div>
            <div class="icon">
              <i class="fas fa-globe"></i>
            </div>
            <a href="logs.php" class="small-box-footer">Tümünü Aç <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-sm-6 col-lg-3">
          <div class="small-box bg-warning">
            <div class="inner">
              <h3><?php
                  echo $count4;
                  ?></h3>
              <p>Spammers</p>
            </div>
            <div class="icon">
              <i class="fas fa-keyboard"></i>
            </div>
            <a href="spammer-logs.php" class="small-box-footer">View Logs <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
      </div>

      <br />






    </div>
  </div>
  <!--===================================================-->
  <!--End page content-->

</div>
<!--===================================================-->
<!--END CONTENT CONTAINER-->
</div>
<?php
footer();
?>