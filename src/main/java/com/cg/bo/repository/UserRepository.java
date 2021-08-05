package com.cg.bo.repository;

import com.cg.bo.model.security.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long>{
    User findByUsername(String username);

    Iterable<User> findAllByDeletedFalse();

    Iterable<User> findAllByDeletedTrue();

}