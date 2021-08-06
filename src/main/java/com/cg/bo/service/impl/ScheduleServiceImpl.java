package com.cg.bo.service.impl;

import com.cg.bo.model.projection.Schedule;
import com.cg.bo.repository.ScheduleRepository;
import com.cg.bo.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    private ScheduleRepository scheduleRepository;

    @Override
    public Iterable<Schedule> findAll() {
        return scheduleRepository.findAll();
    }

    @Override
    public Optional<Schedule> findById(Long id) {
        return scheduleRepository.findById(id);
    }

    @Override
    public Schedule save(Schedule schedule) {
        return scheduleRepository.save(schedule);
    }

    @Override
    public void remove(Long id) {
        scheduleRepository.deleteById(id);
    }

    @Override
    public Iterable<Schedule> findAllByOrderBySchedule_dateAsc() {
        return scheduleRepository.findAllByOrOrderBySchedule_dateAsc();
    }
}
