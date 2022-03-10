package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/week")
public class CalendarClass {

	
	@GetMapping("/index")
	public String calendar2 (@RequestParam(name = "startDay") String startDate,
			@RequestParam(name="endDay") String endDate,
			@RequestParam(name="month", required = false) String month) throws Exception{
		
		
		    
		    
		
		
		
		
		
		return
	}
	
}
