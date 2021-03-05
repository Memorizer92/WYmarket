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

import com.kgitbank.model.Inquiry;
import com.kgitbank.model.Pagination;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.DateCalc;
import com.kgitbank.service.PageService;
import com.kgitbank.service.WYmarketService;

@Controller
@SessionAttributes({ "users", "lists", "searchs", "user" })
public class AdminController implements Serializable {

	@Autowired
	WYmarketService wyMarketService;

	@Autowired
	DateCalc dateCalc;

	String category = null;
	String categorySearch = null;

	// 관리자 로그인

	@GetMapping(value = "/admin")
	public String adminLoginPage(HttpServletRequest request, Model model, Pagination pagination, HttpSession session) {

		String list = request.getParameter("list");
		String search = request.getParameter("search");

		// 검색을 눌렀을 때 세션에 정보 저장
		if (list != null) {
			session.setAttribute("listSession", list);
			category = (String) session.getAttribute("listSession");
			session.setAttribute("searchSession", search);
			categorySearch = (String) session.getAttribute("searchSession");
		}

		System.out.println("list : " + list);
		System.out.println("search : " + search);
		System.out.println("category : " + category);
		System.out.println("categorySearch : " + categorySearch);

		// select tag 및 input 유지
		model.addAttribute("searchs", search);
		pagination.setSearch(categorySearch);
		model.addAttribute("lists", list);

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

		System.out.println("users 객체 : " + model.getAttribute("users"));

		session.setAttribute("rowCount", pagination.getTotal());

		PageService pageService;

		// 위 정보로 pagination 생성
		pageService = new PageService(pagination);
		model.addAttribute("pagination", pagination);

		model.addAttribute("pageService", pageService);

		System.out.println("관리자페이지 세션에 든 값 : " + session.getAttribute("Admin"));

		return "/admin/admin";
	}

	@GetMapping("/admin/all")
	public String adminSearchAll(HttpSession session, Model model) {
		System.out.println("여기 오나");
		session.removeAttribute("listSession");
		session.removeAttribute("searchSession");
		model.addAttribute("lists", "");
		model.addAttribute("searchs", "");
		category = null;
		categorySearch = null;

		return "redirect:/admin";
	}

	@GetMapping("/admin/usercount")
	public String adminUserCount(HttpSession session, HttpServletRequest req, Pagination pagination, Model model) {
		// 누적 접속자 수를 view에 띄움
		int userCountTotal = wyMarketService.selectUserCountTotal();
		session.setAttribute("userCountTotal", userCountTotal);

		dateCalc = new DateCalc();

		// 현재 연도
		session.setAttribute("currentYear", dateCalc.getYear());
		System.out.println(session.getAttribute("currentYear"));
		// 카테고리를 뭘 눌렀냐에 따라 검색
		// 검색 카테고리 선택에 따라 해당 쿼리 실행 (10줄씩 자른) 그리고 그것을 jsp 테이블에 표현 ("users")
		System.out.println(session.getAttribute("dateTransfer"));

		if (session.getAttribute("signupFlag") != null) {
			pagination.setSearch((String) session.getAttribute("dateTransfer"));
			pagination.setTotal(wyMarketService.selectSignupCountByDate((String) session.getAttribute("dateTransfer")));
			List<UserInfo> selectUserByDate = wyMarketService.selectUserBySignupDate(pagination);
			model.addAttribute("users", selectUserByDate);
		} else {
			if (session.getAttribute("dateTransfer") == null) {
				pagination.setTotal(wyMarketService.selectUserCount());
				model.addAttribute("users", wyMarketService.selectUserList(pagination));
				session.setAttribute("accessCount", pagination.getTotal());
			} else {
				pagination.setSearch((String) session.getAttribute("dateTransfer"));
				pagination.setTotal(
						wyMarketService.selectAccessCountByDate((String) session.getAttribute("dateTransfer")));
				List<UserInfo> selectUserByDate = wyMarketService.selectUserByAccessDate(pagination);
				model.addAttribute("users", selectUserByDate);
			}
		}

		PageService pageService;

		// 위 정보로 pagination 생성
		pageService = new PageService(pagination);
		model.addAttribute("pagination", pagination);

		model.addAttribute("pageService", pageService);

		session.removeAttribute("signupFlag");

		return "/admin/usercount";
	}

