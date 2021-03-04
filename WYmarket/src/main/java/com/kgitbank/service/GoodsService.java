package com.kgitbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.mapper.goodsMapper;
import com.kgitbank.model.GoodsVO;
import com.kgitbank.model.UserInfo;

@Service
public class GoodsService implements GoodsServiceImpl{
	
	@Autowired
	goodsMapper goods_mapper;
	
	@Override
	public List<GoodsVO> getGoodsList(){
		return goods_mapper.getGoodsList();
	}

	@Override
	public GoodsVO getGoods(int itemid) {		
		return goods_mapper.getGoods(itemid);
	}
	
	@Override
	public void goodsModify(GoodsVO goods) {
		goods_mapper.goodsModify(goods);
	}



	@Override
	public int createGoods(GoodsVO goods, String user, String ititle, String icategory,
			String icontent, Integer price) {
		return goods_mapper.createGoods(goods, user, ititle, icategory, icontent, price);
	}

}
