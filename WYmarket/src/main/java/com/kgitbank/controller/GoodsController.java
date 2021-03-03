package com.kgitbank.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

//import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.model.GoodsVO;
import com.kgitbank.service.GoodsService;
import com.kgitbank.util.UploadFileUtils;

//import com.kgitbank.secondhandmarket.service.GoodsService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/goods/*")
@Log4j
@SessionAttributes("usernick")
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
	public String success(Model model, GoodsVO goods, MultipartFile file, HttpSession session) throws IOException, Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		String userNick = (String) session.getAttribute((String) model.getAttribute("usernick"));
		model.addAttribute("usernick", userNick);		

		if(file != null) {
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		goods.setIimagepath(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		
		int result = gservice.createGoods(goods, userNick);
		
		return "redirect:/main";
	}
	
	//상품 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String getList(@RequestParam("n") int itemid, Model model) {
		GoodsVO goods = gservice.getGoods(itemid);
		model.addAttribute("goods",goods);
		
		return "goods/view";
	}
	
	 

}
