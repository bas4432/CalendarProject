package com.example.backendtwo.service;

import com.example.backendtwo.dao.CalendarDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class CalendarService {

    @Autowired
    private CalendarDao dao;

    public List<LocalDate> selectedDateList (int numberOfDaysBetween, String startDate) {
        return dao.selectedDateList(numberOfDaysBetween, startDate);
    }
}
