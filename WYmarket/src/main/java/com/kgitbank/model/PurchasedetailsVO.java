package com.kgitbank.model;

import lombok.Data;

@Data
public class PurchasedetailsVO {


	
	private Integer itemid;
	private String iimagepath;
	private String purchaser;
	private String usernick; 
	private String address; 
	private String ititle;	
	// 데이터 포맷 으로 변호ㅓㅏㄴ
//	private Date stam;
	private Integer price;
	private Integer chatcnt;
	private Integer likecnt;
	private Integer viewcnt;

	
	
	
}



