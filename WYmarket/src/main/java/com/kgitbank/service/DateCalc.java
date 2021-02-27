package com.kgitbank.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service
public class DateCalc {

	private int year;
	private int month;
	private int day;
	private Calendar cal;
	
	private String selectedYear;
	private String selectedMonth;
	private String selectedDay;
	
	public DateCalc() {
		cal = Calendar.getInstance();
		year = cal.get(Calendar.YEAR);
	}
	
	public DateCalc(int year, int month) {
		System.out.println(year + "/" + month);
		cal = Calendar.getInstance();
		cal.set(year, month - 1, 1);
		day = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		System.out.println(day);
	}
	
	public DateCalc(String year, String month, String day) {
		year = year.substring(2, year.length());
		
		if(month.equals("월 선택") && day.equals("일 선택")) {
			selectedYear = year;
		} else if(!month.equals("월 선택") && day.equals("일 선택")) {
			
		} else {
			
		}
		
//		String date = year + "/" +
	}
	
	public int getYear() {
		return year;
	}
	
	public int getDay() {
		System.out.println(day);
		return day;
	}

}
