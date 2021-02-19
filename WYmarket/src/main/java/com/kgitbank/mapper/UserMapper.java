package com.kgitbank.mapper;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
	
	public int insertUser(@Param("kakaoMail") String mail, @Param("userNick")  String nick);
	
	public int selectKakaoMail(String mail);

}
