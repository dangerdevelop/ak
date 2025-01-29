<?php
require "core.php";
head();
?>
<div class="content-wrapper" style="margin-top: 0px!important;background-color: #1b1d1e;">

	<!--CONTENT CONTAINER-->
	<!--===================================================-->
	<div class="content-header">

		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 "><i class="fas fa-history"></i> Login Geçmişi</h1>
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
							<h3 class="card-title">Login Geçmişi</h3>
						</div>
						<div class="card-body">
							<table id="dt-basicloghist" class="table table-bordered table-hover table-sm" width="100%">
								<thead class="<?php echo $thead; ?>">
									<tr>
										<th><i class="fas fa-user"></i> Kullanıcı Adı</th>
										<th><i class="fas fa-address-card"></i> IP Adresi</th>
										<th><i class="far fa-calendar-alt"></i> Tarih&Saat</th>
										<th><i class="fas fa-info-circle"></i> Login Durumu</th>
										<th><i class="fas fa-cog"></i> İşlem</th>
									</tr>
								</thead>
								<tbody>
									<?php
									$query = $mysqli->query("SELECT * FROM `psec_logins` ORDER BY id DESC");
									while ($row = $query->fetch_assoc()) {
										echo '
										<tr>
											<td>' . $row['username'] . '</td>
                                            <td>' . $row['ip'] . '</td>
											<td data-sort="' . strtotime($row['date']) . '">' . $row['date'] . ' at ' . $row['time'] . '</td>
											<td>';
										if ($row['successful'] == 0) {
											echo '<span class="badge badge-danger">Failed</span>';
										} else {
											echo '<span class="badge badge-success">Successful</span>';
										}
										echo '
											</td>
											<td>
                                            <a href="ip-lookup.php?ip=' . $row['ip'] . '" class="btn btn-flat btn-flat btn-primary btn-sm"><i class="fas fa-search"></i> IP Araştır</a>
											</td>
										</tr>
'										;
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