package com.kgitbank.mapper;

import java.util.List;

import com.kgitbank.model.GoodsVO;

public interface goodsMapper {

	public List<GoodsVO> getGoodsList();
	
	public int createGoods(GoodsVO goods);
	
	public GoodsVO getGoods(int itemid);

}
