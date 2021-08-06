package com.cg.bo.repository;

import com.cg.bo.model.projection.Schedule;
import com.cg.bo.model.projection.Show;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShowRepository extends JpaRepository<Show, Long> {

}
