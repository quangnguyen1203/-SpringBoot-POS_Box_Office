package com.cg.bo.model.projection;

import com.cg.bo.model.security.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

import javax.persistence.*;
import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "schedules")
public class Schedule{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long schedule_id;
    @Column(name = "schedule_date",unique = true)
    private Date schedule_date;

    @OneToMany(targetEntity = Show.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "show_id")
    private List<Show> shows;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Schedule(Date schedule_date, User user) {
        this.schedule_date = schedule_date;
        this.user = user;
    }
}
