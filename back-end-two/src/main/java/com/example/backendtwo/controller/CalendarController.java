package com.example.backendtwo.controller;

import com.example.backendtwo.model.vo.Date;
import com.example.backendtwo.service.CalendarService;
import jdk.vm.ci.meta.Local;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@RestController
public class CalendarController {

    @GetMapping("/home")
    public String getHome() {
        return "Hello World!";
    }

    @Autowired
    private CalendarService service;

    @GetMapping( "/date")
    @ResponseBody
    public List<LocalDate> calendar(Date date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-d");
        LocalDate startDate = LocalDate.parse(date.getStartDate(), formatter);
        LocalDate endDate = LocalDate.parse(date.getEndDate(), formatter);
        int numOfDaysBetween = (int) ChronoUnit.DAYS.between(startDate, endDate.plusDays(1L));

        return service.selectedDateList(numOfDaysBetween, date.getStartDate());
    }
}
