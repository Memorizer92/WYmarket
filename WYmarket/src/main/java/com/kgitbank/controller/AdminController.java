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
@SessionAttributes({ "users", "list", "search", "page"})
@Scope("session")
public class AdminController implements Serializable {

	@Autowired
	WYmarketService wyMarketService;

	boolean flag = false;

	String listKind = "all";

	// 관리자 로그인

	// http://localhost:8080/practice_mvc/empQuiz/main?pageNum=2&amount=15
	@GetMapping(value = "/admin")
	public String adminLoginPage(Model model, Pagination pagination, HttpSession session) {

		System.out.println(listKind);
		if (listKind.equals("all")) {
			pagination.setTotal(wyMarketService.selectUserCount());
		} else if (listKind.equals("id")) {
			Pagination page = (Pagination) model.getAttribute("page");
			page.setTotal(wyMarketService.selectUserCountId((String) model.getAttribute("search")));
		} else if (listKind.equals("nick")) {
			Pagination page = (Pagination) model.getAttribute("page");
			page.setTotal(wyMarketService.selectUserCountNick((String) model.getAttribute("search")));
		} else if (listKind.equals("address")) {
			Pagination page = (Pagination) model.getAttribute("page");
			page.setTotal(wyMarketService.selectUserCountAddress((String) model.getAttribute("search")));
		}

		
		PageService pageService;
		System.out.println(flag);
		if (!flag) {
			model.addAttribute("users", wyMarketService.selectUserList(pagination));
		    pageService = new PageService(pagination);
		    model.addAttribute("pagination", pagination);
			model.addAttribute("delPageIndicator", pagination.getPageNum());
			model.addAttribute("delAmountIndicator", pagination.getAmount());
		} else {
			System.out.println(model.getAttribute("page"));
			Pagination searchPageNation = (Pagination) model.getAttribute("page");
			pageService = new PageService(searchPageNation);
			model.addAttribute("pagination", searchPageNation);
			model.addAttribute("delPageIndicator", searchPageNation.getPageNum());
			model.addAttribute("delAmountIndicator", searchPageNation.getAmount());
		}
		
		
		
		List<UserInfo> li = (List<UserInfo>) model.getAttribute("users");
		
		System.out.println(li.size());

		
		model.addAttribute("pageService", pageService);



		System.out.println("관리자페이지 세션에 든 값 : " + session.getAttribute("Admin"));

		return "/admin/admin";
	}

	@GetMapping("/admin/board")
	public String adminUserSearch(HttpServletRequest request, Model model, Pagination page) {
		String list = request.getParameter("list");
		String search = request.getParameter("search");
		model.addAttribute("search", search);
		page.setSearch(search);
		model.addAttribute("list", list);
		System.out.println(list);
		System.out.println(search);
		System.out.println(page);
		model.addAttribute("page", page);
		if (list.equals("userId")) {
			List<UserInfo> selectUserById = wyMarketService.selectUserById(page);
			model.addAttribute("users", selectUserById);
			listKind = "id";
		} else if (list.equals("userNick")) {
			List<UserInfo> selectUserByNick = wyMarketService.selectUserByNick(page);
			model.addAttribute("users", selectUserByNick);
			listKind = "nick";
		} else if (list.equals("address")) {
			List<UserInfo> selectUserByAddress = wyMarketService.selectUserByAddress(page);
			model.addAttribute("users", selectUserByAddress);
			listKind = "address";
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
