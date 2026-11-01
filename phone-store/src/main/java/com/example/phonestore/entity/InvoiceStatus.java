package com.example.phonestore.entity;

public enum InvoiceStatus {
    PENDING,    // Chờ xử lý
    CONFIRMED,  // Đã xác nhận
    SHIPPED,    // Đang giao hàng
    COMPLETED,  // Hoàn thành
    CANCELLED   // Đã huỷ
}
