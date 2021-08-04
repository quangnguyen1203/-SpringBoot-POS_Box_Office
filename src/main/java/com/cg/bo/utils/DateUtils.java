package com.cg.bo.utils;

import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class DateUtils {
    public String getCurrentDate(){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = new java.util.Date();
        return formatter.format(date);
    }

    public String getCurrentTime(){
        Date date = new Date();
        return date.getHours() +":"+date.getMinutes() +":"+  date.getSeconds();
    }

}
