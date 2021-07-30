package com.cg.bo.repository;

import com.cg.bo.model.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IScheduleRepository extends JpaRepository<Schedule, Long> {
}
