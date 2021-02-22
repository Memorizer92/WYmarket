package com.kgitbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.mapper.goodsMapper;
import com.kgitbank.model.GoodsVO;

@Service
public class GoodsService implements GoodsServiceImpl{
	
	@Autowired
	goodsMapper goods_mapper;
	
	@Override
	public List<GoodsVO> getGoodsList(){
		return goods_mapper.getGoodsList();
	}

	@Override
	public int createGoods(GoodsVO goods) {
		return goods_mapper.createGoods(goods);
	}

	@Override
	public GoodsVO getGoods(int itemid) {		
		return goods_mapper.getGoods(itemid);
	}

}
