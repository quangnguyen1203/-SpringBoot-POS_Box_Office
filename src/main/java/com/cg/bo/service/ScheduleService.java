package com.cg.bo.service;

import com.cg.bo.model.projection.Schedule;

import java.sql.Date;
import java.util.Optional;

public interface ScheduleService extends GeneralService<Schedule>{
    Iterable<Schedule> findAllByOrOrderBySchedule_dateAsc();

    Iterable<Schedule> searchBySchedule_date(String schedule_date);

    Optional<Schedule> findScheduleBySchedule_date(Date schedule_date);

    Iterable<Schedule> findScheduleByMonthAndYear(String schedule_date);
}
