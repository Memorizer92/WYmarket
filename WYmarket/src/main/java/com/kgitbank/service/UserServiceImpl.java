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
	public int insertUser(User user) {
	 
		return user_mapper.insertUser(user);
	}

	@Override
	public int selectKakaoMail(String mail) {
		 
		return user_mapper.selectKakaoMail(mail);
	}

}
