package com.example.backendtwo.dao;

import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Repository
public class CalendarDao {

    public List<LocalDate> selectedDateList (int numberOfDaysBetween, String startDate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-d");
        LocalDate startDateFormat = LocalDate.parse(startDate, formatter);
        return IntStream.iterate(0, i -> i + 1)
                .limit(numberOfDaysBetween)
                .mapToObj(i -> startDateFormat.plusDays(i))
                .collect(Collectors.toList());
    }
}
