package com.cg.bo.repository;

import com.cg.bo.model.bussiness.Order;
import com.cg.bo.model.dto.OrderDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query("select o from Order o order by o.order_id desc")
    Iterable<Order> findAllByOrderByOrder_dateDesc();

    @Query("select o from Order o where o.order_date= :id")
    Iterable<Order> findOrderByOrderOrder_date(@Param("id") Long id);

    @Query("select o from Order o where o.order_date = ?1")
    Iterable<Order> findAllByOrderDate(Date date);

    @Query("select o.total_product,o.total_ticket,o.total_price,t.ticket_id from Order o inner join Ticket t on o.order_id = t.order.order_id where o.order_date = ?1")
    Iterable<Order> findOrderByTicket(Date date);

    @Query("select o from Order o where o.user.id = ?1")
    Iterable<Order> findByUserId(Long id);

    @Query(nativeQuery = true, value = "SELECT month(o.order_date) as `month` ,\n" +
            " sum(o.total_product) as total_product,\n" +
            " sum(o.total_ticket) as total_ticket,\n" +
            " sum(o.total_price) as total_price \n" +
            "FROM orders o\n" +
            "WHERE year(o.order_date)\n" +
            "GROUP BY month(o.order_date)")
    Iterable<OrderDTO> findByMonthlyRevenue();

}
