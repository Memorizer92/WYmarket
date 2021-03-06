package com.kgitbank.mapper;

import java.util.List;

import com.kgitbank.model.ChattingVO;

public interface ChattingMapper {
	
	public void createChatInfo(ChattingVO vo);
	
	//판매자 닉네임을 통해 채팅방 정보 조회
	public List<ChattingVO> selectSellerName(String sellerName);
	//구매자 닉네임을 통해 채팅방 정보 조회
	public List<ChattingVO> selectBuyerName(String sellerName);
	
	public int updateChatInfo(int roomId);
	
	public int selectRoomId(int roomId);
	
	
	
}
