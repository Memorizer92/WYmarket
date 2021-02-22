package com.kgitbank.mapper;


import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kgitbank.model.UserInfo;

public interface WYmarketMapper {

	int selectphonenumber(String phoneNumber);
	
	int selectusernick(String userNick);
	int insertUserPhNk(UserInfo userInfo);
	
	String getUserNickByPh(String phoneNumber);
	String getUserNickByMail(String mail);
	
	int getIpCnt(String ip);
	int insertIp(String ip);
	int updateIpCnt(String ip);
	int getSmsCnt(String ip);
	int insertSmsExceedDate(String ip);
	Date getSmsExceedDate(String ip);
	
	int updateSmsExceedDate(String ip);
}
