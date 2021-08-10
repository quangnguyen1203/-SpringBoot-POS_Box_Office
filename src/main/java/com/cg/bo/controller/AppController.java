package com.cg.bo.controller;

import com.cg.bo.model.bussiness.Category;
import com.cg.bo.model.bussiness.Class;
import com.cg.bo.model.bussiness.Member;
import com.cg.bo.model.bussiness.Product;
import com.cg.bo.service.CategoryService;
import com.cg.bo.service.ClassService;
import com.cg.bo.service.MemberService;
import com.cg.bo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/app")
public class AppController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ClassService classService;

    @Autowired
    private MemberService memberService;

    @GetMapping
    public ModelAndView pageApp(){
        return new ModelAndView("/app/app");
    }

    @GetMapping("/allCategory")
    public ResponseEntity<Iterable<Category>> allCategories(){
        return new ResponseEntity<>(categoryService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/allProduct")
    @PreAuthorize("hasAnyAuthority('STAFF')")
    public ResponseEntity<Iterable<Product>> allProducts(){
        return new ResponseEntity<>(productService.findAllByOrderByProduct_idDesc(), HttpStatus.OK);
    }

    @GetMapping("/menuProductByCategory/{id}")
    public ResponseEntity<Iterable<Product>> productResponseEntity(@PathVariable Long id){
        Iterable<Product> products = productService.findAllByCategoryCategory_id(id);
        return new ResponseEntity<>(products, HttpStatus.OK);
    }

    @GetMapping("/findProduct/{id}")
    public ResponseEntity<Product> findById(@PathVariable Long id){
        Product product = productService.findById(id).get();
        product.setAmount(1L);
        return new ResponseEntity<>(product, HttpStatus.OK);
    }

    @PostMapping("/createNewMember")
    public ResponseEntity<Member> createNewMember(@RequestBody Member member){
        Class aClass = classService.findById(1L).get();
        member.setAClass(aClass);
        return new ResponseEntity<>(memberService.save(member), HttpStatus.CREATED);
    }

    @GetMapping("/searchMember/{string}")
    public ResponseEntity<Iterable<Member>> searchByMember(@PathVariable String string){
        return new ResponseEntity<>(memberService.searchByAllMember(string), HttpStatus.OK);
    }
}
