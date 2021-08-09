package com.cg.bo.service;

import com.cg.bo.model.projection.Schedule;
import com.cg.bo.model.projection.Show;

public interface ShowService extends GeneralService<Show>{
    Iterable<Show> findShowsBySchedule(Schedule schedule);

    Iterable<Show> findAllByScheduleAndStatusTrue(Schedule schedule);

}