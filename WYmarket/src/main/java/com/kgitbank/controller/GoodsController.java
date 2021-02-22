package com.kgitbank.controller;

import java.io.File;
import java.io.IOException;

//import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.model.GoodsVO;
import com.kgitbank.service.GoodsService;
import com.kgitbank.util.UploadFileUtils;

//import com.kgitbank.secondhandmarket.service.GoodsService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/goods/*")
@Log4j
public class GoodsController {
	
	@Autowired
	GoodsService gservice;
	
	@Autowired
	private String uploadPath;
	
	// 상품등록페이지
	@GetMapping("register") 
	public void getGoodsRegister() throws
	Exception{
		log.info("상품등록페이지");
	}
	
	// 상품 등록
	@PostMapping("add")
	public String success(Model model, GoodsVO goods, MultipartFile file) throws IOException, Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		goods.setIimagepath(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		//goods.setIthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		int result = gservice.createGoods(goods);
		
		String msg = result > 0 ? "상품이 정상적으로 등록되었습니다" : "등록 실패하셨습니다";
		model.addAttribute("msg",msg);
		
		return "goods/success";
	}
	
//	// 상품 등록 및 조회
//	@PostMapping("add")
//	public 

}
