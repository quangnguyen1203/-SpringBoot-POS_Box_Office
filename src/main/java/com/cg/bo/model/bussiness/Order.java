package com.cg.bo.model.bussiness;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long order_id;
    private String film_name;
    private Date order_date;
    private Time order_time;
    private double total_product;
    private double total_ticket;
    private double total_price;

    @OneToMany
    @JoinColumn(name = "ticket_id")
    private List<Ticket> tickets;

    @OneToMany
    @JoinColumn(name = "orderDetail_id")
    private List<OrderDetail> orderDetails;

    @ManyToOne
    @JoinColumn(name = "member_id")
    private Member member;
}
