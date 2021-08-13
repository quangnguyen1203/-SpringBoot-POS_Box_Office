package com.cg.bo.service.impl;

import com.cg.bo.model.bussiness.Order;
import com.cg.bo.repository.OrderRepository;
import com.cg.bo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Override
    public Iterable<Order> findAll() {
        return orderRepository.findAll();
    }

    @Override
    public Optional<Order> findById(Long id) {
        return orderRepository.findById(id);
    }

    @Override
    public Order save(Order order) {
        return orderRepository.save(order);
    }

    @Override
    public void remove(Long id) {
        orderRepository.deleteById(id);
    }

    @Override
    public Iterable<Order> findByOrderDateAndRoleStaff(String order_date, Long id) {
        return orderRepository.findByOrderDateAndRoleStaff(order_date,id);
    }
}
