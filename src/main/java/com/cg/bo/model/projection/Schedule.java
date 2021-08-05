package com.cg.bo.model.projection;

import com.cg.bo.model.security.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
    private Date schedule_date;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Schedule(Date schedule_date, User user) {
        this.schedule_date = schedule_date;
        this.user = user;
    }
}
