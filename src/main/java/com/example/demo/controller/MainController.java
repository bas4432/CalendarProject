package com.example.demo.controller;

import java.net.http.HttpRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import com.example.demo.Util.DataVO;
import com.fasterxml.jackson.databind.ObjectMapper;



@RestController
@RequestMapping(value="/api")
public class MainController {


	@GetMapping(value = "/index")
	public List<String> calendar(HttpServletRequest reqeust, DataVO datavo) throws Exception {
        
		
		
		System.out.println("@@" + datavo.getStartDay());
		System.out.println("@@" + datavo.getEndDay());
		
        datavo.setStartDay("2022-01-20");
        datavo.setEndDay("2022-02-10");
        
        System.out.println("@@" + datavo.getStartDay());
		System.out.println("@@" + datavo.getEndDay());
		
        final String DATE_PATTERN = "yyyy-MM-dd";

		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		
		Date startDate = sdf.parse(datavo.getStartDay());
		Date endDate = sdf.parse(datavo.getEndDay());

		ArrayList<String> dates = new ArrayList<String>();
		
		Date currentDate = startDate;
		
		

		while (currentDate.compareTo(endDate) <= 0) {
			dates.add(sdf.format(currentDate));
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(currentDate);
			calendar.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = calendar.getTime();
		}
		
	    
		

		
		
        return dates;	
	}

	
}
