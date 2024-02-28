<?php
require_once("../admin/config/config.php");
ob_start();
session_start();
?>
<?php if (!isset($_SESSION['MaND'])) {
    header("Location: ./login-form.php");
    exit();
} ?>
<?php
$mysqli->query("SELECT DATE_FORMAT(CONVERT_TZ(NgayLap, '+00:00', '+07:00'), '%d/%m/%Y') as formatted_date FROM HoaDon");
date_default_timezone_set('Asia/Ho_Chi_Minh');
$strTime = strftime("%H-%M-%S_%d-%B-%Y", time());

$MaND = $_SESSION['MaND'];
$codedh = 'DH-' . strtoupper(substr(uniqid(), -8));
$Email = $_SESSION['Email'];
$TenND = $_SESSION['TenND'];
$SDT = $_SESSION['SDT'];
$DiaChiHD = isset($_POST['DiaChiHD']) ? $_POST['DiaChiHD'] : '';

if (isset($_POST['order'])) {
    $soluong = isset($_POST['quantity']) ? $_POST['quantity'] : 1;
    $masp = isset($_GET['idsp']) ? $_GET['idsp'] : $_POST['idsp'];
    $sql_update_hoadon = "INSERT INTO hoadon (CodeDH, NgayLap, MaND, DiaChiHD) VALUES ('$codedh', NOW(), '$MaND', '$DiaChiHD' )";
    $mysqli->query($sql_update_hoadon);
    $sql_update_cthoadon = "INSERT INTO chitiethoadon (MaSP,CodeDH,SoLuongMua) VALUES ($masp,'$codedh', $soluong)";
    $mysqli->query($sql_update_cthoadon);
    $sql_update_soluongsp = "UPDATE sanpham SET SoLuong = SoLuong - $soluong WHERE MaSP = '" . $masp . "' ";
    $mysqli->query($sql_update_soluongsp);
    header('Location: confirm.php');
}
if (isset($_POST['AllPayOrders'])) {

    $sql_update_hoadon = "INSERT INTO hoadon (CodeDH, NgayLap, MaND, DiaChiHD) VALUES ('$codedh', NOW(), '$MaND','$DiaChiHD' )";
    $mysqli->query($sql_update_hoadon);
    foreach ($_SESSION['giohang'] as $key => $value) {
        $idsp = $value['MaSP'];
        $tensp = $value['TenSP'];
        $giahientai = $value['GiaHienTai'];
        $soluongsp = $value['soluongsp'];

        $sql_update_cthoadon = "INSERT INTO chitiethoadon (MaSP,CodeDH,SoLuongMua) VALUES ($idsp,'$codedh', $soluongsp)";
        $mysqli->query($sql_update_cthoadon);
        $sql_update_soluongsp = "UPDATE sanpham SET SoLuong = SoLuong - $soluongsp WHERE MaSP = '" . $idsp . "' ";
        $mysqli->query($sql_update_soluongsp);

    }
    unset($_SESSION["giohang"]);
    header('Location: confirm.php');
}
?>
<?php include 'header.php'; ?>

