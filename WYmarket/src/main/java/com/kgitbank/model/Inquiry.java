package com.kgitbank.model;

import lombok.Data;

@Data
public class Inquiry {

	private int inquiryID;
	private String userNick;
	private String inquiryCategory;
	private String inquiryContent;
	
}
