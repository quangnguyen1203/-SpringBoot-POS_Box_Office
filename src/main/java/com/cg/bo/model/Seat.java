package com.cg.bo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "seats")
public class Seat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long seat_id;
    private String seat_name;

    @OneToOne
    @JoinColumn(name = "status_id")
    private Status status;

    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

    @ManyToOne
    @JoinColumn(name= "type_id")
    private TypeSeat typeSeat;

    public Seat(String seat_name, Status status, Room room, TypeSeat typeSeat) {
        this.seat_name = seat_name;
        this.status = status;
        this.room = room;
        this.typeSeat = typeSeat;
    }
}
