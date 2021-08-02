package com.cg.bo.model.projection;

import com.cg.bo.model.bussiness.Ticket;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Time;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "shows")
public class Show {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long show_id;
    private Time time;

    @OneToOne
    @JoinColumn(name = "film_id")
    private Film film;

    @OneToOne
    @JoinColumn(name = "schedule_id")
    private Schedule schedule;

    @OneToOne
    @JoinColumn(name = "room_id")
    private Room room;

    @OneToMany
    @JoinColumn(name = "ticket_id")
    private List<Ticket> tickets;

    @JsonIgnore
    @Column(columnDefinition = "boolean default false")
    private boolean isStatus;
}
