package com.kgitbank.service;

import java.util.List;

import com.kgitbank.model.GoodsVO;


public interface GoodsServiceImpl {
	
	public List<GoodsVO> getGoodsList(); 
	
	public int createGoods(GoodsVO goods);
	
	public GoodsVO getGoods(int itemid);

}
