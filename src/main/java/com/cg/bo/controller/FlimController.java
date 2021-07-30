//package com.cg.bo.controller;
//
//
//import com.cg.bo.model.Schedule;
//import com.cg.bo.service.impl.IScheduleService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.servlet.ModelAndView;
//
//import java.util.Optional;
//
//@RestController
//@RequestMapping("/flim")
//public class FlimController {
//
//    @Autowired
//    private IScheduleService scheduleService;
//
//    @GetMapping("/api")
//    public ResponseEntity<Iterable<Schedule>> listSchedule(){
//        return new ResponseEntity<>(scheduleService.findAll(), HttpStatus.OK);
//    }
//
//
//}
