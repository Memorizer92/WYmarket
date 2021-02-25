package com.kgitbank.mapper;

import com.kgitbank.model.UserInfo;

public interface UserMapper {
	
	public int insertUser(UserInfo userInfo);
	
	public int selectKakaoMail(String mail);

}
