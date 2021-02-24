package com.kgitbank.controller;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kgitbank.model.Pagination;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.PageService;
import com.kgitbank.service.WYmarketService;

@Controller
@SessionAttributes({"users", "list"})
@Scope("session")
public class AdminController implements Serializable{

	@Autowired
	WYmarketService wyMarketService;

	boolean flag = false;
	
	// 관리자 로그인

	// http://localhost:8080/practice_mvc/empQuiz/main?pageNum=2&amount=15
	@GetMapping(value = "/admin")
	public String adminLoginPage(Model model, Pagination pagination, HttpSession session) {

		pagination.setTotal(wyMarketService.selectUserCount());
		PageService pageService = new PageService(pagination);

		if(!flag) {
			model.addAttribute("users", wyMarketService.selectUserList(pagination));
		}
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("pageService", pageService);

		model.addAttribute("delPageIndicator", pagination.getPageNum());
		model.addAttribute("delAmountIndicator", pagination.getAmount());

		System.out.println("관리자페이지 세션에 든 값 : " + session.getAttribute("Admin"));
		
		return "/admin/admin";
	}

	@GetMapping("/admin/board")
	public String adminUserSearch(HttpServletRequest request, Model model, Pagination page) {
		String list = request.getParameter("list");
		String search = request.getParameter("search");
		page.setSearch(search);
		model.addAttribute("list",list);
		System.out.println(list);
		System.out.println(search);
		if(list.equals("userId")) {
			List<UserInfo> selectUserById = wyMarketService.selectUserById(page);
			model.addAttribute("users", selectUserById);
		} else if(list.equals("userNick")) {
			List<UserInfo> selectUserByNick = wyMarketService.selectUserByNick(page);
			model.addAttribute("users", selectUserByNick);
		} else if(list.equals("address")) {
			List<UserInfo> selectUserByAddress = wyMarketService.selectUserByAddress(page);
			model.addAttribute("users", selectUserByAddress);
		}
		flag = true;
		
		return "redirect:/admin";
	}
	
	@GetMapping("/admin/ban/{userNick}")
	public String adminUserBan(@PathVariable("userNick") String userNick, Model model) {
		int updateBan = wyMarketService.updateUserBan(userNick);
		System.out.println("updateBan : " + updateBan);
		
		return "/admin/admin";
	}

}





