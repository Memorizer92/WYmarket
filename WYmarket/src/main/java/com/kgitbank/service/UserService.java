package com.kgitbank.service;

import com.kgitbank.model.User;

public interface UserService {

	public int insertUser(User user);
	
	public int selectKakaoMail(String mail);
	
}
