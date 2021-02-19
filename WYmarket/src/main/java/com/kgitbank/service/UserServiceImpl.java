package com.kgitbank.service;

import org.springframework.stereotype.Service;

import com.kgitbank.mapper.UserMapper;
import com.kgitbank.model.User;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	private UserMapper user_mapper;
	
	@Override
	public int insertUser(String mail, String nick) {
	 
		return user_mapper.insertUser(mail, nick);
	}

	@Override
	public int selectKakaoMail(String mail) {
		 
		return user_mapper.selectKakaoMail(mail);
	}

}
