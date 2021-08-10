package com.cg.bo.repository;

import com.cg.bo.model.projection.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ScheduleRepository extends JpaRepository<Schedule, Long> {
    @Query("select s from Schedule s order by s.schedule_date asc")
    Iterable<Schedule> findAllByOrOrderBySchedule_dateAsc();

    @Query(nativeQuery = true,value = "SELECT * FROM schedules s WHERE s.schedule_date LIKE %?% ")
    Iterable<Schedule> searchBySchedule_date(String schedule_date);
}