package com.kgitbank.service;

import java.util.List;

import com.kgitbank.model.PurchasedetailsVO;
import com.kgitbank.model.ShItemVO;
import com.kgitbank.model.ShUserInfoVO;

public interface IBreakdownService {

	List<ShUserInfoVO> getShuserInfo();
	
	List<ShItemVO>  getShitemVO(String usernick);
	
	int completedIstate(String ititle, String usernick);
	
	
	List<PurchasedetailsVO> getPhVO(String usernick);
	
	int insertPurchase(PurchasedetailsVO pvo,String purchaser, String usernick , String ititle);
}
