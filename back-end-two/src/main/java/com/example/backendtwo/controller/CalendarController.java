package com.example.backendtwo.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;

@RestController
public class CalendarController {

    @GetMapping("/home")
    public String getHome(){
        return "Hello World!";
    }

    @GetMapping("/date")
    public String getDate(String inputFromDate, String inputUntilDate) {
        LocalDate fromDate = LocalDate.parse("");
        LocalDate untilDate = LocalDate.parse("");

        return "";
    }
}
