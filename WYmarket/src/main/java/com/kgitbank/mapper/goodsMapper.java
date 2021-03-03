package com.kgitbank.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kgitbank.model.GoodsVO;

public interface goodsMapper {

	public List<GoodsVO> getGoodsList();
	
	public int createGoods(GoodsVO goods,
			@Param("usernick") String usernick
			);
	
	public GoodsVO getGoods(int itemid);

}
