package com.example.demo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import com.example.demo.Util.DataVO;


@RestController
public class MainController {
	@GetMapping("/home")
	public String main() {
		return "Hello";
	}

	@GetMapping(value = "/index")
	@ResponseBody
	public List<String> calendar(HttpServletRequest reqeust, DataVO datavo) throws Exception {
        
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
			Calendar c = Calendar.getInstance();
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();
		}
		
		System.out.println(dates.toString());
		
		
        return dates;	
	}

	
}
