package com.cg.bo.controller;

import com.cg.bo.model.projection.Room;
import com.cg.bo.model.projection.Seat;
import com.cg.bo.service.RoomService;
import com.cg.bo.service.SeatService;
import com.cg.bo.service.impl.RoomServiceImpl;
import com.cg.bo.service.impl.SeatServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/seat")
public class SeatController {
    @Autowired
    private RoomServiceImpl roomService;

    @Autowired
    private SeatServiceImpl seatService;

    @GetMapping("/getSeatsByRoom/{roomId}")
    public ResponseEntity<Iterable<Seat>> listSeat(@PathVariable Long roomId){
        Room room = roomService.findById(roomId).get();
        return new ResponseEntity<>(roomService.findSeatListRoom(room), HttpStatus.OK);
    }

}
