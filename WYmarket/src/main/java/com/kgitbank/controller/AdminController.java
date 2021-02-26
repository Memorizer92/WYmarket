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
@SessionAttributes({ "users", "list", "search", "page", "pBan"})
public class AdminController implements Serializable {

	@Autowired
	WYmarketService wyMarketService;

	String listKind = "all";

	boolean sustainFlag = false;
	
	// 관리자 로그인

	@GetMapping(value = "/admin")
	public String adminLoginPage(Model model, Pagination pagination, HttpSession session) {
		
		
		System.out.println("전체 리스트 통과 후 : " + listKind);
		Pagination page = new Pagination();

		if(sustainFlag) {
			page.setPageNum((int) model.getAttribute("pBan"));
			pagination.setPageNum((int) model.getAttribute("pBan"));
		}
		
		// 카테고리를 뭘 눌렀냐에 따라 검색 controller의 pagination에 "page" 어트리뷰트 할당, 전체 행 수 set
		if (listKind.equals("all")) {
			pagination.setTotal(wyMarketService.selectUserCount());
		} else if (listKind.equals("id")) {
			page = (Pagination) model.getAttribute("page");
			page.setTotal(wyMarketService.selectUserCountId((String) model.getAttribute("search")));
		} else if (listKind.equals("nick")) {
			page = (Pagination) model.getAttribute("page");
			page.setTotal(wyMarketService.selectUserCountNick((String) model.getAttribute("search")));
		} else if (listKind.equals("address")) {
			page = (Pagination) model.getAttribute("page");
			page.setTotal(wyMarketService.selectUserCountAddress((String) model.getAttribute("search")));
		}

		System.out.println("전체를 눌렀을 때의 pageNum : " + pagination.getPageNum());
		System.out.println("검색을 했을 때의 pageNum : " + page.getPageNum());
		
		PageService pageService;
		
		// 전체 리스트 보기일 경우 해당 pagination 정보 사용
		if (listKind.equals("all")) {
			model.addAttribute("users", wyMarketService.selectUserList(pagination));
		    pageService = new PageService(pagination);
		    model.addAttribute("pagination", pagination);
			model.addAttribute("pBan", pagination.getPageNum());
		} 
		// 그 외 (id, nick, address) 일때 해당 pagination 정보 사용
		else {
			System.out.println(model.getAttribute("page"));
			Pagination searchPageNation = page;
			pageService = new PageService(searchPageNation);
			model.addAttribute("pagination", searchPageNation);
			model.addAttribute("pBan", searchPageNation.getPageNum());
		}
		
		model.addAttribute("pageService", pageService);

		System.out.println("관리자페이지 세션에 든 값 : " + session.getAttribute("Admin"));


		
		sustainFlag = false;
		
		return "/admin/admin";
	}

	@GetMapping("/admin/board")
	public String adminUserSearch(HttpServletRequest request, Model model, Pagination page) {
		String list = request.getParameter("list");
		String search = request.getParameter("search");
		model.addAttribute("search", search);
		page.setSearch(search);
		model.addAttribute("list", list);
		// admin controller로 들고 갈 어트리뷰트
		model.addAttribute("page", page);
		// 검색 카테고리 선택에 따라 해당 쿼리 실행 (10줄씩 자른) 그리고 그것을 jsp 테이블에 표현 ("users")
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

		return "redirect:/admin";
	}
	
	@GetMapping("/admin/all")
	public String adminUserSearchAll() {
		listKind = "all";
		System.out.println("전체리스트 통과");
		return "redirect:/admin";
	}

	@GetMapping("/admin/ban/{userNick}")
	public String adminUserBan(@PathVariable("userNick") String userNick, Model model) {
		int updateBan = wyMarketService.updateUserBan(userNick);
		model.addAttribute("pBan", model.getAttribute("pBan"));

		sustainFlag = true;
		
		return "redirect:/admin";
	}

}
	


		//model.addAttribute("delPageIndicator", searchPageNation.getPageNum());
			//model.addAttribute("delAmountIndicator", searchPageNation.getAmount());

			//model.addAttribute("delPageIndicator", pagination.getPageNum());
			//model.addAttribute("delAmountIndicator", pagination.getAmount());