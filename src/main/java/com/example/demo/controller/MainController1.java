package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.Util.DataVO;

@Controller
public class MainController1 {

	@GetMapping(value= "/")
	public String page() {
		
		return "Cal";
	}
	
	
	DataVO vo = new DataVO();
	
    @GetMapping
    public String lombok() {
    	
    
    	
    	return "1";
    }
}
