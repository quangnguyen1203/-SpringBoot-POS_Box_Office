package com.cg.bo.controller;

import com.cg.bo.model.bussiness.Class;
import com.cg.bo.model.bussiness.Member;
import com.cg.bo.service.ClassService;
import com.cg.bo.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@RestController
@RequestMapping("/members")
public class MemberController {
    @Autowired
    private ClassService classService;

    @Autowired
    private MemberService memberService;

    @GetMapping("/")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public ModelAndView listMember(){
        return new ModelAndView("dashboard/member/list");
    }

    @GetMapping("/allClass")
    public ResponseEntity<Iterable<Class>> allClasses(){
        return new ResponseEntity<>(classService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/allMember")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public ResponseEntity<Iterable<Member>> allMembers(){
        return new ResponseEntity<>(memberService.findAll(), HttpStatus.OK);
    }

    @PostMapping("/createNewMember")
    public ResponseEntity<Member> createNewMember(@RequestBody Member member){
        Class aClass = classService.findById(member.getAClass().getClass_id()).get();
        member.setAClass(aClass);
        return new ResponseEntity<>(memberService.save(member), HttpStatus.CREATED);
    }

    @GetMapping("/createNewMember")
    public ModelAndView createMemberForm(){
        return new ModelAndView("dashboard/member/create");
    }
}
