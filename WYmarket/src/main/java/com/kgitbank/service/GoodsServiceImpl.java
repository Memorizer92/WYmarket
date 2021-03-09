package com.kgitbank.service;

import java.util.List;


import com.kgitbank.model.GoodsVO;



public interface GoodsServiceImpl {
	
	public List<GoodsVO> getGoodsList(String userNick); 
	
	
	public int createGoods(GoodsVO goods,String user, String ititle, 
	String icategory, String icontent, Integer price, String iimagepath);
	 
	
	public GoodsVO getGoods(int itemid);
	
	public void goodsModify(GoodsVO goods);

	String getId(String userNick);
	
	 

}
