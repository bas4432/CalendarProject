package com.example.demo.Util;

import java.util.Arrays;

public class DateResponseDtoResponse {
	boolean isFirstMonth;
	boolean isEndMonth;
	int currentMonth;
	String[] dates;
	
	
	
	@Override
	public String toString() {
		return "DateResponseDtoResponse [isFirstMonth=" + isFirstMonth + ", isEndMonth=" + isEndMonth
				+ ", currentMonth=" + currentMonth + ", dates=" + Arrays.toString(dates) + "]";
	}



	public boolean isFirstMonth() {
		return isFirstMonth;
	}



	public void setFirstMonth(boolean isFirstMonth) {
		this.isFirstMonth = isFirstMonth;
	}



	public boolean isEndMonth() {
		return isEndMonth;
	}



	public void setEndMonth(boolean isEndMonth) {
		this.isEndMonth = isEndMonth;
	}



	public int getCurrentMonth() {
		return currentMonth;
	}



	public void setCurrentMonth(int currentMonth) {
		this.currentMonth = currentMonth;
	}



	public String[] getDates() {
		return dates;
	}



	public void setDates(String[] dates) {
		this.dates = dates;
	}



	public DateResponseDtoResponse(boolean isFirstMonth, boolean isEndMonth, int currentMonth, String[] dates) {
		this.isFirstMonth = isFirstMonth;
		this.isEndMonth = isEndMonth;
		this.currentMonth = currentMonth;
		this.dates = dates;
	}
}
