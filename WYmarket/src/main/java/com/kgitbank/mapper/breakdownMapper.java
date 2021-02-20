package com.kgitbank.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kgitbank.model.PurchasedetailsVO;
import com.kgitbank.model.ShItemVO;

public interface breakdownMapper {

	List<ShItemVO>  getShitemVO(String usernick); 
		
	int completedIstate(
			@Param("istate") String istate, 
			@Param("ititle") String ititle,
			@Param("usernick") String usernick);
	
	
	
	List<PurchasedetailsVO> getPhVO(String purchaser);
	
	int insertPurchase(
			PurchasedetailsVO pvo,
			@Param("purchaser") String purchaser,
			@Param("usernick") String usernick,
			@Param("ititle") String ititle,
			@Param("istate") String istate);
	
	
		
	
	
			
}
