package com.cg.bo.service;

import com.cg.bo.model.bussiness.Order;

public interface OrderService extends GeneralService<Order>{
    Iterable<Order> findByOrderDateAndRoleStaff(String order_date, Long id);
}
