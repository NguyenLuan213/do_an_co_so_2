-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 05, 2024 lúc 07:52 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dacs2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `CodeDH` varchar(18) NOT NULL,
  `MaSP` int(11) NOT NULL,
  `SoLuongMua` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`CodeDH`, `MaSP`, `SoLuongMua`) VALUES
('DH-05AA96EF', 1, 2),
('DH-06D6E900', 1, 1),
('DH-08FC85CA', 1, 4),
('DH-0B4DAF65', 21, 2),
('DH-0F60FA31', 1, 2),
('DH-0F60FA31', 2, 1),
('DH-0F60FA31', 4, 1),
('DH-0F60FA31', 17, 3),
('DH-100B6FF1', 1, 2),
('DH-202678BA', 1, 2),
('DH-51B3F562', 21, 3),
('DH-5377C668', 21, 1),
('DH-54A1DC05', 21, 2),
('DH-57C695A0', 21, 2),
('DH-A198CA31', 2, 2),
('DH-A8041E30', 19, 1),
('DH-A8041E30', 21, 2),
('DH-AA39553E', 21, 2),
('DH-C2C7065C', 7, 2),
('DH-C2C7065C', 10, 3),
('DH-C52C4166', 21, 3),
('DH-C8172F7D', 20, 2),
('DH-CBDE6DC6', 19, 1),
('DH-CBDE6DC6', 20, 1),
('DH-CBDE6DC6', 21, 2),
('DH-E9A67057', 1, 1),
('DH-ECA682F6', 1, 1),
('DH-ED545DC5', 1, 1),
('DH-F2DA309F', 21, 2),
('DH-F5A2B704', 1, 1),
('DH-F68F035A', 20, 1),
('DH-F68F035A', 21, 2),
('DH-F944E49F', 19, 1),
('DH-FC05058D', 1, 1),
('DH-FC59DB13', 2, 1),
('DH-FC59DB13', 6, 1),
('DH-FC59DB13', 7, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

CREATE TABLE `danhgia` (
  `MaDG` int(11) NOT NULL,
  `MaND` int(11) DEFAULT NULL,
  `MaSP` int(11) DEFAULT NULL,
  `Diem` int(11) DEFAULT NULL,
  `NhanXet` varchar(255) DEFAULT NULL,
  `NgayDanhGia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhgia`
--

INSERT INTO `danhgia` (`MaDG`, `MaND`, `MaSP`, `Diem`, `NhanXet`, `NgayDanhGia`) VALUES
(93, 1, 1, 5, 'Tốt', '2023-11-21'),
(94, 1, 1, 5, 'Được', '2023-11-21'),
(95, 1, 1, 3, 'ok lắm', '2023-11-21'),
(96, 1, 1, 0, 'Được lắm', '2023-11-21'),
(97, 1, 1, 3, 'Mọi người nên mua', '2023-11-21'),
(98, 1, 1, 5, 'Được lắm nha ae', '2023-11-21'),
(99, 1, 1, 5, 'Ổn so với giá', '2023-11-21'),
(100, 1, 1, 2, 'Rẻ hơn chỗ khác', '2023-11-21'),
(102, 1, 14, 3, 'Tệ lắm', '2023-11-21'),
(105, 1, 2, 5, 'Tuyệt vọng', '2023-11-24'),
(106, 1, 21, 5, 'Quá được', '2023-12-01'),
(107, 1, 21, 5, 'Xấu', '2023-12-01'),
(108, 1, 21, 3, 'Quá ổn', '2023-12-01'),
(113, 3, 1, 2, 'Tốt lắm nha', '2023-12-14'),
(114, 6, 1, 5, 'Rất ổn', '2023-12-14'),
(115, 6, 1, 2, 'Mọi người nên mua', '2023-12-14'),
(117, 3, 1, 4, 'Quá tốt', '2023-12-14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHD` int(11) NOT NULL,
  `CodeDH` varchar(18) NOT NULL,
  `DiaChiHD` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TrangThai` int(11) NOT NULL,
  `NgayLap` date DEFAULT NULL,
  `MaND` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MaHD`, `CodeDH`, `DiaChiHD`, `TrangThai`, `NgayLap`, `MaND`) VALUES
(1, 'DH-C2C7065C', 'Đường Nguyễn Văn Công, Quận Gò Vấp, Thành phố Hồ Chí Minh1', 1, '2023-12-09', 3),
(4, 'DH-E9A67057', '5 Đường Tô Hiến Thành, Phường 14, Quận 10, Thành phố Hồ Chí Minh1', 0, '2023-12-12', 3),
(5, 'DH-ECA682F6', ' Đại lộ Bình Dương, Thị Xã Thủ Dầu Một, Bình Dương', 0, '2023-12-12', 3),
(6, 'DH-ED545DC5', '384 Đường Huỳnh Văn Bánh, Phường 14, Quận Phú Nhuận, Thành phố Hồ Chí Minh', 0, '2023-12-12', 3),
(7, 'DH-F5A2B704', ' Ấp Tân Phước Khánh, Huyện Tân Uyên, Bình Dương', 1, '2023-12-12', 3),
(8, 'DH-FC05058D', '243 Đường Nguyễn Văn Cừ, Thị xã Bắc Giang, Bắc Giang', 0, '2023-12-12', 3),
(9, 'DH-06D6E900', ' Phường Thọ Quang, quận Sơn Trà, TP. Đà Nẵng', 1, '2023-12-12', 3),
(10, 'DH-08FC85CA', 'Núi Thủy Sơn, phường Hòa Hải, quận Ngũ Hành Sơn, TP. Đà Nẵng', 1, '2023-12-12', 3),
(11, 'DH-100B6FF1', 'đường Lê Văn Lương, phường Thọ Quang, quận Sơn Trà, TP. Đà Nẵng', 1, '2023-12-12', 3),
(12, 'DH-202678BA', 'quận Sơn Trà, TP. Đà Nẵng', 0, '2023-12-12', 3),
(13, 'DH-A198CA31', 'Nguyễn Hữu An, Nại Hiên Đông, Sơn Trà, Đà Nẵng', 0, '2023-12-13', 1),
(14, 'DH-05AA96EF', 'Phan Đăng Lưu, Hòa Cường Bắc, Hải Châu, Đà Nẵng', 0, '2023-12-13', 3),
(15, 'DH-0F60FA31', 'Phan Đăng Lưu, Hòa Cường Bắc, Hải Châu, Đà Nẵng', 0, '2023-12-13', 3),
(16, 'DH-0B4DAF65', 'Phan Đăng Lưu, Hòa Cường Bắc, Hải Châu, Đà Nẵng', 0, '2023-12-13', 3),
(17, 'DH-FC59DB13', 'Nguyễn Hữu An, Nại Hiên Đông, Sơn Trà, Đà Nẵng', 0, '2023-12-13', 1),
(18, 'DH-C52C4166', 'Cổng trường Việt Hàn', 0, '2024-01-05', 7),
(19, 'DH-C8172F7D', 'Cổng trường Việt Hàn', 0, '2024-01-05', 7),
(20, 'DH-CBDE6DC6', 'Hà Nội', 0, '2024-01-05', 7),
(21, 'DH-D88C216A', 'Xuân Vinh', 0, '2024-01-05', 7),
(22, 'DH-DD661E8D', 'Xuân Vinh', 0, '2024-01-05', 7),
(23, 'DH-0E9D4713', 'Hải Châu, Đà Nẵng', 0, '2024-01-05', 7),
(24, 'DH-156128CF', 'Hải Châu 1, Đà Nẵng', 0, '2024-01-05', 7),
(25, 'DH-23A3793B', 'Hòa Hải, Ngũ Hành Sơn', 0, '2024-01-05', 7),
(26, 'DH-51B3F562', 'Hòa Phước', 0, '2024-01-05', 7),
(27, 'DH-5377C668', 'Hòa Phước 1', 0, '2024-01-05', 7),
(28, 'DH-54A1DC05', 'Hòa Phước 2', 0, '2024-01-05', 7),
(29, 'DH-57C695A0', 'Hòa Phước 3', 1, '2024-01-05', 7),
(30, 'DH-A8041E30', 'Đà Nẵng', 0, '2024-01-05', 7),
(31, 'DH-AA39553E', 'Sài Gòn', 0, '2024-01-05', 7),
(32, 'DH-F2DA309F', 'Xuân Lộc', 0, '2024-01-06', 8),
(33, 'DH-F68F035A', 'Xuân Nam', 0, '2024-01-06', 8),
(34, 'DH-F944E49F', 'Xuân Nghị', 1, '2024-01-06', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `MaMenu` int(11) NOT NULL,
  `TenMenu` varchar(255) DEFAULT NULL,
  `ThuTu` int(11) NOT NULL,
  `Link` varchar(100) DEFAULT NULL,
  `MaQuyen` int(11) DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `menu`
--

INSERT INTO `menu` (`MaMenu`, `TenMenu`, `ThuTu`, `Link`, `MaQuyen`) VALUES
(1, 'Trang chủ', 1, 'index.php', 1),
(2, 'Điện thoại', 2, 'product-list.php', 1),
(3, 'Laptop', 3, 'product-list.php', 1),
(4, 'Phụ Kiện', 4, 'contact.php', 1),
(5, 'Ưu đãi', 4, 'contact.php', 1),
(6, 'Tin công nghệ', 6, 'contact.php', 1),
(7, 'Liên Hệ', 7, 'contact.php', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `MaND` int(11) NOT NULL,
  `TenND` varchar(255) DEFAULT NULL,
  `MatKhau` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `SDT` varchar(15) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `MaQuyen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`MaND`, `TenND`, `MatKhau`, `Email`, `SDT`, `DiaChi`, `MaQuyen`) VALUES
(1, 'Nguyễn Luân', 'faa13f22d1e183a2526f79f55d01bb0a', 'luan2132004@gmail.com', '0905481608', 'Sài Gòn', 1),
(2, 'Khánh Trang', '202cb962ac59075b964b07152d234b70', 'trang@gmail.com', '0367102804', 'Quảng Nam', 2),
(3, 'Nguyễn Thanh Châu', '202cb962ac59075b964b07152d234b70', 'chau12321@gmail.com', '0905441167', 'Hà Nội', 2),
(6, 'Nguyễn Nam', '202cb962ac59075b964b07152d234b70', 'nam12321@gmail.com', '0903411351', 'Xuân Nam', 2),
(7, 'Hải Ngân', '202cb962ac59075b964b07152d234b70', 'ngan@gmail.com', '0218931185', 'Quảng Nam', 2),
(8, 'Nguyễn Bảo', '202cb962ac59075b964b07152d234b70', 'bao@gmail.com', '0311931185', 'Quảng Nam', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phanquyen`
--

CREATE TABLE `phanquyen` (
  `MaQuyen` int(11) NOT NULL,
  `TenQuyen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phanquyen`
--

INSERT INTO `phanquyen` (`MaQuyen`, `TenQuyen`) VALUES
(1, 'Quản Trị Viên'),
(2, 'Người Dùng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int(11) NOT NULL,
  `TenSP` varchar(255) DEFAULT NULL,
  `Gia` decimal(10,2) DEFAULT NULL,
  `GiaHienTai` decimal(10,2) DEFAULT NULL,
  `HinhAnh` varchar(255) DEFAULT NULL,
  `HinhAnhPhu1` varchar(200) NOT NULL,
  `HinhAnhPhu2` varchar(200) NOT NULL,
  `MoTa` text DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `MaTH` int(11) DEFAULT NULL,
  `BoNho` varchar(20) DEFAULT NULL,
  `Mau` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `TenSP`, `Gia`, `GiaHienTai`, `HinhAnh`, `HinhAnhPhu1`, `HinhAnhPhu2`, `MoTa`, `SoLuong`, `MaTH`, `BoNho`, `Mau`) VALUES
(1, 'iPhone 15 Pro Max', 34990000.00, 34490000.00, 'iphone (4).jpg', '', '', 'Màn hình Retina XDR 6.7\", Chip A17 Pro Bionic, Bộ nhớ trong 256GB, Ram 8GB', 16, 1, '128 GB', 'Black'),
(2, 'IPhone 15 Pro', 28990000.00, 28490000.00, 'iphone (4).jpg', '', '', 'Màn hình	6.7 inch OLED, Camera sau	48.0 MP + 12.0 MP + 12.0 MP, RAM 8 GB, CPU Apple A17 Pro', 26, 1, '128 GB', 'Titan tự nhiên'),
(3, 'IPhone 15 Plus', 25990000.00, 25490000.00, 'iphone (5).jpg', '', '', 'Màn hình	6.1 inch OLED, Camera sau 48.0 MP + 12.0 MP, RAM	6 GB, CPU Apple A16 Bionic', 30, 1, '512 GB', 'Yellow'),
(4, 'IPhone 15', 22590000.00, 22490000.00, 'iphone (5).jpg', '', '', 'Màn hình	6.1 inch OLED, Camera sau 48.0 MP + 12.0 MP, RAM	6 GB, CPU Apple A16 Bionic', 30, 1, '128 GB', 'Yellow'),
(5, 'iPhone 15 Pro Max', 34990000.00, 34490000.00, 'iphone (4).jpg', '', '', 'Màn hình	6.7 inch OLED, Camera sau	48.0 MP + 12.0 MP + 12.0 MP, RAM 8 GB, CPU Apple A17 Pro', 30, 1, '128 GB', 'Titan trắng'),
(6, 'IPhone 15 Pro', 28990000.00, 28490000.00, 'iphone (4).jpg', '', '', 'Màn hình	6.7 inch OLED, Camera sau	48.0 MP + 12.0 MP + 12.0 MP, RAM 8 GB, CPU Apple A17 Pro', 29, 1, '128 GB', 'Titan trắng'),
(7, 'IPhone 15 Plus', 25990000.00, 25490000.00, 'iphone (5).jpg', '', '', 'Màn hình	6.1 inch OLED, Camera sau 48.0 MP + 12.0 MP, RAM	6 GB, CPU Apple A16 Bionic', 30, 1, '128 GB', 'Pink'),
(8, 'IPhone 15', 22590000.00, 22490000.00, 'iphone (5).jpg', '', '', 'Màn hình	6.1 inch OLED, Camera sau 48.0 MP + 12.0 MP, RAM	6 GB, CPU Apple A16 Bionic', 30, 1, '128 GB', 'Pink'),
(9, 'iPhone 15 Pro Max', 34990000.00, 34490000.00, 'iphone (4).jpg', '', '', 'Màn hình	6.7 inch OLED, Camera sau	48.0 MP + 12.0 MP + 12.0 MP, RAM 8 GB, CPU Apple A17 Pro', 30, 1, '128 GB', 'Titan xanh'),
(10, 'IPhone 15 Pro', 28990000.00, 28490000.00, 'iphone (4).jpg', '', '', 'Màn hình	6.7 inch OLED, Camera sau	48.0 MP + 12.0 MP + 12.0 MP, RAM 8 GB, CPU Apple A17 Pro', 30, 1, '128 GB', 'Titan xanh'),
(11, 'IPhone 15 Plus', 25990000.00, 25490000.00, 'iphone (5).jpg', '', '', 'Màn hình	6.1 inch OLED, Camera sau 48.0 MP + 12.0 MP, RAM	6 GB, CPU Apple A16 Bionic', 30, 1, '512 GB', 'White'),
(12, 'IPhone 15', 22590000.00, 22490000.00, 'iphone (5).jpg', '', '', 'Màn hình	6.1 inch OLED, Camera sau 48.0 MP + 12.0 MP, RAM	6 GB, CPU Apple A16 Bionic', 30, 1, '128 GB', 'White'),
(13, 'iPhone 15 Pro Max', 34990000.00, 34490000.00, 'iphone (4).jpg', '', '', 'Màn hình	6.7 inch OLED, Camera sau	48.0 MP + 12.0 MP + 12.0 MP, RAM 8 GB, CPU Apple A17 Pro', 30, 1, '128 GB', 'Titan đen'),
(14, 'IPhone 15 Pro', 28990000.00, 28490000.00, 'iphone (4).jpg', '', '', 'Màn hình	6.7 inch OLED, Camera sau	48.0 MP + 12.0 MP + 12.0 MP, RAM 8 GB, CPU Apple A17 Pro', 30, 1, '128 GB', 'Titan đen'),
(15, 'IPhone 15 Plus', 25990000.00, 25490000.00, 'iphone (5).jpg', '', '', 'Màn hình	6.1 inch OLED, Camera sau 48.0 MP + 12.0 MP, RAM	6 GB, CPU Apple A16 Bionic', 30, 1, '128 GB', 'Black'),
(16, 'IPhone 15', 22590000.00, 22490000.00, 'iphone (5).jpg', '', '', 'Màn hình	6.1 inch OLED, Camera sau 48.0 MP + 12.0 MP, RAM	6 GB, CPU Apple A16 Bionic', 30, 1, '128 GB', 'Black'),
(17, 'SamSung Galaxy S22', 21990000.00, 11990000.00, 'samsung (6).jpg', '', '', 'Màn hình	6.1 inch  Dynamic AMOLED 2X, Camera sau 50.0 MP + 12.0 MP + 10.0 MP, RAM 8 GB, CPU	Snapdragon 8 Gen 1', 27, 2, '128 GB', 'Trắng'),
(18, 'Xiaomi Redmi Note 12 4GB', 4890000.00, 3890000.00, 'xiaomi (4).jpg', '', '', 'Màn hình	6.55 inch AMOLED, Camera sau  50.0 MP + 8.0 MP + 2.0 MP, RAM  8 GB, CPU Snapdragon 7 Gen 1', 20, 4, '128 GB', 'Đen'),
(19, 'Oppo Reno8 T 4G', 8490000.00, 7190000.00, 'oppo.jpg', '', '', 'Màn hình	6.4 inch AMOLED, Camera sau	100.0 MP + 2.0 MP + 2.0 MP, RAM 8 GB, CPU	MediaTek Helio G99', 25, 3, '256 GB', 'Đen'),
(20, 'Samsung Galaxy Z Flip4 5G', 11990000.00, 12990000.00, 'samsung (2).jpg', '', '', 'Màn hình	6.7 inch 19 inch, Camera sau 12.0 MP + 12.0 MP, RAM 8 GB, CPU Snapdragon 8+ Gen 1', 15, 2, '128 GB', 'Xám'),
(21, 'Xiaomi 13 Lite 8GB', 10690000.00, 7690000.00, 'xiaomi (2).jpg', '', '', 'Màn hình	6.55 inch AMOLED, Camera sau  50.0 MP + 8.0 MP + 2.0 MP, RAM  8 GB, CPU Snapdragon 7 Gen 1', 7, 4, '128 GB', 'Đen');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `Id` int(11) NOT NULL,
  `HinhAnh` varchar(255) DEFAULT NULL,
  `Video` varchar(255) NOT NULL,
  `MaSP` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`Id`, `HinhAnh`, `Video`, `MaSP`) VALUES
(1, 'iphone (6).jpg', 'iphone.mp4', 1),
(2, 'samsung (8).jpg', 'samsung.mp4', 20),
(4, 'xiaomi.png', 'xiaomi.mp4', 21),
(6, 'oppo.png', 'oppo.mp4', 19);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuonghieu`
--

CREATE TABLE `thuonghieu` (
  `MaTH` int(11) NOT NULL,
  `TenTH` varchar(255) DEFAULT NULL,
  `LogoTH` varchar(255) NOT NULL,
  `ThuTu` int(11) NOT NULL,
  `MaMenu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thuonghieu`
--

INSERT INTO `thuonghieu` (`MaTH`, `TenTH`, `LogoTH`, `ThuTu`, `MaMenu`) VALUES
(1, 'Iphone', 'iphone.png', 1, 2),
(2, 'Samsung', 'samsung (9).jpg', 2, 2),
(3, 'Oppo', 'oppo (4).png', 3, 2),
(4, 'Xiaomi', 'mi_logo.png', 4, 2),
(5, 'Dell', '', 5, 3),
(6, 'Lenovo ', '11-55-34_12-December-2023Screenshot 2023-11-19 234236.png', 6, 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`CodeDH`,`MaSP`),
  ADD KEY `MaSP` (`MaSP`),
  ADD KEY `CodeDH` (`CodeDH`);

--
-- Chỉ mục cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD PRIMARY KEY (`MaDG`),
  ADD KEY `MaND` (`MaND`),
  ADD KEY `MaSP` (`MaSP`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MaHD`),
  ADD UNIQUE KEY `unique_CodeDH` (`CodeDH`),
  ADD KEY `MaND` (`MaND`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`MaMenu`),
  ADD KEY `MaQuyen` (`MaQuyen`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`MaND`),
  ADD KEY `MaQuyen` (`MaQuyen`);

--
-- Chỉ mục cho bảng `phanquyen`
--
ALTER TABLE `phanquyen`
  ADD PRIMARY KEY (`MaQuyen`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`),
  ADD KEY `MaTH` (`MaTH`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `MaSP` (`MaSP`);

--
-- Chỉ mục cho bảng `thuonghieu`
--
ALTER TABLE `thuonghieu`
  ADD PRIMARY KEY (`MaTH`),
  ADD KEY `MaMenu` (`MaMenu`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  MODIFY `MaDG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `MaHD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `MaMenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `MaND` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `phanquyen`
--
ALTER TABLE `phanquyen`
  MODIFY `MaQuyen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `thuonghieu`
--
ALTER TABLE `thuonghieu`
  MODIFY `MaTH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`),
  ADD CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`CodeDH`) REFERENCES `hoadon` (`CodeDH`);

--
-- Các ràng buộc cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `danhgia_ibfk_1` FOREIGN KEY (`MaND`) REFERENCES `nguoidung` (`MaND`),
  ADD CONSTRAINT `danhgia_ibfk_2` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MaND`) REFERENCES `nguoidung` (`MaND`);

--
-- Các ràng buộc cho bảng `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`MaQuyen`) REFERENCES `phanquyen` (`MaQuyen`);

--
-- Các ràng buộc cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD CONSTRAINT `nguoidung_ibfk_1` FOREIGN KEY (`MaQuyen`) REFERENCES `phanquyen` (`MaQuyen`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`MaTH`) REFERENCES `thuonghieu` (`MaTH`);

--
-- Các ràng buộc cho bảng `slider`
--
ALTER TABLE `slider`
  ADD CONSTRAINT `slider_ibfk_1` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`);

--
-- Các ràng buộc cho bảng `thuonghieu`
--
ALTER TABLE `thuonghieu`
  ADD CONSTRAINT `thuonghieu_ibfk_1` FOREIGN KEY (`MaMenu`) REFERENCES `menu` (`MaMenu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
