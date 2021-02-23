package com.kgitbank.service;

import java.util.List;

import com.kgitbank.model.PurchasedetailsVO;
import com.kgitbank.model.ShItemVO;
import com.kgitbank.model.ShUserInfoVO;

public interface IBreakdownService {

	List<ShUserInfoVO> getShuserInfo();
	
	List<ShItemVO>  getShitemVO(String usernick);
	
	
	int completedIstate(String istate, String ititle, String usernick);
	
	int hiddenIstate(String istate, String ititle, String usernick);
	
	int reservationStateChange(String iReservationState, String ititle, String usernick);
		
	List<PurchasedetailsVO> getPurchaserPhVO(String usernick);
	
	List<PurchasedetailsVO> getSellerPhVO(String usernick);
	
	int insertPurchase(PurchasedetailsVO pvo,String purchaser, String usernick, String ititle, String istate );
}
