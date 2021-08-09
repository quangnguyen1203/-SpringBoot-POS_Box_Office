package com.cg.bo.controller;

import com.cg.bo.model.projection.Schedule;
import com.cg.bo.service.ScheduleService;
import com.cg.bo.service.impl.UserServiceImpl;
import com.cg.bo.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/schedules")
public class ScheduleController {

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private DateUtils dateUtils;

    @Autowired
    UserServiceImpl userService;

    private String getPrincipal() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

    @GetMapping("/listSchedule")
    public ModelAndView listSchedule(){
        return new ModelAndView("projection/schedule/list");
    }

    @GetMapping("/allSchedule")
    public ResponseEntity<Iterable<Schedule>> allSchedule(){
        return new ResponseEntity<>(scheduleService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/create-schedule")
    public ModelAndView listAll(){
        return new ModelAndView("projection/schedule/create");
    }

    @PostMapping("/create-schedule")
    public ResponseEntity<Schedule> listAllSchedules(@RequestBody Schedule schedule){
        if (schedule.getSchedule_date().compareTo(dateUtils.getCurrentDate()) < 0 ) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        String username = getPrincipal();
        schedule.setUser(userService.findByName(username));
        return new ResponseEntity<>(scheduleService.save(schedule),HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Schedule> getScheduleById(@PathVariable Long id){
        return new ResponseEntity<>(scheduleService.findById(id).get(), HttpStatus.OK);
    }
}
