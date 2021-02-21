package com.kgitbank.controller;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.kgitbank.model.PurchasedetailsVO;
import com.kgitbank.model.ShItemVO;
import com.kgitbank.service.BreakdownService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/param/")
@Log4j
@SessionAttributes("usernick")
public class BreakdownController {

	@Setter(onMethod_ = {@Autowired})
	BreakdownService bservice;
	

	
	@GetMapping("/test01")
	public String test01() {
		return "/test01";
	}

	@GetMapping("/sale") // 판매중 화면
	public String sale(Model model, HttpSession session) {
		String userNick = (String) session.getAttribute((String) model.getAttribute("usernick"));
		model.addAttribute("usernick", userNick);
		model.addAttribute("itemvo", bservice.getShitemVO(userNick));
		model.addAttribute("userinfo", bservice.getShuserInfo());
		return "/breakdown/sale/salePage";
	}
	
	
	  @GetMapping("/salecomplete") // 거래 완료 화면
	  public String gSalecomplete(Model model, HttpSession session) { 
	 String userNick = (String) session.getAttribute((String) model.getAttribute("usernick"));
	  model.addAttribute("itemvo", bservice.getShitemVO(userNick)); 
	  return "/breakdown/sale/saleCompletedPage"; 
	  }
	
	  @PostMapping("/salecomplete/{ititle}/{usernick}")  // 거래 완료 버튼
		public String pSalecomplete(Model model,PurchasedetailsVO puvo , @PathVariable("ititle") String ititle, @PathVariable("usernick") String purchaser, HttpSession session) {			
		  String userNick = (String) session.getAttribute((String) model.getAttribute("usernick"));
		  bservice.completedIstate(ititle, userNick);
			bservice.insertPurchase(puvo, purchaser, userNick, ititle);
			model.addAttribute("itemvo", bservice.getShitemVO(userNick));
			
			return "/breakdown/sale/salePage";
		}
	
	@GetMapping("/purchase")
	public String purchase(Model model, HttpSession session) {	
		String userNick = (String) session.getAttribute((String) model.getAttribute("usernick"));
		model.addAttribute("itemvo", bservice.getShitemVO(userNick));
		model.addAttribute("phvo", bservice.getPhVO(userNick));
		return "/breakdown/purchasePage";
	}
	
	
	
	
//	@GetMapping("TransactionCompleted")
//	public String TransactionCompleted() {
//		return null;
//	}
	
	
	
	
}
