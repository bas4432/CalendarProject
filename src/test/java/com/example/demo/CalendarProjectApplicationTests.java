package com.example.demo;

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



@SpringBootTest
class CalendarProjectApplicationTests {
	

	@DisplayName("반환 성공")
	@Test
	public void commonGetTest(DataVO dataVO) throws Exception {

		
		dataVO.setStartDay("2011-01-01");
		dataVO.setEndDay("2011-03-03");
		
		final String DATE_PATTERN = "yyyy-MM-dd";
		
         SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		
		Date startDate = sdf.parse(dataVO.getStartDay());
		Date endDate = sdf.parse(dataVO.getEndDay());

		ArrayList<String> dates = new ArrayList<String>();
		
		Date currentDate = startDate;
		
		

		while (currentDate.compareTo(endDate) <= 0) {
			dates.add(sdf.format(currentDate));
			Calendar c = Calendar.getInstance();
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();
		}
		
		
		
		
	
		
	}
	
	

}
