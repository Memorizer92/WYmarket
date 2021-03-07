package com.kgitbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kgitbank.model.BoardVO;
import com.kgitbank.service.BoardService;

import com.kgitbank.service.ChattingService;

import com.kgitbank.service.WYmarketService;


@Controller
@RequestMapping("/board/*")
public class BoardController {
 

	@Autowired
	WYmarketService wyMarketService;

	
	//공지사항
	@RequestMapping("notice/{category}")
	public ModelAndView notice(@PathVariable("category") String category, Model model) {
		
		List<BoardVO> list = boardService.listAll();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/notice");//뷰를 list.jsp로 지정
		mav.addObject("list",list);//데이터 저장 
		
		// 관리자로 부터 답변 온 문의 알림 표시
		model.addAttribute("adminToUserCount", wyMarketService.selectInquiryUserCountTotal());
		
		return mav;
	}
	
	//헤더
	@GetMapping("/header")
	public String header( ) {
		 
		return "include/header";
	}
	
	 
	
	
	//풋터
	@GetMapping("/footer")
	public String footer() {
		return "include/footer";
	}
	//이용약관
	@GetMapping("operationTerms")
	public String operationTerms() {
		return "/board/operationTerms";
	}
	
	//개인정보처리방침
	@GetMapping("privacyPolicy")
	public String privacyPolicy() {
		return "/board/privacyPolicy";
	}
	
	@Autowired
	BoardService boardService;
	
	//게시글 목록
	@RequestMapping("list")
	public ModelAndView list() {
		
		List<BoardVO> list = boardService.listAll();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list");//뷰를 list.jsp로 지정
		mav.addObject("list",list);//데이터 저장 
		return mav;
	}
	
	//게시글 작성
	@GetMapping("write")
	public String write() {
		return "/board/write";
	}
	
	//게시글 작성 처리
	@PostMapping("insert")
	public String insert(@ModelAttribute BoardVO vo) {
		
		System.out.println("vo 객체들 : "+vo);
		boardService.create(vo);
		return "redirect:/board/list";
	}
	
	//게시글 내용 조회, 게시글 조회수 증가 처리
	@GetMapping("view")
	public ModelAndView view(@RequestParam int noticeID, HttpSession session) {
		boardService.increaseViewcnt(noticeID,session);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view");
		mav.addObject("vo",boardService.read(noticeID));
		return mav;
	}
	@GetMapping("look")
	public ModelAndView look(@RequestParam int noticeID, HttpSession session) {
		boardService.increaseViewcnt(noticeID,session);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/look");
		mav.addObject("vo",boardService.read(noticeID));
		
		return mav;
	}
	
	
	//게시글 수정
	@PostMapping("update")
	public String update(@ModelAttribute BoardVO vo) {
		boardService.update(vo);
		return "redirect:/board/list";
	}
	
	//게시글 삭제
	@RequestMapping("delete")
	public String delete(@RequestParam int noticeID) {
		boardService.delete(noticeID);
		return "redirect:/board/list";
	}
	
	 
}
