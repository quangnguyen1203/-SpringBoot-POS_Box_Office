package com.cg.bo.controller;

import com.cg.bo.model.projection.Film;
import com.cg.bo.service.FilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/films")
public class FilmController {

    @Autowired
    private FilmService filmService;

    //listFilm
    @GetMapping("/listFilm")
    public ModelAndView listFilm(){
        return new ModelAndView("projection/film/list");
    }

    @GetMapping("/allFilm")
    public ResponseEntity<Iterable<Film>> listAllFilm(){
        return new ResponseEntity<>(filmService.findAllByOrderByFilm_idDesc(),HttpStatus.OK);
    }

    @PostMapping("/createFilm")
    public ResponseEntity<Film> createFilm(@RequestBody Film film){
        return new ResponseEntity<>(filmService.save(film),HttpStatus.CREATED);
    }

    ///createFilm
    @GetMapping("/createFilm")
    public ModelAndView createFilm(){
        return new ModelAndView("projection/film/create");
    }


    @GetMapping("/edit-form/{id}")
    public ModelAndView getFormEdit(@PathVariable Long id){
        return new ModelAndView("projection/film/edit");
    }

    @GetMapping("/edit-film/{id}")
    public ResponseEntity<Film> productResponseEntity(@PathVariable Long id){
        Film film = filmService.findById(id).get();
        return new ResponseEntity<>(film,HttpStatus.OK);
    }

    @PutMapping("/edit-film/{id}")
    public ResponseEntity<Film> editFilm(@RequestBody Film film,@PathVariable Long id){
        film.setFilm_id(id);
        film.setImage(film.getImage());
        return new ResponseEntity<>(filmService.save(film),HttpStatus.OK);
    }

}
