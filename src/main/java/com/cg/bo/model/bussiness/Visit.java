package com.cg.bo.model.bussiness;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "visits")
public class Visit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long visit_id;
    private Date rel_date;
    private Date exp_date;

    @JsonIgnore
    @Column(columnDefinition = "boolean default false")
    private boolean isStatus;
}
