package com.example.phonestore.repository;

import java.math.BigDecimal;

public interface RevenueView {
    String getPeriod();
    BigDecimal getRevenue();
    Long getOrders();
}

