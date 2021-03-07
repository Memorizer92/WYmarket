package com.kgitbank.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UserInfo implements Serializable{
	
	private Integer userID;
	private String phoneNumber;
	private String kakaoMail;
	private String userNick;
	private double latitude;
	private double longitude;
	private String address;
	private Integer manner;
	@DateTimeFormat(pattern = "yy/mm/dd")
	private Date userCreateDate;
	private Integer buyItemCnt;
	private Integer saleItemCnt;
	private Integer reviewCnt;
	private String keyWord;
	private String ban;
	
}
