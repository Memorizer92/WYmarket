package com.kgitbank.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kgitbank.model.GoodsVO;
import com.kgitbank.model.UserInfo;

public interface goodsMapper {

	public List<GoodsVO> getGoodsList(String userNick);
	
	public int createGoods(GoodsVO goods, 
			@Param("user") String user,
			/* @Param("iimagepath") String iimagepath, */
			@Param("ititle") String ititle,
			@Param("icategory") String icategory,
			@Param("icontent") String icontent,
			@Param("price") Integer price
			);//, @Param("userNick") String userNick
	
	public GoodsVO getGoods(int itemid);

	public void goodsModify(GoodsVO goods);
}
