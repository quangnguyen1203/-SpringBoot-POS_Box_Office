package com.cg.bo.repository;

import com.cg.bo.model.bussiness.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query(nativeQuery = true, value = "SELECT o.order_id,o.order_time, o.total_price,u.username FROM orders o inner join users u \n" +
            "on o.user_id = u.id where o.order_date = ?1 and u.role_id = ?2")
    Iterable<Order> findByOrderDateAndRoleStaff(String order_date, Long id);
}
