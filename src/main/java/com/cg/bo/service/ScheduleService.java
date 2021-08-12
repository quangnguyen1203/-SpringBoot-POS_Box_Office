package com.cg.bo.service;

import com.cg.bo.model.projection.Schedule;

public interface ScheduleService extends GeneralService<Schedule>{
    Iterable<Schedule> findAllByOrOrderBySchedule_dateAsc();

    Iterable<Schedule> searchBySchedule_date(String schedule_date);
}
