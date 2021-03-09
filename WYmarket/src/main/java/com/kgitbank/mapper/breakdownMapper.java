package com.kgitbank.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kgitbank.model.PurchasedetailsVO;
import com.kgitbank.model.ShItemVO;
import com.kgitbank.model.ShUserInfoVO;

public interface breakdownMapper {

	
	List<ShUserInfoVO> getShuserInfo();
		
	List<ShItemVO>  getShitemVO(String usernick); 
			
	List<PurchasedetailsVO> getPurchaserPhVO(String purchaser);
	
	List<PurchasedetailsVO> getSellerPhVO(String usernick);
	
	
	int completedIstate(
			@Param("istate") String istate, 
			@Param("ititle") String ititle,
			@Param("usernick") String usernick,
			@Param("itemid") String itemid
			);
	
	int hiddenIstate(
			@Param("istate") String istate, 
			@Param("ititle") String ititle,
			@Param("usernick") String usernick,
			@Param("itemid") String itemid
			);
	
	int reservationStateChange(
			@Param("iReservationState") String iReservationState, 
			@Param("ititle") String ititle,
			@Param("istate") String istate, 
			@Param("usernick") String usernick,
			@Param("itemid") String itemid);
			
	int insertPurchase(
			PurchasedetailsVO pvo,
			@Param("purchaser") String purchaser,
			@Param("usernick") String usernick,
			@Param("ititle") String ititle,
			@Param("istate") String istate,
			@Param("itemid") String itemid
			);
	
	int productPullUp(
			@Param("ititle") String ititle, 
			@Param("usernick") String usernick,
			@Param("istate") String istate,
			@Param("itemid") String itemid
			);
	
	int productDelete(
			@Param("ititle") String ititle, 
			@Param("usernick") String usernick,
			@Param("istate") String istate,
			@Param("itemid") String itemid
			);

	int purchasedetailsCount(
			@Param("usernick") String usernick
			);
		
	
	
			
}
