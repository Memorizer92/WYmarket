package com.kgitbank.mapper;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kgitbank.model.AdminInfo;
import com.kgitbank.model.Pagination;
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
	
	int getAdminPhCount(String phoneNumber);
	Map<String, Object> getAdminInfo(String phoneNumber);
	AdminInfo getAdminInfo2(String phoneNumber);
	int updateAdminMemo(AdminInfo adminInfo);
	String selectAdminMemo(AdminInfo adminInfo);
	
	int selectUserCount();
	List<Map<String, Object>> selectUserList(Pagination pagination);

	int selectUserCountId(String search);
	int selectUserCountNick(String search);
	int selectUserCountAddress(String search);
	
	List<UserInfo> selectUserById(Pagination page);
	List<UserInfo> selectUserByNick(Pagination page);
	List<UserInfo> selectUserByAddress(Pagination page);
	UserInfo selectUserInfo(String phoneNumber);
	
	int updateUserBan(String userNick);
	int updateUserUnBan(String userNick);
	String selectUserBan(String userNick);
	
	int updateUserCountTotal();
	int selectUserCountTotal();

}