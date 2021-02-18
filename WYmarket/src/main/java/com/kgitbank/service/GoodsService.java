package com.kgitbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.mapper.goodsMapper;
import com.kgitbank.model.GoodsVO;

@Service
public class GoodsService implements GoodsServiceImpl{
	
	@Autowired
	goodsMapper goods_mapper;

	@Override
	public int createGoods(GoodsVO goods) {
		return goods_mapper.createGoods(goods);
	}

}
