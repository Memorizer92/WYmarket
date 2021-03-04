package com.kgitbank.service;


import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kgitbank.model.AdminInfo;
import com.kgitbank.model.Pagination;
import com.kgitbank.model.UserInfo;

public interface WYmarketService {
	
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
	AdminInfo getAdminInfo2();
	int updateAdminMemo(AdminInfo adminInfo);
	String selectAdminMemo(AdminInfo adminInfo);
	
	List<Map<String, Object>> selectUserList(Pagination pagination);
	int selectUserCount();
	
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
	
	int updateUserCountTotal(int userAccessCount);
	int selectUserCountTotal();

	// 일자별 접속자 insert
	int insertUserAccessDate(String userNick);
	// 닉에 따른 일자별 접속자 행 불러오기
	int selectUserAccessCount(String userNick);
	// 닉에 따른 접속 일자 불러오기
	Date selectUserAccessDate(String userNick);
	// 전체 접속자 행 불러오기
	int selectAccessCount();
	
	//  접속자 수 검색
	int selectAccessCountByDate(String totalDate);
	
	// 접속자 정보 검색
	List<UserInfo> selectUserByAccessDate(Pagination page);
	
	// 메일에 따른 사용자 정보 검색
	UserInfo selectUserInfoByMail(String mail);
	// 가입자 수 검색
	int selectSignupCountByDate(String totalDate);
	
	List<UserInfo> selectUserBySignupDate(Pagination page);
	
	int selectIdByUserNick(String userNick);
}






