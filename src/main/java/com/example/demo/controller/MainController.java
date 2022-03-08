package com.example.demo.controller;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.Util.DataVO;
import com.example.demo.Util.dayVO;

@Controller
public class MainController {
	
	
	@GetMapping(value="/index")
	public String calendar(Model model, HttpServletRequest reqeust, DataVO datavo){ 
		
		System.out.println(datavo.getStartDay());
		System.out.println(datavo.getEndDay());
		
	
		
		Calendar cal = Calendar.getInstance();
		DataVO calendarData;
		//�˻� ��¥
		if(datavo.getDate().equals("")&&datavo.getMonth().equals("")){
			datavo = new DataVO(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//�˻� ��¥ end

		Map<String, Integer> today_info =  datavo.today_info(datavo);
		List<DataVO> dateList = new ArrayList<DataVO>();
		
		//�������� �޷� ������ ����Ʈ�� ������ ���� ����.
		//�ϴ� ���� �ε������� �ƹ��͵� ���� ������ ����
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DataVO(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//��¥ ����
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DataVO(String.valueOf(datavo.getYear()), String.valueOf(datavo.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DataVO(String.valueOf(datavo.getYear()), String.valueOf(datavo.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//�޷� ��� �� �����ͷ� ����
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DataVO(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList.get(0));
		System.out.println(dateList.get(1));
		
		
		//�迭�� ����
		model.addAttribute("dateList", dateList);		//��¥ ������ �迭
		model.addAttribute("today_info", today_info);
		
		
		return "main";
	}
	
	@GetMapping(value="/index2")
	public String calendar2(HttpServletRequest reqeust, dayVO dayvo) {
		
		
		System.out.println("��Ʈ�ѷ� ����");
		 
		return "main";
	}
	
	

}
