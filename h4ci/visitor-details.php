<?php
require "core.php";
head();

if (isset($_GET['id'])) {
    $id     = (int) $_GET["id"];

    $result = $mysqli->query("SELECT * FROM `psec_live-traffic` WHERE id = '$id'");
    $row    = mysqli_fetch_assoc($result);
    if (empty($id)) {
        echo '<meta http-equiv="refresh" content="0; url=live-traffic.php">';
        exit();
    }
    if (mysqli_num_rows($result) == 0) {
        echo '<meta http-equiv="refresh" content="0; url=live-traffic.php">';
        exit();
    }
?>  
<div class="content-wrapper" style="margin-top: 0px!important;background-color: #1b1d1e;">

			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div class="content-header">
				
				<div class="container-fluid">
				  <div class="row mb-2">
        		    <div class="col-sm-6">
        		      <h1 class="m-0 "><i class="fas fa-align-justify"></i> Ziyaretçi Detayları</h1>
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

                <div class="row">
				<div class="col-md-12">
				    <div class="card card-primary card-outline">
						<div class="card-header">
							<h3 class="card-title">Ziyaretçi Detayları #<?php
    echo $row['id'];
?></h3>
						</div>
						<div class="card-body">
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="control-label">
                                                        <i class="fas fa-user"></i> IP Address
                                                    </label>
													<input type="text" class="form-control" value="<?php
    echo $row['ip'];
?>" readonly>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="control-label">
                                                        <i class="fas fa-calendar-alt"></i> Tarih ve Saat
                                                    </label>
													<input type="text" class="form-control" value="<?php
    echo '' . $row['date'] . ' at ' . $row['time'] . '';
?>" readonly>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="control-label">
                                                         <i class="fas fa-globe"></i> Tarayıcı
                                                    </label>
                                                    <div class="input-group mar-btm">
											            <span class="input-group-addon">
                                                            <img src="assets/img/icons/browser/<?php
    echo $row['browser_code'];
?>.png" />
                                                        </span>
													   <input type="text" class="form-control" value="<?php
    echo $row['browser'];
?>" readonly>
                                                    </div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="control-label">
                                                         <i class="fas fa-desktop"></i> Operating System
                                                    </label>
                                                    <div class="input-group mar-btm">
											            <span class="input-group-addon">
                                                            <img src="assets/img/icons/os/<?php
    echo $row['os_code'];
?>.png" />
                                                        </span>
                                                        <input type="text" class="form-control" value="<?php
    echo $row['os'];
?>" readonly>
                                                    </div>
												</div>
											</div>
										</div>
                                        <div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="control-label">
                                                         <i class="fas fa-flag"></i> Ülke
                                                    </label>
                                                    <div class="input-group mar-btm">
											            <span class="input-group-addon">
                                                            <img src="assets/plugins/flags/blank.png" class="flag flag-<?php
    echo strtolower($row['country_code']);
?>" alt="<?php
    echo $row['country'];
?>" />
                                                        </span>
                                                        <input type="text" class="form-control" value="<?php
    echo $row['country'];
?>" readonly>
                                                    </div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="control-label">
                                                         <i class="fas fa-map-pin"></i> Ülke kodu
                                                    </label>
													<input type="text" class="form-control" value="<?php
    echo $row['country_code'];
?>" readonly>
												</div>
											</div>
										</div>
                                        <div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<label class="control-label">
                                                         <i class="fas fa-mobile-alt"></i> Cihaz tipi
                                                    </label>
													<input type="text" class="form-control" value="<?php
    echo $row['device_type'];
?>" readonly>
												</div>
											</div>
                                            <div class="col-sm-6">
												<div class="form-group">
													<label class="control-label">
                                                         <i class="fas fa-atlas"></i> Domain
                                                    </label>
													<input type="text" class="form-control" value="<?php
    echo $row['domain'];
?>" readonly>
												</div>
											</div>
										</div>
                                        <div class="row">
                                        <div class="col-sm-12">
											<label class="control-label">
                                                <i class="fas fa-link"></i> Ziyaret Edilen Sayfa
                                            </label>
                                            <input type="text" class="form-control" value="<?php
    echo $row['request_uri'];
?>" readonly>
										</div>
                                        </div><br />
                                        <div class="row">
                                            <div class="col-sm-4">
                                            <div class="form-group">
												<label class="control-label">
                                                    <i class="fas fa-robot"></i> Bot
                                                </label>
                                                <input type="text" class="form-control" value="
<?php
    if ($row['bot'] == 1) {
        echo 'Yes';
    } else {
        echo 'No';
    }
?>
												" readonly>
                                            </div>
                                            </div>
                                            <div class="col-sm-8">
                                            <div class="form-group">
												<label class="control-label">
                                                    <i class="fas fa-user-secret"></i> User Agent
                                                </label>
                                                <textarea placeholder="User Agent" rows="2" class="form-control" readonly><?php
    echo $row['useragent'];
?></textarea>
                                            </div>
                                            </div>	
										</div>
										<div class="row">
                                        <div class="col-sm-12">
											<label class="control-label">
                                                <i class="fas fa-reply"></i> Referer URL
                                            </label>
                                            <input type="text" class="form-control" value="<?php
    echo $row['referer'];
?>" readonly>
										</div>
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
} else {
    echo '<meta http-equiv="refresh" content="0; url=live-traffic.php">';
    exit();
}
?>