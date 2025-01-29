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

//Today Stats
@$date = @date('d F Y');
@$ctime = @date("H:i", strtotime('-30 seconds'));

$tsquery1 = $mysqli->query("SELECT id FROM `psec_live-traffic` WHERE `date`='$date' AND `time`>='$ctime'");
$tscount1 = $tsquery1->num_rows;
$tsquery2 = $mysqli->query("SELECT id FROM `psec_live-traffic` WHERE `date`='$date' AND `uniquev`=1");
$tscount2 = $tsquery2->num_rows;
$tsquery3 = $mysqli->query("SELECT id FROM `psec_live-traffic` WHERE `date`='$date'");
$tscount3 = $tsquery3->num_rows;
$tsquery4 = $mysqli->query("SELECT id FROM `psec_live-traffic` WHERE `date`='$date' AND `uniquev`=1 AND `bot`=1");
$tscount4 = $tsquery4->num_rows;

//Month Stats
@$mdate = @date('F Y');
$msquery1 = $mysqli->query("SELECT id FROM `psec_live-traffic` WHERE `date` LIKE '%$mdate' AND `uniquev`=1");
$mscount1 = $msquery1->num_rows;
$msquery2 = $mysqli->query("SELECT id FROM `psec_live-traffic` WHERE `date` LIKE '%$mdate'");
$mscount2 = $msquery2->num_rows;
$msquery3 = $mysqli->query("SELECT id FROM `psec_live-traffic` WHERE `date` LIKE '%$mdate' AND `uniquev`=1 AND `bot`=1");
$mscount3 = $msquery3->num_rows;
?>
<div class="content-wrapper" style="margin-top: 0px!important;background-color: #1b1d1e;">

			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div class="content-header">
				
				<div class="container-fluid">
				  <div class="row mb-2">
        		    <div class="col-sm-6">
        		      <h1 class="m-0 "><i class="fas fa-chart-line"></i> Ziyaretci İstatistik</h1>
        		    </div>
        		    <div class="col-sm-6">
        	 
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
							<h3 class="card-title">Ziyaretci İstatistik</h3>
							<div class="float-sm-right">
 
								<a href="?delete-all" class="btn btn-flat btn-danger btn-sm"><i class="fas fa-trash"></i> Verileri Sıfırla</a>
							</div>
						</div>
						<div class="card-body">
						
                             <h4 class="card-title">Bugünün İstatistikleri</h4><br />
							 
							 <div class="row">
                
					    <div class="col-sm-6 col-lg-3">
                            <div class="small-box bg-success">
                               <div class="inner">
                                   <h3><?php
echo $tscount1;
?></h3>
                                   <p>Çevrimiçi Ziyaretçiler</p>
                               </div>
                               <div class="icon">
                                   <i class="fas fa-users"></i>
                               </div>
                            </div>
					    </div>
					    <div class="col-sm-6 col-lg-3">
					        <div class="small-box bg-info">
                               <div class="inner">
                                   <h3><?php
echo $tscount2;
?></h3>
                                   <p>Benzersiz Ziyaretler</p>
                               </div>
                               <div class="icon">
                                   <i class="fas fa-chart-line"></i>
                               </div>
                            </div>
					    </div>
					    <div class="col-sm-6 col-lg-3">
					        <div class="small-box bg-danger">
                               <div class="inner">
                                   <h3><?php
echo $tscount3;
?></h3>
                                   <p>Toplam tıklama</p>
                               </div>
                               <div class="icon">
                                   <i class="fas fa-chart-bar"></i>
                               </div>
                            </div>
					    </div>
					    <div class="col-sm-6 col-lg-3">
					        <div class="small-box bg-warning">
                               <div class="inner">
                                   <h3><?php
echo $tscount4;
?></h3>
                                   <p>Bot tıklama</p>
                               </div>
                               <div class="icon">
                                   <i class="fab fa-android"></i>
                               </div>
                            </div>
					    </div>
					</div>
					
					    <br /><h4 class="card-title">Bu Ayın İstatistikleri</h4><br />
					
					    <div class="row">
                
					    <div class="col-sm-6 col-lg-4">
					        <div class="small-box bg-info">
                               <div class="inner">
                                   <h3><?php
echo $mscount1;
?></h3>
                                   <p>Benzersiz Ziyaretler</p>
                               </div>
                               <div class="icon">
                                   <i class="fas fa-chart-line"></i>
                               </div>
                            </div>
					    </div>
					    <div class="col-sm-6 col-lg-4">
					        <div class="small-box bg-danger">
                               <div class="inner">
                                   <h3><?php
echo $mscount2;
?></h3>
                                   <p>Toplam Ziyaretler</p>
                               </div>
                               <div class="icon">
                                   <i class="fas fa-chart-bar"></i>
                               </div>
                            </div>
					    </div>
					    <div class="col-sm-6 col-lg-4">
					        <div class="small-box bg-warning">
                               <div class="inner">
                                   <h3><?php
echo $mscount3;
?></h3>
                                   <p>Bot tıklama</p>
                               </div>
                               <div class="icon">
                                   <i class="fab fa-android"></i>
                               </div>
                            </div>
					    </div>
					</div>
					
					<br /> 
						
					<br /><h4 class="card-title">Genel İstatistikler</h4><br />	
						
						<div class="row">
						     <div class="col-md-6">
							      <center><h5><i class="fas fa-globe"></i> Tarayıcı İstatistikleri</h5></center>
								  <div id="canvas-holder" class="width50">
								  	  <canvas id="browser-graph"></canvas>
								  </div>
							 </div>
							 
							 <div class="col-md-6">
							      <center><h5><i class="fas fa-desktop"></i> İşletim Sistemi İstatistikleri</h5></center>
							      <div id="canvas-holder" class="width50">
								  	  <canvas id="os-graph"></canvas>
								  </div>
							 </div>
					  </div>
					  <div class="row">
							 <div class="col-md-6">
							      <br /><center><h5><i class="fas fa-mobile-alt"></i> Cihaz İstatistikleri</h5></center>
							      <div id="canvas-holder" class="width50">
								  	  <canvas id="device-graph"></canvas>
								  </div>
							 </div>
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