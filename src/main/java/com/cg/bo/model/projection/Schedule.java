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
    private Date date;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Schedule(Date date, User user) {
        this.date = date;
        this.user = user;
    }
}
