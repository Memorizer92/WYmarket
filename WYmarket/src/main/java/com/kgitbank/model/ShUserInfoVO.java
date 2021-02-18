package com.kgitbank.model;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ShUserInfoVO {

	private Integer userinfo;
	private String phonenumber;
	private String kakaomail;
	private String usernick;
	private String address;
	private Integer manner;
	private Integer varifycnt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate usercreatedate;
	private Integer saleitemcnt;
	private Integer reviewcnt;
	private String keyword;
	
	
}
