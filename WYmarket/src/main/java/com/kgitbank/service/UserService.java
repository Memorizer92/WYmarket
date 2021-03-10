package com.kgitbank.service;

import com.kgitbank.model.UserInfo;

public interface UserService {

	
	public int insertUser(UserInfo userInfo);
	
	public int selectKakaoMail(String mail);
	
	public void deleteUserInfo(String userNick); 
	public void insertWithdrawal(String userNick,String ncontent, String phoneNumber,String kakaoMail);
	
} 
