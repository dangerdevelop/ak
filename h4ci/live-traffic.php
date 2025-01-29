<?php
require "core.php";
head();

// Purge logs older than 30 days
$datetod = strtotime(date('d F Y', strtotime('-30 days')));

if (isset($_GET['enable'])) {
	
    $settings['live_traffic'] = 1;
	file_put_contents('config_settings.php', '<?php $settings = ' . var_export($settings, true) . '; ?>');
}

if (isset($_GET['disable'])) {
	
    $settings['live_traffic'] = 0;
	file_put_contents('config_settings.php', '<?php $settings = ' . var_export($settings, true) . '; ?>');
	
	$files = glob('modules/cache/live-traffic/*'); // Get all cache file names
	foreach($files as $file){ // Iterate cache files
		if(is_file($file)) {
			unlink($file); // Delete cache file
		}
	}
}

$query2 = $mysqli->query("SELECT id, date FROM `psec_live-traffic` ORDER BY id ASC");
while ($row2 = $query2->fetch_assoc()) {
	if (strtotime($row2['date']) < $datetod) {
		$id     = $row2['id'];
		$query3 = $mysqli->query("DELETE FROM `psec_live-traffic` WHERE id = '$id'");
	}
}

if (isset($_GET['delete-all'])) {
    $query = $mysqli->query("TRUNCATE TABLE `psec_live-traffic`");
}
?>
<div class="content-wrapper" style="margin-top: 0px!important;background-color: #1b1d1e;" >
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
	</style>
			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div class="content-header">
				
				<div class="container-fluid">
				  <div class="row mb-2">
        		    <div class="col-sm-6">
        		      <h1 class="m-0 "><i class="fas fa-globe"></i> Ziyaretçi Trafik</h1>
        		    </div>
        		    <div class="col-sm-6">
        		      <ol class="breadcrumb float-sm-right">
        		        <li class="breadcrumb-item"><a href="dashboard.php" style="color:white;"><i class="fas fa-home"></i> <b> Admin Panel </b></a></li>
        		        
        		      </ol>
        		    </div>
        		  </div>
    			</div>
            </div>

				<!--Page content-->
				<!--===================================================-->
				<div class="content">
				<div class="container-fluid">

                <div class="row">
				<div class="col-md-12">
				
				 
					
                <div class="card card-primary card-outline">
						<div class="card-header">
							 
							<div class="float-sm-right">
 
								<a href="live-traffic.php" class="btn btn-flat btn-primary btn-sm"><i class="fas fa-sync-alt"></i> Yenile</a>
								<a href="?delete-all" class="btn btn-flat btn-danger btn-sm"><i class="fas fa-trash"></i> Tümünü Sil</a>
							</div>
						</div>
						<div class="card-body">
				
<table id="dt-basiclivetraff" class="table table-sm table-bordered table-hover" width="100%">
									<thead class="<?php echo $thead; ?>">
										<tr>
											<th>IP Adresi</th>
											<th>Ülke</th>
											<th>Tarayıcı</th>
										    <th>Sistem</th>
                                            <th>Domain </th>
											<th>Sayfa</th>
											<th>Tarih & Saat</th>
                                            <th>İşlem</th>
										</tr>
									</thead>
									<tbody>
<?php
$query = $mysqli->query("SELECT id, bot, ip, country, country_code, browser, browser_code, os, os_code, domain, request_uri, date, time FROM `psec_live-traffic` ORDER BY id DESC");
while ($row = $query->fetch_assoc()) {
    echo '
										<tr>
											<td>' . $row['ip'] . '
											';
    if ($row['bot'] == 1) {
        echo '<span class="badge badge-primary">Bot</span>';
    }
    echo '</td>
                                            <td><img src="assets/plugins/flags/blank.png" class="flag flag-' . strtolower($row['country_code']) . '" alt="' . $row['country'] . '" /> ' . $row['country'] . '</td>
											<td><img src="assets/img/icons/browser/' . $row['browser_code'] . '.png" /> ' . $row['browser'] . '</td>
										    <td><img src="assets/img/icons/os/' . $row['os_code'] . '.png" /> ' . $row['os'] . '</td>
                                            <td>' . $row['domain'] . '</td>
											<td>' . $row['request_uri'] . '</td>
	                                        <td data-sort="' . strtotime($row['date']) . '">' . $row['date'] . ' at ' . $row['time'] . '</td>
											<td><a href="visitor-details.php?id=' . $row['id'] . '" class="btn btn-sm btn-flat btn-primary"><i class="fas fa-tasks"></i> Detaylar</a></td>
										</tr>
';
}
?>
									</tbody>
								</table>
                        </div>
                     </div>
                    
				</div>
                    
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