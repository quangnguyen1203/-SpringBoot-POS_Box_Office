package com.cg.bo.service;

import com.cg.bo.model.Schedule;

import java.util.Optional;

public interface IGeneralService<T>{
    Iterable<T> findAll();
    Optional<T> findOne(Long id);
    T save(T t);
    void remove(Long id);
}
