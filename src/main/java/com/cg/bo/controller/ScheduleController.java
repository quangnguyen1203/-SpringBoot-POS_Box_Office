package com.cg.bo.controller;


import com.cg.bo.model.Schedule;
import com.cg.bo.service.impl.IScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Schedules;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping
public class ScheduleController {

    @Autowired
    private IScheduleService scheduleService;

    @GetMapping("/api")
    public ResponseEntity<Iterable<Schedule>> listSchedule(){
        return new ResponseEntity<>(scheduleService.findAll(), HttpStatus.OK);
    }

    @GetMapping
    public ModelAndView listCity(){
        return new ModelAndView("/schedule/list");
    }

    @PostMapping("/createSchedule")
    public ResponseEntity<Schedule> createSchedule(@RequestBody Schedule schedule){
        return new ResponseEntity<>(scheduleService.save(schedule),HttpStatus.CREATED);
    }
}
