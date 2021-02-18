package com.kgitbank.mapper;

import com.kgitbank.model.User;

public interface UserMapper {
	
	public int insertUser(User user);
	
	public int selectKakaoMail(String mail);

}
