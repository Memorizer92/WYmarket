package com.kgitbank.model;

import java.io.Serializable;

import lombok.Data;

@Data
public class InquiryAdminToUser implements Serializable{

	private int inquiryID;
	private int userInquiryID;
	private String userNick;
	private String inquiryCategory;
	private String inquiryContent;
	
}
