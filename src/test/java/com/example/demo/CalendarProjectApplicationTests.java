package com.example.demo;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import com.example.demo.Util.DataVO;
import com.example.demo.service.Service;

@SpringBootTest
class CalendarProjectApplicationTests {
	
	
	@Autowired
	Service service;

	
	@Test
	public void commonGetTest() throws Exception {
       
	    //given
		
		
		//when
		final int result =  service.multiply(2,3);
		final int result2 = service.multiply(4,7);

	    System.out.println("result::" + result);
		System.out.println("result::" + result2);
		
	    //then
	    assertThat(result).isEqualTo(6);
	    assertThat(result2).isEqualTo(28);

	}
	
	 
	
	

}
