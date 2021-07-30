package com.cg.bo.model.bussiness;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "members")
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long member_id;
    private String member_name;
    private String phone;
    private String email;

    @OneToMany
    @JoinColumn(name = "visit_id")
    private List<Visit> visits;

    @OneToMany
    @JoinColumn(name = "order_id")
    private List<Order> orders;

    @ManyToOne
    @JoinColumn(name = "class_id")
    private Class aClass;
}
