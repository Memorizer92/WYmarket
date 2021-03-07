package com.kgitbank.model;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsVO {
	
	private Integer itemid;
	private String iimagepath;
	private String usernick;
	private String address;
	private Integer manner;
	private String ititle;
	private String icategory;
	private Date refreshtime;
	private String icontent;
	private Integer price;
	private Integer chatcnt;
	private Integer likecnt;
	private Integer viewcnt;
	private String istate;
	private String iReservationState;
}
