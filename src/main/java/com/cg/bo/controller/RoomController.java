package com.cg.bo.controller;

import com.cg.bo.model.projection.Room;
import com.cg.bo.service.impl.RoomServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/room")
public class RoomController {

    @Autowired
    private RoomServiceImpl roomService;

    @PostMapping("/create")
    public ResponseEntity<Room> createRoom(@RequestBody Room room){
        return new ResponseEntity<>(roomService.save(room), HttpStatus.CREATED);
    }



}
