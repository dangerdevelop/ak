<?php
require "core.php";
head();

if (isset($_GET['delete-id'])) {
    $id    = (int) $_GET["delete-id"];

    $query = $mysqli->query("DELETE FROM `psec_bans-other` WHERE id='$id'");
}
?>
<div class="content-wrapper" style="margin-top: 0px!important;background-color: #1b1d1e;">
<style>
    
    label.control-label {
  color: #ffca28;
  text-transform: uppercase
  
}

div.card-header {
  color: #ffca28;
  text-transform: uppercase 
}

select.form-control {
  text-transform: uppercase;
  font-weight: 700;
  font-style: normal
  
}

td.dataTables_empty {
   color: #ffca28;
   
}
</style>
			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div class="content-header">
				
				<div class="container-fluid">
				  <div class="row mb-2">
        		    <div class="col-sm-6">
        		      <h1 class="m-0 "><i class="fas fa-desktop"></i> Ban Ayarları</h1>
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
                    
<?php
if (isset($_POST['block'])) {

    $value = addslashes($_POST['value']);
    $type  = $_POST['type'];
    
    $queryvalid = $mysqli->query("SELECT * FROM `psec_bans-other` WHERE value='$value' and type='$type' LIMIT 1");
    $validator  = mysqli_num_rows($queryvalid);
    if ($validator > "0") {
        echo '<br />
		<div class="callout callout-info">
                <p><i class="fas fa-info-circle"></i> There is already such record in the database.</p>
        </div>';
    } else {
        $query = $mysqli->query("INSERT INTO `psec_bans-other` (value, type) VALUES('$value', '$type')");
    }
}
?>
                    
                <div class="row">
                   
				<div class="col-md-6">
				     <div class="card card-primary card-outline">
						<div class="card-header">
						 
						</div>
				        <div class="card-body">
						<form class="form-horizontal" action="" method="post">
										<div class="form-group">
											<label class="control-label">Tarayıcı ,İşletim Sistemi,Sağlayıcı </label>
											<input name="value" class="form-control" type="text" pleaceholder="Windows 10 Vs Gibi Yazın" required>
										</div>
                                        <div class="form-group">
											<label class="control-label">Ban Türü: </label>
	<select name="type" class="form-control" required>
        <option value="browser" selected>Tarayıcı</option>
        <option value="os">İşletim Sistemi</option>
        <option value="isp">Internet Sağlayıcı</option>
		<option value="referrer">Referrer</option>
    </select>
										</div>
                        </div>
                        <div class="card-footer">
							<button class="btn btn-flat btn-block btn-danger" name="block" type="submit">Ban</button>
				        </div>
				     </div>
				</div>
</form>
                    
                    <div class="col-md-6">
				     <div class="card">
						<div class="card-header">
							<h3 class="card-title">İnternet Servis Sağlayıcısı <strong> Ban</strong></h3>
						</div>
				        <div class="card-body">
<table id="dt-basic3" class="table table-bordered table-hover table-sm" width="100%">
									<thead class="<?php echo $thead; ?>">
										<tr>
						                  <th><i class="fas fa-cloud"></i> ISP</th>
										  <th><i class="fas fa-cog"></i> Actions</th>
										</tr>
									</thead>
									<tbody>
<?php
$query = $mysqli->query("SELECT * FROM `psec_bans-other` WHERE type='isp'");
while ($row = $query->fetch_assoc()) {
    echo '
										<tr>
						                    <td>' . $row['value'] . '</td>
											<td>
                                            <a href="?delete-id=' . $row['id'] . '" class="btn btn-flat btn-success btn-block btn-sm"><i class="fas fa-unlock"></i>  Ban Kaldır</a>
											</td>
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
                    
                <div class="row">
				<div class="col-md-6">
				    <div class="card">
						<div class="card-header">
							<h3 class="card-title">Tarayıcı <strong>Ban</strong></h3>
						</div>
						<div class="card-body">
<table id="dt-basicphpconf" class="table table-bordered table-hover table-sm" width="100%">
									<thead class="<?php echo $thead; ?>">
										<tr>
						                  <th><i class="fas fa-globe"></i> Tarayıcı</th>
										  <th><i class="fas fa-cog"></i> Actions</th>
										</tr>
									</thead>
									<tbody>
<?php
$query = $mysqli->query("SELECT * FROM `psec_bans-other` WHERE type='browser'");
while ($row = $query->fetch_assoc()) {
    echo '
										<tr>
						                    <td>' . $row['value'] . '</td>
											<td>
                                            <a href="?delete-id=' . $row['id'] . '" class="btn btn-flat btn-success btn-block btn-sm"><i class="fas fa-unlock"></i> Ban Kaldır</a>
											</td>
										</tr>
';
}
?>
									</tbody>
								</table>
                        </div>
                     </div>
                </div>
                    
				<div class="col-md-6">
				     <div class="card">
						<div class="card-header">
							<h3 class="card-title">İşletim Sistemi <strong>Ban</strong></h3>
						</div>
				        <div class="card-body">
<table id="dt-basic2" class="table table-bordered table-hover table-sm" width="100%">
									<thead class="<?php echo $thead; ?>">
										<tr>
						                  <th><i class="fas fa-desktop"></i> İşletim Sistemi</th>
										  <th><i class="fas fa-cog"></i> Actions</th>
										</tr>
									</thead>
									<tbody>
<?php
$query = $mysqli->query("SELECT * FROM `psec_bans-other` WHERE type='os'");
while ($row = $query->fetch_assoc()) {
    echo '
										<tr>
						                    <td>' . $row['value'] . '</td>
											<td>
                                            <a href="?delete-id=' . $row['id'] . '" class="btn btn-flat btn-success btn-block btn-sm"><i class="fas fa-unlock"></i> Unblock</a>
											</td>
										</tr>
';
}
?>
									</tbody>
								</table>	
                        </div>
				     </div>
				</div>
				
				<div class="col-md-6">
				     <div class="card">
						<div class="card-header">
							<h3 class="card-title">Blocked <strong>Referrers</strong></h3>
						</div>
				        <div class="card-body">
<table id="dt-basic4" class="table table-bordered table-hover table-sm" width="100%">
									<thead class="<?php echo $thead; ?>">
										<tr>
						                  <th><i class="fas fa-link"></i> Referrer</th>
										  <th><i class="fas fa-cog"></i> Actions</th>
										</tr>
									</thead>
									<tbody>
<?php
$query = $mysqli->query("SELECT * FROM `psec_bans-other` WHERE type='referrer'");
while ($row = $query->fetch_assoc()) {
    echo '
										<tr>
						                    <td>' . $row['value'] . '</td>
											<td>
                                            <a href="?delete-id=' . $row['id'] . '" class="btn btn-flat btn-success btn-block btn-sm"><i class="fas fa-unlock"></i>  Ban Kaldır</a>
											</td>
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