package com.cg.bo.model.projection;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "rooms")
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long room_id;
    private String room_name;

    @Column(name = "isFull", columnDefinition = "boolean default false")
    private boolean isFull;

    @OneToMany
    @JoinColumn(name = "seat_id")
    private List<Seat> seats;
}
