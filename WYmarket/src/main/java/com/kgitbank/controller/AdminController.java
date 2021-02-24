package com.kgitbank.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kgitbank.model.Pagination;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.PageService;
import com.kgitbank.service.WYmarketService;

@Controller
public class AdminController {

	@Autowired
	WYmarketService wyMarketService;

	// 관리자 로그인

	// http://localhost:8080/practice_mvc/empQuiz/main?pageNum=2&amount=15
	@GetMapping(value = "/admin")
	public String adminLoginPage(Model model, Pagination pagination) {

		pagination.setTotal(wyMarketService.selectUserCount());
		PageService pageService = new PageService(pagination);

		model.addAttribute("users", wyMarketService.selectUserList(pagination));

		model.addAttribute("pagination", pagination);
		model.addAttribute("pageService", pageService);

		model.addAttribute("delPageIndicator", pagination.getPageNum());
		model.addAttribute("delAmountIndicator", pagination.getAmount());

		return "/admin/admin";
	}

	@GetMapping("/admin/board")
	public String adminUserSearch(HttpServletRequest request, Model model) {
		String list = request.getParameter("list");
		String search = request.getParameter("search");
		model.addAttribute("list",list);
		System.out.println(list);
		System.out.println(search);
		if(list.equals("userId")) {
			List<UserInfo> selectUserById = wyMarketService.selectUserById(search);
			model.addAttribute("users", selectUserById);
		} else if(list.equals("userNick")) {
			List<UserInfo> selectUserByNick = wyMarketService.selectUserByNick(search);
			model.addAttribute("users", selectUserByNick);
		} else if(list.equals("address")) {
			List<UserInfo> selectUserByAddress = wyMarketService.selectUserByAddress(search);
			model.addAttribute("users", selectUserByAddress);
		}
		
			


			
		
		
		return "/admin/admin";
	}

}
