package com.kgitbank.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.mapper.WYmarketMapper;
import com.kgitbank.model.UserInfo;

@Service
public class WYmarketServiceImpl implements WYmarketService{

	@Autowired
	private WYmarketMapper wyMarketMapper;
	
	@Override
	public List<Map<String, Object>> getUserInfoByPhone(String phoneNumber) {
		return wyMarketMapper.getUserInfoByPhone(phoneNumber);
	}

	@Override
	public int insertUserInfo(UserInfo userInfo) {
		return wyMarketMapper.insertUserInfo(userInfo);
	}

	@Override
	public int updateUserInfo(UserInfo userInfo) {
		return wyMarketMapper.updateUserInfo(userInfo);
	}

	@Override
	public int insertSMS(String phoneNumber) {
		return wyMarketMapper.insertSMS(phoneNumber);
	}

	@Override
	public int updateSMS(UserInfo userInfo) {
		return wyMarketMapper.updateSMS(userInfo);
	}

	@Override
	public int selectphonenumber(String phoneNumber) {
		return wyMarketMapper.selectphonenumber(phoneNumber);
	}

	@Override
	public int selectusernick(String userNick) {
		return wyMarketMapper.selectusernick(userNick);
	}

	@Override
	public int insertUserPhNk(UserInfo userInfo) {
		return wyMarketMapper.insertUserPhNk(userInfo);
	}












}
