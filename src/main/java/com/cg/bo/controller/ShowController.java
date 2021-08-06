package com.cg.bo.controller;

import com.cg.bo.model.projection.Show;
import com.cg.bo.service.impl.ShowServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/show")
public class ShowController {

    @Autowired
    private ShowServiceImpl showService;

    @GetMapping("/create")
    public ModelAndView showCreateShowForm(){
        return new ModelAndView("/projection/show/create");
    }

    @PostMapping("/create")
    public ResponseEntity<Show> createNewShow(@RequestBody Show show){
        return new ResponseEntity<>(showService.save(show), HttpStatus.CREATED);
    }



}
