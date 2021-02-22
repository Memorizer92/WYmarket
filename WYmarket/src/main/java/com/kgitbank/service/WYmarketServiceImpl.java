package com.kgitbank.service;

import java.util.Date;
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

	@Override
	public String getUserNickByPh(String phoneNumber) {
		return wyMarketMapper.getUserNickByPh(phoneNumber);
	}

	@Override
	public String getUserNickByMail(String mail) {
		return wyMarketMapper.getUserNickByMail(mail);
	}

	@Override
	public int getIpCnt(String ip) {
		return wyMarketMapper.getIpCnt(ip);
	}

	@Override
	public int insertIp(String ip) {
		return wyMarketMapper.insertIp(ip);
	}

	@Override
	public int updateIpCnt(String ip) {
		return wyMarketMapper.updateIpCnt(ip);
	}

	@Override
	public int getSmsCnt(String ip) {
		return wyMarketMapper.getSmsCnt(ip);
	}

	@Override
	public int insertSmsExceedDate(String ip) {
		return wyMarketMapper.insertSmsExceedDate(ip);
	}

	@Override
	public Date getSmsExceedDate(String ip) {
		return wyMarketMapper.getSmsExceedDate(ip);
	}

	@Override
	public int updateSmsExceedDate(String ip) {
		return wyMarketMapper.updateSmsExceedDate(ip);
	}












}
