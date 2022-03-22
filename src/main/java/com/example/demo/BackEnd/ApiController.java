package com.example.demo.BackEnd;


import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.domain.DataVO;

@RestController
@RequestMapping(value = "/api")
public class ApiController {

    @GetMapping(value = "/index")
    public List<String> calendar(HttpServletRequest reqeust, DataVO datavo) throws Exception {

        final String DATE_PATTERN = "yyyy-MM-dd";
        SimpleDateFormat format = new SimpleDateFormat(DATE_PATTERN);

        Date startDate = format.parse(datavo.getStartDay());
        Date endDate = format.parse(datavo.getEndDay());

        Calendar calenar = Calendar.getInstance();
        calenar.setTime(startDate);
        
        ArrayList<String> dates = new ArrayList<String>();
        Date currentDate = startDate;
        while (currentDate.compareTo(endDate) <=0) { // 종료날짜가 시작날짜보다 커야한다.

            dates.add(format.format(currentDate));
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(currentDate);
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            currentDate = calendar.getTime();
        }

        return dates;
    }
}
