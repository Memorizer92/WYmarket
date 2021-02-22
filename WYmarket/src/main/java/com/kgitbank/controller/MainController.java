package com.kgitbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kgitbank.service.GoodsService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@SessionAttributes({"usernick"})
public class MainController {
	
	@Autowired
	GoodsService gservice;
	
	//메인페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPageGET(HttpSession session, Model model) {
		log.info("메인 페이지");
		System.out.println("메인페이지 세션 값 : " + session.getAttribute((String) model.getAttribute("usernick")));
	
		model.addAttribute("goods", gservice.getGoodsList());
		
		return "/main";
	}
	


}