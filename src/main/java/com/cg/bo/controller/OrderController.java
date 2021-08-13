package com.cg.bo.controller;

import com.cg.bo.service.impl.OrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private OrderServiceImpl orderService;

    @GetMapping("/listOrderByStaff")
    public ModelAndView listOrderByStaff(){
        return new ModelAndView("/dashboard/order/listStaffDetail");
    }
}
