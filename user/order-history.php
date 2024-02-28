<?php
require("../admin/config/config.php");
session_start();
?>

<?php include 'header.php' ?>

<body>
    <!-- top-header-->
    <?php include 'navbar.php' ?>
    <div class="space-medium">
        <div class="container">


            <div class="row">

                <div class="col-12">
                    <div class="box">
                        <div class="box-head">
                            <h3 class="head-title">Đơn hàng của tôi</h3>
                        </div>
                        <!-- cart-table-section -->
                        <div class="box-body">
                            <div class="table-responsive">
                                <div class="cart">
                                    <table class="table table-bordered ">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Ngày đặt</th>
                                                <th>
                                                    Mã Đơn Hàng
                                                </th>
                                                <th>Email</th>
                                                <th>Số điện thoại</th>
                                                <th>Địa chỉ</th>
                                                <th>Tình trạng</th>
                                            </tr>
                                        </thead>
                                        <?php
                                        $sql_danhsach = "SELECT * FROM hoadon,nguoidung WHERE hoadon.MaND = nguoidung.MaND AND nguoidung.MaND = '". $_SESSION['MaND'] ."' ORDER BY hoadon.MaHD DESC";
                                        $result = mysqli_query($mysqli, $sql_danhsach);
                                        $i = 1;
                                        if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_array($result)) {
                                            ?>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <?php echo $i++; ?>
                                                    </td>
                                                    <td><a href="vieworders.php?code=<?php echo $row['CodeDH']; ?>">
                                                            <?php echo $row['NgayLap']; ?>
                                                        </a>
                                                    </td>
                                                    <td><a href="vieworders.php?code=<?php echo $row['CodeDH']; ?>">
                                                            <?php echo $row['CodeDH']; ?>
                                                        </a></td>
                                                    <td><a href="vieworders.php?code=<?php echo $row['CodeDH']; ?>">
                                                            <?php echo $row['Email']; ?>
                                                        </a></td>
                                                    <td><a href="vieworders.php?code=<?php echo $row['CodeDH']; ?>">
                                                            <?php echo $row['NgayLap']; ?>
                                                        </a></td>
                                                    <td><a href="vieworders.php?code=<?php echo $row['CodeDH']; ?>">
                                                            <?php echo $row['DiaChiHD']; ?>
                                                        </a></td>
                                                    <td><a href="vieworders.php?code=<?php echo $row['CodeDH']; ?>">
                                                            <?php if ($row['TrangThai'] == 0) {
                                                                echo 'Đang xử lý';
                                                            } else {
                                                                echo 'Đang giao';
                                                            } ?>
                                                        </a></td>
                                            </tbody>
                                        <?php }
                                        } else{
                                            echo '<td  colspan="8"><h2 class="text-center">Bạn chưa có đơn hàng nào !</h2></td>';
                                        } ?>

                                    </table>


                                </div> <!-- cart -->
                            </div> <!-- /.table-responsive-->
                        </div><!-- /.cart-table-section -->
                    </div>
                </div>
                <!-- cart-total -->

            </div>

        </div>
        <!-- footer -->
        <?php include 'footer.php' ?>


</body>

</html>