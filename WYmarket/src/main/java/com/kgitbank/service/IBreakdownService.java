package com.kgitbank.service;

import java.util.List;

import com.kgitbank.model.PurchasedetailsVO;
import com.kgitbank.model.ShItemVO;

public interface IBreakdownService {

	List<ShItemVO>  getShitemVO();
	
	int completedIstate(String ititle);
	
	
	List<PurchasedetailsVO> getPhVO();
	
	int insertPurchase(PurchasedetailsVO pvo, String usernick , String ititle);
}
