<?php
require "core.php";
head();

$settings_query = $mysqli->query("SELECT * FROM page_settings WHERE id='1'");
$settings = $settings_query->fetch_assoc();

if (isset($_POST['save'])) {
    $notification_text1 = $_POST['notification_text1'];
    $notification_text2 = $_POST['notification_text2'];
    $success_text1 = $_POST['success_text1']; 
    $success_text2 = $_POST['success_text2'];

    $query = $mysqli->query("UPDATE page_settings SET notification_text1='$notification_text1', notification_text2='$notification_text2', success_text1='$success_text1', success_text2='$success_text2' WHERE id='1'");

    if($query === TRUE) {
        echo "
        <script>
            Swal.fire({
                icon: 'success',
                title: 'Başarılı',
                text: 'Sayfa ayarları başarıyla güncellendi.',
                confirmButtonText: 'Tamam'
            }).then(function() {
                window.location.href = 'edit-page.php';
            });
        </script>
        ";
    }
}
?>
<div class="content-wrapper" style="margin-top: 0px!important;">

    <!--CONTENT CONTAINER-->
    <!--===================================================-->
    <div class="content-header">

        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0" style="color: #3498db;text-shadow: 2px 2px 4px rgba(0,0,0,0.2);"><i class="fas fa-edit"></i> Sayfa Düzenle</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="dashboard.php" style="color: #3498db;"><i class="fas fa-home"></i> Admin Panel</a></li>
                        <li class="breadcrumb-item active" style="color: #95a5a6;">Sayfa Düzenle</li>
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
                    <div class="card card-primary card-outline" style="box-shadow: 0 0 20px rgba(0,0,0,0.1);">
                        <div class="card-header" style="background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);">
                            <h3 class="card-title" style="color: white;">Sayfa Yazıları</h3>
                        </div>
                        <div class="card-body" style="background-color: rgba(255,255,255,0.9);">
                            <form method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4 style="color: #2980b9;border-bottom: 2px solid #3498db;padding-bottom: 10px;">Bildirim Sayfası Yazıları</h4>
                                        <div class="form-group">
                                            <label style="color: #34495e;">Bildirim Yazısı 1</label>
                                            <input type="text" class="form-control" name="notification_text1" value="<?php echo $settings['notification_text1']; ?>" style="border-radius: 5px;border: 1px solid #bdc3c7;">
                                        </div>

                                        <div class="form-group">
                                            <label style="color: #34495e;">Bildirim Yazısı 2</label>
                                            <input type="text" class="form-control" name="notification_text2" value="<?php echo $settings['notification_text2']; ?>" style="border-radius: 5px;border: 1px solid #bdc3c7;">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <h4 style="color: #27ae60;border-bottom: 2px solid #2ecc71;padding-bottom: 10px;">Başarılı Sayfası Yazıları</h4>
                                        <div class="form-group">
                                            <label style="color: #34495e;">Başarılı Yazısı 1</label>
                                            <input type="text" class="form-control" name="success_text1" value="<?php echo $settings['success_text1']; ?>" style="border-radius: 5px;border: 1px solid #bdc3c7;">
                                        </div>

                                        <div class="form-group">
                                            <label style="color: #34495e;">Başarılı Yazısı 2</label>
                                            <input type="text" class="form-control" name="success_text2" value="<?php echo $settings['success_text2']; ?>" style="border-radius: 5px;border: 1px solid #bdc3c7;">
                                        </div>
                                    </div>
                                </div>

                                <button type="submit" name="save" class="btn btn-primary" style="background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);border: none;box-shadow: 0 4px 6px rgba(0,0,0,0.1);"><i class="fas fa-save"></i> Kaydet</button>
                            </form>
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