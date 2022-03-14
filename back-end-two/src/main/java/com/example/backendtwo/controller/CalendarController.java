package com.example.backendtwo.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@RestController
public class CalendarController {

    @GetMapping("/home")
    public String getHome() {
        return "Hello World!";
    }

    @GetMapping("/date")
    public List<String> calendar(HttpServletRequest reqeust) throws Exception {

        final String DATE_PATTERN = "yyyy-MM-dd";
        SimpleDateFormat format = new SimpleDateFormat(DATE_PATTERN);

        Calendar calenar = Calendar.getInstance();

        ArrayList<String> dates = new ArrayList<String>();

        return dates;
    }
}
