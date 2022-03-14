package com.example.backendtwo.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;

@RestController
public class CalendarController {

    @GetMapping("/home")
    public String getHome() {
        return "Hello World!";
    }

    @GetMapping("/date")
    public List<String> calendar(HttpServletRequest reqeust, DataVO datavo) throws Exception {

        final String DATE_PATTERN = "yyyy-MM-dd";
        SimpleDateFormat format = new SimpleDateFormat(DATE_PATTERN);

        Date startDate = format.parse(datavo.getStartDay());
        Date endDate = format.parse(datavo.getEndDay());

        Calendar calenar = Calendar.getInstance();
        calenar.setTime(startDate);

        ArrayList<String> dates = new ArrayList<String>();
        Date currentDate = startDate;

        while (currentDate.compareTo(endDate) <= 0) {

            dates.add(format.format(currentDate));
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(currentDate);
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            currentDate = calendar.getTime();
        }

        return dates;
    }
}
