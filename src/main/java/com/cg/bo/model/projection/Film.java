package com.cg.bo.model.projection;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "films")
public class Film {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long film_id;
    private String film_name;
    private Time duration;
    private Date rel_date;
    private Date exp_date;
    private Long admit;
    private String description;

    @JsonIgnore
    @Column(columnDefinition = "boolean default false")
    private boolean isDelete;

    public Film(String film_name, Time duration, Date rel_date, Date exp_date, Long admit, String description) {
        this.film_name = film_name;
        this.duration = duration;
        this.rel_date = rel_date;
        this.exp_date = exp_date;
        this.admit = admit;
        this.description = description;
    }
}
