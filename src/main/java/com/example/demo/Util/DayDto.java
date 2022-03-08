package com.example.demo.Util;

public class DayDto {
	
	String startDay;
	String endDay;
	
	
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	
	@Override
	public String toString() {
		return "dayVO [startDay=" + startDay + ", endDay=" + endDay + "]";
	}
	
	
	
	
}
