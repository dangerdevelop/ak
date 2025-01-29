<?php
require "core.php";
head();

$sec_username = $_SESSION['sec-username'];
?>
<div class="content-wrapper" style="margin-top: 0px!important;background-color: #1b1d1e;">
<style>
h3.card-title {
  display: none;
}

button.btn.btn-block.btn-flat.btn-success {
  font-weight: 700;
  font-style: normal;
  background-color: #e53935;
  
}

label.control-label {
  text-transform: uppercase;
}</style>
			<div class="content-header">
				
				<div class="container-fluid">
				  <div class="row mb-2">
        		    <div class="col-sm-6">
        		      <h1 class="m-0 "><i class="fas fa-user"></i> HESAP</h1>
        		    </div>
        		     
        		  </div>
    			</div>
            </div>

				<!--Page content-->
				<!--===================================================-->
				<div class="content">
				<div class="container-fluid">
                    
				<div class="row justify-content-center">
				<div class="col-md-6">

<form class="form-horizontal" action="" method="post">
                    <div class="card card-primary card-outline">
						<div class="card-header">
							<h3 class="card-title">Hesap</h3>
						</div>
				        <div class="card-body">
                               <div class="form-group">
											<label class="control-label"><i class="fas fa-user"></i> Kullanıcı Adı: </label>
											<input type="text" name="username" class="form-control" value="<?php
echo $settings['username'];
?>" required>
										</div>
                                        <hr />
                                        <div class="form-group">
											<label class="control-label"><i class="fas fa-key"></i> Yeni Parola: </label>
											<input type="text" name="password" class="form-control">
										</div>
                                       
                        </div>
                        <div class="card-footer row">
							<div class="col-md-8">
								<button class="btn btn-block btn-flat btn-success" name="edit" type="submit"><i class="fas fa-save"></i> KAYDET</button>
							</div>
							<div class="col-md-4">
								<button type="reset" class="btn btn-block btn-flat btn-default"><i class="fas fa-undo"></i> Reset</button>
							</div>
						</div>
				     </div>
</form>
<?php
if (isset($_POST['edit'])) {
    $username = addslashes($_POST['username']);
    $password = $_POST['password'];

	$settings['username'] = $username;
    $_SESSION['sec-username'] = $username;
	
    if ($password != null) {
        $password             = hash('sha256', $_POST['password']);
		
        $settings['password'] = $password;
    }

	
    file_put_contents('config_settings.php', '<?php $settings = ' . var_export($settings, true) . '; ?>');
	echo '<meta http-equiv="refresh" content="0;url=account.php">';
}
?>
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