	@GetMapping("/admin/usercount/all")
	public String adminUserCountSearchAll(HttpSession session, Model model) {
		session.removeAttribute("dateTransfer");

		return "redirect:/admin/usercount";
	}

	@GetMapping("/admin/dayCheck/{year}/{month}")
	public String adminDayCheck(@PathVariable("year") int year, @PathVariable("month") int month, HttpSession session,
			HttpServletRequest req, Model model) {
		// 해당 일
		session.setAttribute("dayOfMonth", new DateCalc(year, month).getDay());
		session.setAttribute("selectedYear", year);
		session.setAttribute("selectedMonth", month);

		return "redirect:/admin/usercount";
	}

	@GetMapping("/admin/accessUserCount")
	public String accessUserCount(HttpServletRequest request, Model model, HttpSession session) {

		String year = request.getParameter("yearSelect");
		String month = request.getParameter("monthSelect");
		String day = request.getParameter("daySelect");

		System.out.println(year + "/" + month + "/" + day);

		dateCalc = new DateCalc(year, month, day);

		int accessCount = 0;

		accessCount = wyMarketService.selectAccessCountByDate(dateCalc.getTotalDate());
		session.setAttribute("dateTransfer", dateCalc.getTotalDate());

		session.setAttribute("accessCount", accessCount);

		session.setAttribute("selectedYear", year);
		session.setAttribute("selectedMonth", month);
		session.setAttribute("selectedDay", day);

		return "redirect:/admin/usercount";
	}

	@GetMapping("admin/signupUserCount")
	public String signupUserCount(HttpServletRequest request, Model model, HttpSession session) {

		String year = request.getParameter("yearSelect");
		String month = request.getParameter("monthSelect");
		String day = request.getParameter("daySelect");

		System.out.println(year + "/" + month + "/" + day);

		dateCalc = new DateCalc(year, month, day);

		session.setAttribute("signupFlag", true);

		int signupCount = 0;

		signupCount = wyMarketService.selectSignupCountByDate(dateCalc.getTotalDate());
		session.setAttribute("dateTransfer", dateCalc.getTotalDate());

		session.setAttribute("accessCount", signupCount);

		session.setAttribute("selectedYear", year);
		session.setAttribute("selectedMonth", month);
		session.setAttribute("selectedDay", day);

		return "redirect:/admin/usercount";
	}

	@GetMapping("admin/sendInquiry")
	public String sendInquiry(HttpServletRequest request, Model model, HttpSession session) {

		String inquiryCategory = request.getParameter("inquirySelect");
		String inquiryContent = request.getParameter("textArea");

		UserInfo userInfo = (UserInfo) session.getAttribute((String) model.getAttribute("user"));
		String userNick = userInfo.getUserNick();

		Inquiry inquiry = new Inquiry();
		inquiry.setUserNick(userNick);
		inquiry.setInquiryCategory(inquiryCategory);
		inquiry.setInquiryContent(inquiryContent);
		
		wyMarketService.insertInquiryInfo(inquiry);
		
		session.setAttribute("inquiryFlag", 1);
		
		wyMarketService.updateInquiryCountTotal();
		
		session.setAttribute("inquiryCount", wyMarketService.selectInquiryCountTotal());
		
		return "redirect:/board/notice/c";
	}

	@GetMapping("admin/seeInquiry")
	public String seeInquiry(Model model, HttpSession session) {
		
		List<Inquiry> inquiries = wyMarketService.selectInquiryInfo();
		session.setAttribute("inquiries", inquiries);
		
		wyMarketService.resetInquiryCountTotal();
		session.setAttribute("inquiryCount", wyMarketService.selectInquiryCountTotal());
		
		return "/admin/inquiry";
	}
	
}
