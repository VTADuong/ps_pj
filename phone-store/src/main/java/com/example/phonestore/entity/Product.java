package com.example.phonestore.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "product")
@Getter @Setter
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank(message = "Tên sản phẩm không được để trống")
    @Size(max = 100, message = "Tên sản phẩm tối đa 100 ký tự")
    private String name;

    @NotBlank(message = "Nhãn hàng không được để trống")
    @Size(max = 50, message = "Nhãn hàng tối đa 50 ký tự")
    private String brand;

    @NotNull(message = "Giá không được để trống")
    @DecimalMin(value = "0.0", inclusive = true, message = "Giá phải >= 0")
    @Column(name = "price", precision = 12, scale = 2, nullable = false)
    private BigDecimal price;

    @NotNull(message = "Tồn kho không được để trống")
    @Min(value = 0, message = "Tồn kho phải >= 0")
    private Integer stock;

    @Column(name = "image")
    private String image = "default.jpg";

    @Column(name = "is_deleted")
    private Boolean isDeleted = false;

    @Size(max = 500, message = "Mô tả tối đa 500 ký tự")
    @Column(name = "description")
    private String description;
}

