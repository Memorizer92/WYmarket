package com.kgitbank.controller;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
@SessionAttributes({ "users", "lists", "searchs", "pBan" })
public class AdminController implements Serializable {

	@Autowired
	WYmarketService wyMarketService;

	boolean sustainFlag = false;

	String category = null;
	String categorySearch = null;

	
	// 관리자 로그인

	@GetMapping(value = "/admin")
	public String adminLoginPage(HttpServletRequest request, Model model, Pagination pagination, HttpSession session) {

		String list = request.getParameter("list");
		String search = request.getParameter("search");
		
		// 검색을 눌렀을 때 세션에 정보 저장
		if(list != null) {
			session.setAttribute("listSession", list);
			category = (String) session.getAttribute("listSession");
			session.setAttribute("searchSession", search);
			categorySearch = (String) session.getAttribute("searchSession");
		} 

		// select tag 및 input 유지
		model.addAttribute("searchs", search);
		pagination.setSearch(categorySearch);
		model.addAttribute("lists", list);

		// 정지 버튼 눌렀을 때 해당 pagination  page 유지
		if (sustainFlag) {
			pagination.setPageNum((int) model.getAttribute("pBan"));
		}

		// 카테고리를 뭘 눌렀냐에 따라 검색
		// 검색 카테고리 선택에 따라 해당 쿼리 실행 (10줄씩 자른) 그리고 그것을 jsp 테이블에 표현 ("users")
		if (category == null) {
			pagination.setTotal(wyMarketService.selectUserCount());
			model.addAttribute("users", wyMarketService.selectUserList(pagination));
		} else if (category.equals("userId")) {
			pagination.setTotal(wyMarketService.selectUserCountId(categorySearch));
			List<UserInfo> selectUserById = wyMarketService.selectUserById(pagination);
			model.addAttribute("users", selectUserById);
		} else if (category.equals("userNick")) {
			pagination.setTotal(wyMarketService.selectUserCountNick(categorySearch));
			List<UserInfo> selectUserByNick = wyMarketService.selectUserByNick(pagination);
			model.addAttribute("users", selectUserByNick);
		} else if (category.equals("address")) {
			pagination.setTotal(wyMarketService.selectUserCountAddress(categorySearch));
			List<UserInfo> selectUserByAddress = wyMarketService.selectUserByAddress(pagination);
			model.addAttribute("users", selectUserByAddress);
		}

		session.setAttribute("rowCount", pagination.getTotal());
		
		PageService pageService;

		// 위 정보로 pagination 생성
		pageService = new PageService(pagination);
		model.addAttribute("pagination", pagination);
		model.addAttribute("pBan", pagination.getPageNum());

		model.addAttribute("pageService", pageService);

		System.out.println("관리자페이지 세션에 든 값 : " + session.getAttribute("Admin"));

		sustainFlag = false;

		return "/admin/admin";
	}

	@GetMapping("/admin/all")
	public String adminSearchAll(HttpSession session, Model model) {
			session.removeAttribute("listSession");
			session.removeAttribute("searchSession");
			model.addAttribute("lists","");
			model.addAttribute("searchs","");
			category = null;
			categorySearch = null;
		
		return "redirect:/admin";
	}
	
	@GetMapping("/admin/ban/{userNick}")
	public String adminUserBan(@PathVariable("userNick") String userNick, Model model) {
		int updateBan = wyMarketService.updateUserBan(userNick);
		model.addAttribute("pBan", model.getAttribute("pBan"));

		sustainFlag = true;

		return "redirect:/admin";
	}
	
	@GetMapping("/admin/usercount")
	public String adminUserCount(HttpSession session) {
		// 누적 접속자 수를 view에 띄움
		int userCountTotal = wyMarketService.selectUserCountTotal();
		session.setAttribute("userCountTotal", userCountTotal);
		
		return "/admin/usercount";
	}

}
