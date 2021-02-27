package com.kgitbank.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.mapper.WYmarketMapper;
import com.kgitbank.model.AdminInfo;
import com.kgitbank.model.Pagination;
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

	@Override
	public int getAdminPhCount(String phoneNumber) {
		return wyMarketMapper.getAdminPhCount(phoneNumber);
	}

	@Override
	public Map<String, Object> getAdminInfo(String phoneNumber) {
		return wyMarketMapper.getAdminInfo(phoneNumber);
	}

	@Override
	public int updateAdminMemo(AdminInfo adminInfo) {
		return wyMarketMapper.updateAdminMemo(adminInfo);
	}

	@Override
	public String selectAdminMemo(AdminInfo adminInfo) {
		return wyMarketMapper.selectAdminMemo(adminInfo);
	}

	@Override
	public List<Map<String, Object>> selectUserList(Pagination pagination) {
		return wyMarketMapper.selectUserList(pagination);
	}

	@Override
	public int selectUserCount() {
		return wyMarketMapper.selectUserCount();
	}


	@Override
	public List<UserInfo> selectUserById(Pagination page) {
		return wyMarketMapper.selectUserById(page);
	}

	@Override
	public List<UserInfo> selectUserByNick(Pagination page) {
		return wyMarketMapper.selectUserByNick(page);
	}

	@Override
	public List<UserInfo> selectUserByAddress(Pagination page) {
		return wyMarketMapper.selectUserByAddress(page);
	}

	@Override
	public int updateUserBan(String userNick) {
		return wyMarketMapper.updateUserBan(userNick);
	}

	@Override
	public UserInfo selectUserInfo(String phoneNumber) {
		return wyMarketMapper.selectUserInfo(phoneNumber);
	}

	@Override
	public AdminInfo getAdminInfo2(String phoneNumber) {
		return wyMarketMapper.getAdminInfo2(phoneNumber);
	}

	@Override
	public int selectUserCountId(String search) {		
		return wyMarketMapper.selectUserCountId(search);
	}

	@Override
	public int selectUserCountNick(String search) {
		return wyMarketMapper.selectUserCountNick(search);
	}

	@Override
	public int selectUserCountAddress(String search) {
		return wyMarketMapper.selectUserCountAddress(search);
	}

	@Override
	public int updateUserUnBan(String userNick) {
		return wyMarketMapper.updateUserUnBan(userNick);
	}

	@Override
	public String selectUserBan(String userNick) {
		return wyMarketMapper.selectUserBan(userNick);
	}

	@Override
	public int updateUserCountTotal(int userAccessCount) {
		return wyMarketMapper.updateUserCountTotal(userAccessCount);
	}

	@Override
	public int selectUserCountTotal() {
		return wyMarketMapper.selectUserCountTotal();
	}

	@Override
	public int insertUserAccessDate(String userNick) {
		return wyMarketMapper.insertUserAccessDate(userNick);
	}

	@Override
	public int selectUserAccessCount(String userNick) {
		return wyMarketMapper.selectUserAccessCount(userNick);
	}

	@Override
	public Date selectUserAccessDate(String userNick) {
		return wyMarketMapper.selectUserAccessDate(userNick);
	}

	@Override
	public int selectAccessCount() {
		return wyMarketMapper.selectAccessCount();
	}

	@Override
	public int selectAccessCountByYear(String year) {
		return wyMarketMapper.selectAccessCountByYear(year);
	}













}