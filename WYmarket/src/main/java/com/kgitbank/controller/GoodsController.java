package com.kgitbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.model.GoodsVO;
import com.kgitbank.service.GoodsService;

//import com.kgitbank.secondhandmarket.service.GoodsService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/goods/*")
@Log4j
public class GoodsController {
	
	@Autowired
	GoodsService gservice;
	
	//@Resource(name = "uploadPath")
	private String uploadPath;
	
	// 상품등록페이지
	@GetMapping("register") 
	public void getGoodsRegister() throws
	Exception{
		log.info("상품등록페이지");
	}
	
	// 상품 등록
	@PostMapping("add")
	public String success(Model model, GoodsVO goods) {
		
		int result = gservice.createGoods(goods);
		
		String msg = result > 0 ? "상품이 정상적으로 등록되었습니다" : "등록 실패하셨습니다";
		model.addAttribute("msg",msg);
		
		return "goods/success";
	}

}
