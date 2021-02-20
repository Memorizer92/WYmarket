package com.kgitbank.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UserInfo {
	
	private Integer userID;
	private String phoneNumber;
	private String kakaoMail;
	private String userNick;
	private double latitude;
	private double longitude;
	private String address;
	private Integer manner;
	private Integer varifyCnt;
	@DateTimeFormat(pattern = "yy/mm/dd")
	private Date userCreateDate;
	private Integer saleItemCnt;
	private Integer reviewCnt;
	private String keyWord;
	private Integer smsCnt;
	
	private Date smsExceedDate;
	
}
