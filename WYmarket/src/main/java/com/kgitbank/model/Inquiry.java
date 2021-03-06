package com.kgitbank.model;

import java.io.Serializable;

import lombok.Data;

@Data
public class Inquiry implements Serializable{

	private int inquiryID;
	private String userNick;
	private String inquiryCategory;
	private String inquiryContent;
	
}
