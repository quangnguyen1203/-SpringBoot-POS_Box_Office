package com.cg.bo.controller;

import com.cg.bo.model.bussiness.Order;
import com.cg.bo.model.dto.OrderDTO;
import com.cg.bo.model.security.User;
import com.cg.bo.service.impl.OrderServiceImpl;
import com.cg.bo.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;

@RestController
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private OrderServiceImpl orderService;

    @GetMapping("/listOrder")
    public ModelAndView ListOrder(){
        return new ModelAndView("/dashboard/order/listOrder");
    }

    @GetMapping("/allOrder")
    public ResponseEntity<Iterable<Order>> allOrderByOrderDate(){
        return new ResponseEntity<>(orderService.findAllByOrderByOrder_dateDesc(), HttpStatus.OK);
    }

    @GetMapping("/findByOrderDate/{date}")
    public ResponseEntity<Iterable<Order>> findByOrderDate(@PathVariable Date date){
        return new ResponseEntity<>(orderService.findAllByOrderDate(date),HttpStatus.OK);
    }

    @GetMapping("/findByTicketOfOrderDate/{date}")
    public ResponseEntity<Iterable<Order>> countTicket(@PathVariable Date date){
        return new ResponseEntity<>(orderService.findOrderByTicket(date),HttpStatus.OK);
    }


    @GetMapping("/listOrderByStaff")
    public ModelAndView listOrderByStaff(){
        return new ModelAndView("/dashboard/order/listStaffDetail");
    }

    @GetMapping("/findByStaff/{id}")
    public ResponseEntity<Iterable<User>> listStaff(@PathVariable Long id){
        return new ResponseEntity<>(userService.findByUserRoleStaff(id), HttpStatus.OK);
    }

    @GetMapping("/searchByStaffName/{id}")
    public ResponseEntity<Iterable<Order>> listOrderByStaffName(@PathVariable Long id){
        Iterable<Order> orders = orderService.findByUserId(id);
        return new ResponseEntity<>(orders,HttpStatus.OK);
    }

    @GetMapping("/monthlyRevenue")
    public ResponseEntity<Iterable<OrderDTO>> getMonthlyRevenue(){
        return new ResponseEntity<>(orderService.findByMonthlyRevenue(),HttpStatus.OK);
    }
}