<body>
    <!-- top-header-->
    <?php include "navbar.php"; ?>

    <div class="space-medium">
        <div class="container">
            <form name="formorder" id="ffi" method="POST" action="">

                <div class="row">
                    <div class="col-12">
                        <?php
                        if (isset($_GET['idsp']) || isset($_POST['idsp'])) {
                            $idsp = isset($_GET['idsp']) ? $_GET['idsp'] : (isset($_POST['idsp']) ? $_POST['idsp'] : '');
                            $sql = "SELECT * FROM sanpham WHERE MaSP =" . $idsp;
                            $result = mysqli_query($mysqli, $sql);
                            $row = mysqli_fetch_assoc($result);
                            $_SESSION['GiaHienTai'] = $row['GiaHienTai'];

                            echo '<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                    <div class="box-head">
                                        <h3 class="head-title">Chi tiết đơn hàng</h3>
                                    </div>
                                    <!-- cart-table-section -->
                                    <div class="box-body">
                                        <div class="table-responsive">
                                            <div class="cart">
                                                <table class="table table-bordered ">
                                                    <thead>
                                                        <tr>
                                                            <th><span>Sản Phẩm</span></th>
                                                            <th></th>
                                                            <th><span>Giá</span></th>
                                                            <th><span>Số Lượng</span></th>                                                        </tr>
                                                    </thead>';
                            echo '<tbody>
                                                        <tr>
                                                            <td>
                                                                <a><img src="../admin/modules/quanlysanpham/img/' . $row['HinhAnh'] . '" alt="' . $row['HinhAnh'] . '"></a>
                                                                <input type="hidden" name="idsp" value=" ' . $row['MaSP'] . ' ">
                                                            </td>
                                                            <td>
                                                                <div class="name_thumb-img"><a href="product-single.php?idsp=' . $row['MaSP'] . '">' . $row['TenSP'] . '</a></div>
                                                            </td>
                                                            <td class="text-nowrap">' . number_format($row['GiaHienTai'], 0, '', '.') . ' ₫</td>
                                                            <td>
                                                            <input type="number" class="input-text qty text buy-quantity" step="1" min="1" max="6" name="quantity" id="quantity" value="' . (isset($_POST['quantity']) ? $_POST['quantity'] : 1) . '" title="Qty" size="4" pattern="[0-9]*">
                                                            </td>
                                                    </tbody>';
                            echo '</table>';
                            echo '</div>';
                            echo '</div>';
                            echo '</div>';
                        } else {
                            echo '<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                    <div class="box-head">
                                        <h3 class="head-title">Chi tiết đơn hàng</h3>
                                    </div>
                                    <!-- cart-table-section -->
                                    <div class="box-body">
                                        <div class="table-responsive">
                                            <div class="cart">
                                                <table class="table table-bordered ">
                                                    <thead>
                                                        <tr>
                                                            <th><span>Sản Phẩm</span></th>
                                                            <th></th>
                                                            <th><span>Giá</span></th>
                                                            <th><span>Số Lượng</span></th>
                                                            <th><span>Tổng Cộng</span></th>
                                                        </tr>
                                                    </thead>';
                            foreach ($_SESSION['giohang'] as $sanpham) {
                                $hinh_san_pham = $sanpham["HinhAnh"];
                                echo '<tbody>
                                                    <tr>
                                                        <td><a href="product-single.php?idsp=' . $sanpham['MaSP'] . '" class="thumb-img"><img src="../admin/modules/quanlysanpham/img/' . $sanpham["HinhAnh"] . '" alt="' . $sanpham["HinhAnh"] . '"></a>
                                                        </td>
                                                        <td>                                                    <div class="name_thumb-img"><a href="product-single.php?idsp=' . $sanpham['MaSP'] . '">' . $sanpham["TenSP"] . '</a></div>
                                                        </td>
                                                        <td class="text-nowrap">' . number_format($sanpham['GiaHienTai'], 0, '', '.') . ' ₫</td>
                                                        <td>
                                                     
                                                            <div class="product-quantity">
                                                                <div class="quantity text-nowrap">
                                                                <input class="input-text qty text" min="1" max="6" name="quantity" title="Số lượng" size="4" pattern="[0-9]*" 
                                                                value="' . $sanpham['soluongsp'] . '" id="soluong_' . $sanpham['soluongsp'] . '" readonly>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="text-nowrap">' . number_format($sanpham['GiaHienTai'] * $sanpham['soluongsp'], 0, '', '.') . ' ₫</td>
                                                </tbody>';
                            }
                            echo '</table>';
                            echo '</div>';
                            echo '</div>';
                            echo '</div>';
                        }
                        ?>
                    </div>

                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">Thông tin khách hàng</div>
                            <div class="panel-body">
                                <div>
                                    <div class="form-group">
                                        <label for="tenKhachHang">Tên khách hàng:</label>
                                        <input type="text" class="form-control" id="tenKhachHang"
                                            value="<?php echo $_SESSION['TenND']; ?>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="dienThoai">Điện thoại:</label>
                                        <input type="text" class="form-control" id="dienThoai"
                                            value="<?php echo $_SESSION['SDT']; ?>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <input type="text" class="form-control" id="email"
                                            value="<?php echo $_SESSION['Email']; ?>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="diaChi">Địa chỉ giao hàng:</label>
                                        <textarea rows="4" class="form-control" id="DiaChiHD"
                                            placeholder="Nhập địa chỉ giao hàng" name="DiaChiHD" required></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php if (isset($_GET['idsp']) || isset($_POST['idsp'])) {
                            echo '<button class="btn btn-primary btn-block" name="order">Đặt hàng</button>';
                        } else {
                            echo '<button class="btn btn-primary btn-block" name="AllPayOrders">Đặt hàng</button>';
                        }
                        ?>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- /.cart-section -->
    <!-- footer -->
    <?php include "footer.php"; ?>
    <!-- /.footer -->
</body>
<script>
    // Xử lý sự kiện tăng giảm số lượng
    $(document).ready(function () {
        $('.buy-quantity').on('change', function () {
            var quantity = $(this).val();
            var price = <?php echo $row['GiaHienTai']; ?>;
            var total = quantity * price;
            $('#total-cart-price').text(total.toLocaleString('vi-VN') + ' ₫');
        });
    });

</script>


</html>