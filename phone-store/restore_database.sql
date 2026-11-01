-- Script khôi phục toàn bộ cơ sở dữ liệu phone_store về trạng thái đầy đủ ban đầu
DROP DATABASE IF EXISTS phone_store;
CREATE DATABASE phone_store CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE phone_store;

-- 1. Bảng Admin (Tài khoản & mật khẩu admin)
CREATE TABLE Admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

INSERT INTO Admin (username, password) VALUES
('admin1', 'Admin@123'),
('admin2', 'Admin@123'),
('manager_tuan', 'Tuan@2026'),
('hoang_admin', 'Hoang#99'),
('lan_ketoan', 'Lan$456'),
('admin_ha', 'Ha!789'),
('super_admin', 'Super$2026'),
('sys_mod', 'Mod!2026'),
('support_nam', 'Nam@456'),
('director_minh', 'Minh#123'),
('admin_tech', 'Tech$888'),
('dung_ops', 'Dung%123'),
('vy_admin', 'Vyvy@789'),
('admin_sales', 'Sale$123'),
('cuong_audit', 'Cuong!55'),
('admin_hr', 'Hrdept@1'),
('linh_support', 'Linh#999'),
('root_user', 'Root*777'),
('admin_backup', 'Bak@2026'),
('test_admin', 'Test!123');

-- 2. Bảng Product (Sản phẩm)
CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    price DECIMAL(12,2) NOT NULL,
    stock INT NOT NULL,
    image VARCHAR(255) NOT NULL,
    is_deleted BIT(1) DEFAULT b'0'
);

INSERT INTO product (name, brand, price, stock, image, is_deleted) VALUES
('Điện thoại iPhone 15', 'Apple', 22000000.00, 50, 'iphone15.jpg', b'0'),
('Điện thoại iPhone 15 Pro', 'Apple', 28000000.00, 30, 'iphone15pro.jpg', b'0'),
('Điện thoại Samsung S24', 'Samsung', 20000000.00, 45, 'samsung_s24.jpg', b'0'),
('Điện thoại Samsung Ultra', 'Samsung', 26000000.00, 25, 'samsung_ultra.jpg', b'0'),
('Tai nghe AirPods Pro', 'Apple', 5500000.00, 100, 'airpods_pro.jpg', b'0'),
('Tai nghe Galaxy Buds 2', 'Samsung', 3000000.00, 80, 'galaxy_buds2.jpg', b'0'),
('Laptop MacBook Air M3', 'Apple', 27000000.00, 15, 'macbook_air_m3.jpg', b'0'),
('Laptop Dell XPS 13', 'Dell', 32000000.00, 10, 'dell_xps13.jpg', b'0'),
('Laptop Asus Zenbook', 'Asus', 21500000.00, 20, 'asus_zenbook.jpg', b'0'),
('Chuột Logitech MX Master 3S', 'Logitech', 2500000.00, 60, 'mx_master3s.jpg', b'0'),
('Bàn phím cơ Keychron K2', 'Keychron', 1800000.00, 40, 'keychron_k2.jpg', b'0'),
('Màn hình LG Dell 27 inch', 'LG', 4500000.00, 25, 'lg_27inch.jpg', b'0'),
('Sạc dự phòng Anker 20000mAh', 'Anker', 850000.00, 150, 'anker_20k.jpg', b'0'),
('Củ sạc nhanh Baseus 65W', 'Baseus', 450000.00, 200, 'baseus_65w.jpg', b'0'),
('Đồng hồ Apple Watch Series 9', 'Apple', 10500000.00, 35, 'apple_watch9.jpg', b'0'),
('Đồng hồ Galaxy Watch 6', 'Samsung', 6500000.00, 40, 'galaxy_watch6.jpg', b'0'),
('Loa Bluetooth JBL Charge 5', 'JBL', 3800000.00, 55, 'jbl_charge5.jpg', b'0'),
('Loa Bluetooth Sony XB100', 'Sony', 1200000.00, 90, 'sony_xb100.jpg', b'0'),
('Balo laptop chống nước', 'Tigernu', 650000.00, 120, 'balo_laptop.jpg', b'0'),
('Cáp sạc Type-C to Lightning', 'Ugreen', 150000.00, 300, 'ugreen_cable.jpg', b'1');

-- 3. Bảng Customer (Khách hàng)
CREATE TABLE customer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE NULL,
    address VARCHAR(255) NULL,
    is_deleted BIT(1) DEFAULT b'0'
);

