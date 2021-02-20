package com.kgitbank.mapper;

import org.apache.ibatis.annotations.Param;

import com.kgitbank.model.UserInfo;

public interface UserMapper {
	
	public int insertUser(UserInfo userInfo);
	
	public int selectKakaoMail(String mail);

}
