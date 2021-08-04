package com.cg.bo.service.impl;

import com.cg.bo.model.projection.Film;
import com.cg.bo.repository.FilmRepository;
import com.cg.bo.service.FilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class FilmServiceImpl implements FilmService {

    @Autowired
    private FilmRepository filmRepository;

    @Override
    public Iterable<Film> findAll() {
        return filmRepository.findAll();
    }

    @Override
    public Optional<Film> findById(Long id) {
        return filmRepository.findById(id);
    }

    @Override
    public Film save(Film film) {
        return filmRepository.save(film);
    }

    @Override
    public void remove(Long id) {
        filmRepository.deleteById(id);
    }

    @Override
    public Iterable<Film> findAllByOrderByFilm_idDesc() {
        return filmRepository.findAllByOrderByFilm_idDesc();
    }
}
