package com.kgitbank.service;


import java.util.List;
import java.util.Map;

import com.kgitbank.model.UserInfo;

public interface WYmarketService {

	List<Map<String, Object>> getUserInfoByPhone(String phoneNumber);
	int insertUserInfo(UserInfo userInfo);
	int updateUserInfo(UserInfo userInfo);
	
	int insertSMS(String phoneNumber);
	int updateSMS(UserInfo userInfo);
	
	int selectphonenumber(String phoneNumber);
	
	int selectusernick(String userNick);
	int insertUserPhNk(UserInfo userInfo);
	
	String getUserNickByPh(String phoneNumber);
	String getUserNickByMail(String mail);
	
}
