package com.kgitbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kgitbank.mapper.breakdownMapper;
import com.kgitbank.model.PurchasedetailsVO;
import com.kgitbank.model.ShItemVO;
import com.kgitbank.model.ShUserInfoVO;


@Service
public class BreakdownService implements IBreakdownService {
	
	String istate = "completed";
	
	
	@Autowired
	breakdownMapper break_mapper;
	
	@Override
	public List<ShItemVO> getShitemVO(String usernick) {
	return break_mapper.getShitemVO(usernick);		
	}

	@Override
	public int completedIstate(String ititle, String usernick) {	
	return break_mapper.completedIstate(istate, ititle, usernick);
	}
	
	@Override
	public List<PurchasedetailsVO> getPhVO(String usernick) {
		return break_mapper.getPhVO(usernick);
	}

	@Override
	public int insertPurchase(PurchasedetailsVO pvo, String purchaser , String usernick,  String ititle) {	
		return break_mapper.insertPurchase(pvo, purchaser, usernick, ititle, istate);
	}

	@Override
	public List<ShUserInfoVO> getShuserInfo() {
		return break_mapper.getShuserInfo();
	}




	
	
	
	

}
