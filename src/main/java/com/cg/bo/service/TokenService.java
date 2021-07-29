package com.cg.bo.service;


import com.cg.bo.model.Token;

public interface TokenService {

    Token createToken(Token token);

    Token findByToken(String token);
}
