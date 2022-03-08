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
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.Util.ApiResult;
import com.example.demo.Util.DataVO;
import com.example.demo.Util.DateResponseDtoResponse;
import com.example.demo.Util.DayDto;

@Controller
public class MainController {
	
	
	@GetMapping(value="/")
	public String main() {
	
		return "main";
	}
	   		
			
//	@GetMapping(value="/index")
//	public String calendar(Model model, HttpServletRequest reqeust, DataVO datavo) throws Exception{ 
//		
//		/*
//		 * System.out.println(datavo.getStartDay().replaceAll("-", ""));
//		 * System.out.println(datavo.getEndDay());
//		 */
//		
//		final String DATE_PATTERN = "yyyy-MM-dd";
//		
//		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
//		Date startDate = sdf.parse(datavo.getStartDay());
//		Date endDate = sdf.parse(datavo.getEndDay());	
//		
//		ArrayList<String> dates = new ArrayList<String>();
//	   
//		Date currentDate = startDate;
//		
//		while (currentDate.compareTo(endDate) <= 0) {
//			dates.add(sdf.format(currentDate));
//			Calendar c = Calendar.getInstance();
//			c.setTime(currentDate);
//			c.add(Calendar.DAY_OF_MONTH, 1);
//			currentDate = c.getTime();
//		}
//		
//		
//		for (String date : dates) {
//			System.out.println("date:::" + date);
//		}
//		
//	    model.addAttribute("dates" , dates);
//		
//	
//	
//		
//		Calendar cal = Calendar.getInstance();
//		DataVO calendarData;
//		//검색 날짜
//		if(datavo.getDate().equals("")&&datavo.getMonth().equals("")){
//			datavo = new DataVO(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
//		}
//		//검색 날짜 end
//
//		Map<String, Integer> today_info =  datavo.today_info(datavo);
//		List<DataVO> dateList = new ArrayList<DataVO>();
//		
//		
//		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
//		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
//		for(int i=1; i<today_info.get("start"); i++){
//			calendarData= new DataVO(null, null, null, null);
//			dateList.add(calendarData);
//		}
//		
//		//날짜 삽입
//		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
//			if(i==today_info.get("today")){
//				calendarData= new DataVO(String.valueOf(datavo.getYear()), String.valueOf(datavo.getMonth()), String.valueOf(i), "today");
//			}else{
//				calendarData= new DataVO(String.valueOf(datavo.getYear()), String.valueOf(datavo.getMonth()), String.valueOf(i), "normal_date");
//			}
//			dateList.add(calendarData);
//		}
//
//		//달력 빈곳 빈 데이터로 삽입
//		int index = 7-dateList.size()%7;
//		
//		if(dateList.size()%7!=0){
//			
//			for (int i = 0; i < index; i++) {
//				calendarData= new DataVO(null, null, null, null);
//				dateList.add(calendarData);
//			}
//		}
//	
//		
//		
//		
//		/*
//		 * //배열에 담음 model.addAttribute("dateList", dateList); //날짜 데이터 배열
//		 * model.addAttribute("today_info", today_info);
//		 */
//		
//		
//		return "main";
//	}
	
	
	@GetMapping(value="/index2")
	public String calendar2(Model model, 
			@RequestParam(name = "startDay") String startDate,
			@RequestParam(name="endDay") String endDate,
			@RequestParam(name="month", required = false) String month) throws Exception {
		
		
        LocalDate startLocalDate = LocalDate.parse(startDate, DateTimeFormatter.ISO_DATE);
        LocalDate endLocalDate = LocalDate.parse(endDate, DateTimeFormatter.ISO_DATE);
        
        int startMonth = startLocalDate.getMonthValue();
        int endMonth = endLocalDate.getMonthValue();
        
     
        System.out.println(startMonth);
        System.out.println(endMonth);
        
        DateResponseDtoResponse response = null;
        
        if(startMonth==endMonth) {
        	response = new DateResponseDtoResponse(true, true, startMonth, new String[] {"1", "2"});
        }
        else {
        	response = new DateResponseDtoResponse(true, false, startMonth, new String[] {"1", "2"});
        }
               
        model.addAttribute("data", response);
        
	  
	    return "Cal";
	}
	
	

}
