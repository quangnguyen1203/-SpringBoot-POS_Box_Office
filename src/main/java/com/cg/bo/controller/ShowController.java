package com.cg.bo.controller;

import com.cg.bo.service.impl.ShowServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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



}