INSERT INTO customer (name, phone, email, address, is_deleted) VALUES
('Nguyễn Văn An', '0901234567', 'an.nguyen@email.com', '123 Đường Lê Lợi, Quận 1, TP.HCM', b'0'),
('Trần Thị Bình', '0912345678', 'binh.tran@email.com', '456 Đường Nguyễn Huệ, Quận 3, TP.HCM', b'0'),
('Lê Hoàng Cường', '0923456789', 'cuong.le@email.com', '789 Đường CMT8, Tân Bình, TP.HCM', b'0'),
('Phạm Minh Đức', '0934567890', 'duc.pham@email.com', '12 Đường Hùng Vương, Ba Đình, Hà Nội', b'1'),
('Hoàng Thu Em', '0945678901', 'em.hoang@email.com', '34 Đường Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', b'0'),
('Ngô Văn Phương', '0956789012', 'phuong.ngo@email.com', '56 Đường Lê Hồng Phong, Hải Phòng', b'0'),
('Đỗ Thị Giang', '0967890123', 'giang.do@email.com', '78 Đường Nguyễn Văn Linh, Đà Nẵng', b'0'),
('Bùi Minh Hải', '0978901234', 'hai.bui@email.com', '90 Đường Hùng Vương, Ninh Kiều, Cần Thơ', b'0'),
('Đặng Thị Inh', '0989012345', NULL, '11 Đường Trần Phú, Nha Trang, Khánh Hòa', b'0'),
('Vũ Hoàng Khanh', '0990123456', 'khanh.vu@email.com', '22 Đường Quang Trung, Vinh, Nghệ An', b'0'),
('Bùi Thị Liên', '0812345678', 'lien.bui@email.com', '33 Đường Lê Duẩn, Quận 1, TP.HCM', b'0'),
('Dương Văn Minh', '0823456789', 'minh.duong@email.com', NULL, b'0'),
('Lý Thị Ngọc', '0834567890', 'ngoc.ly@email.com', '55 Đường Bà Triệu, Hai Bà Trưng, Hà Nội', b'0'),
('Võ Văn Oanh', '0845678901', 'oanh.vo@email.com', '66 Đường Cách Mạng Tháng 8, Cẩm Lệ, Đà Nẵng', b'1'),
('Diệp Tuấn Tú', '0856789012', NULL, NULL, b'0'),
('Quách Hoàng Quân', '0867890123', 'quan.quach@email.com', '88 Đường Nguyễn Trãi, Thanh Xuân, Hà Nội', b'0'),
('Lục Thị Sang', '0878901234', 'sang.luc@email.com', '99 Đường Đồng Khởi, Bến Nghé, TP.HCM', b'0'),
('Tạ Văn Thành', '0888901234', 'thanh.ta@email.com', '101 Đường Nguyễn Chí Thanh, Láng Hạ, Hà Nội', b'0'),
('Cao Thị Uyên', '0898901234', 'uyen.cao@email.com', '202 Đường Hùng Vương, Huế', b'0'),
('Đoàn Minh Vũ', '0708901234', 'vu.doan@email.com', '303 Đường Trần Hưng Đạo, Quy Nhơn, Bình Định', b'0');

-- 4. Bảng Invoice (Hóa đơn)
CREATE TABLE invoice (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT DEFAULT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(12,2) NOT NULL,
    status ENUM('PENDING', 'CONFIRMED', 'SHIPPED', 'COMPLETED', 'CANCELLED') DEFAULT 'PENDING',
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

INSERT INTO invoice (customer_id, created_at, total_amount, status) VALUES
(1, '2026-10-01 08:30:00', 150000.00, 'CONFIRMED'),
(2, '2026-10-01 09:15:00', 450000.00, 'SHIPPED'),
(3, '2026-10-02 10:00:00', 70000.00, 'PENDING'),
(4, '2026-10-02 14:20:00', 1200000.00, 'CONFIRMED'),
(5, '2026-10-03 11:05:00', 320000.00, 'SHIPPED'),
(6, '2026-10-03 16:45:00', 95000.00, 'CANCELLED'),
(7, '2026-10-04 07:50:00', 600000.00, 'CONFIRMED'),
(8, '2026-10-04 13:10:00', 180000.00, 'PENDING'),
(9, '2026-10-05 15:35:00', 250000.00, 'SHIPPED'),
(10, '2026-10-05 18:25:00', 50000.00, 'CONFIRMED'),
(11, '2026-10-06 09:00:00', 850000.00, 'SHIPPED'),
(12, '2026-10-06 12:40:00', 380000.00, 'PENDING'),
(13, '2026-10-07 10:15:00', 1500000.00, 'CONFIRMED'),
(14, '2026-10-07 14:00:00', 290000.00, 'SHIPPED'),
(15, '2026-10-08 11:30:00', 120000.00, 'CANCELLED'),
(16, '2026-10-08 17:10:00', 430000.00, 'CONFIRMED'),
(17, '2026-10-09 08:20:00', 99000.00, 'PENDING'),
(18, '2026-10-09 13:55:00', 750000.00, 'SHIPPED'),
(19, '2026-10-10 16:05:00', 310000.00, 'CONFIRMED'),
(20, '2026-10-10 19:40:00', 640000.00, 'SHIPPED');

-- 5. Bảng Invoice Details (Chi tiết hóa đơn)
CREATE TABLE invoice_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_id INT DEFAULT NULL,
    product_id INT DEFAULT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (product_id) REFERENCES product(id) 
);

INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 150000.00),
(2, 2, 2, 225000.00),
(3, 3, 1, 70000.00),
(4, 4, 3, 400000.00),
(5, 5, 1, 320000.00),
(6, 1, 1, 95000.00),
(7, 6, 2, 300000.00),
(8, 7, 2, 90000.00),
(9, 8, 5, 50000.00),
(10, 9, 1, 50000.00),
(11, 10, 1, 850000.00),
(12, 2, 2, 190000.00),
(13, 11, 1, 1500000.00),
(14, 3, 2, 145000.00),
(15, 5, 1, 120000.00),
(16, 12, 1, 430000.00),
(17, 7, 1, 99000.00),
(18, 4, 2, 375000.00),
(19, 1, 2, 155000.00),
(20, 6, 2, 320000.00);
