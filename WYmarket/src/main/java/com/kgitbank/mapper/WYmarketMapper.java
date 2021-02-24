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
	int updateAdminMemo(AdminInfo adminInfo);
	String selectAdminMemo(AdminInfo adminInfo);
	
	int selectUserCount();
	List<Map<String, Object>> selectUserList(Pagination pagination);

	List<UserInfo> selectUserById(@Param("search") String search);
	List<UserInfo> selectUserByNick(@Param("search") String search);
	List<UserInfo> selectUserByAddress(@Param("search") String search);
	
	int updateUserBan(String userNick);
}
