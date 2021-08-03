package com.cg.bo.controller;

import com.cg.bo.security.UserPrincipal;
import com.cg.bo.service.impl.RoleServiceImpl;
import com.cg.bo.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserServiceImpl userService;

    @Autowired
    RoleServiceImpl roleService;

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

    @GetMapping("/create")
    public ModelAndView createForm(){
        return new ModelAndView("/dashboard/user/create");
    }

    @GetMapping("/getUser")
    public ResponseEntity<UserPrincipal> getUserByUsername(){
        return new ResponseEntity<>(userService.findByUsername(getPrincipal()), HttpStatus.OK);
    }

    @PostMapping("/create")
    public ResponseEntity<User> createNewUser(@RequestBody com.cg.bo.model.security.User user){
        user.setRole(roleService.findById(user.getRole().getId()).get());
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        if (userService.isContainEmail(user.getEmail()) && userService.isContainUsername(user.getUsername()) && userService.isContainPhone(user.getPhone())){
            userService.createUser(user);
            return new ResponseEntity<>(HttpStatus.CREATED);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @GetMapping("/list")
    public ModelAndView listUser(){
        return new ModelAndView("/dashboard/user/list");
    }


}
