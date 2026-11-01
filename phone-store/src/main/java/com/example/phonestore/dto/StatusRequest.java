package com.example.phonestore.dto;

import com.example.phonestore.entity.InvoiceStatus;
import jakarta.validation.constraints.NotNull;

public record StatusRequest(@NotNull(message = "Thiếu trạng thái") InvoiceStatus status) {
}
