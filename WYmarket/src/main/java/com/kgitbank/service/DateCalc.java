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
	
	public int getYear() {
		return year;
	}
	
	public int getDay() {
		System.out.println(day);
		return day;
	}

}
