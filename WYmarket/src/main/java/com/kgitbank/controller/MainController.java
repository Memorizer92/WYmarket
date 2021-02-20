package com.kgitbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@SessionAttributes({"member"})
public class MainController {
	
	//메인페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET(Model model) {
		log.info("메인 페이지");
		model.addAttribute("member", true);
		System.out.println(model.getAttribute("member"));
	}
	


}