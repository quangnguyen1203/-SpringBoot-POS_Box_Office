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

    @OneToMany
    @JoinColumn(name = "ticket_id")
    private List<Ticket> tickets;

    @OneToMany
    @JoinColumn(name = "orderDetail_id")
    private List<OrderDetail> orderDetails;

    @OneToOne
    @JoinColumn(name = "member_id")
    private Member member;
}
