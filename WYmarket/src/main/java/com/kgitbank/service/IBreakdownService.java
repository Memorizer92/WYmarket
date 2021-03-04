package com.kgitbank.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kgitbank.model.PurchasedetailsVO;
import com.kgitbank.model.ShItemVO;
import com.kgitbank.model.ShUserInfoVO;

public interface IBreakdownService {

	List<ShUserInfoVO> getShuserInfo();
	
	List<ShItemVO>  getShitemVO(String usernick);
	
	List<PurchasedetailsVO> getPurchaserPhVO(String usernick);
	
	List<PurchasedetailsVO> getSellerPhVO(String usernick);
	
	int completedIstate(String istate, String ititle, String usernick, String itemid);
	
	int hiddenIstate(String istate, String ititle, String usernick, String itemid);
	
	int reservationStateChange(String iReservationState, String ititle, String usernick, String itemid);
			
	int insertPurchase(PurchasedetailsVO pvo,String purchaser, String usernick, String ititle, String istate, String itemid);

	int productPullUp(String ititle, String usernick,String istate, String itemid);
	
	int productDelete(String ititle, String usernick,String istate, String itemid);
	

	

}
