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
import oracle.jdbc.proxy.annotation.Post;

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
	
	  @PostMapping("/salecomplete/{ititle}/{usernick}/{istate}")  // 거래 완료 버튼
		public String pSalecomplete(Model model,
				PurchasedetailsVO puvo ,
				@PathVariable("ititle") String ititle,
				@PathVariable("usernick") String purchaser,
				@PathVariable("istate") String istate,
				HttpSession session) {	
		  
		  String usernick = (String) session.getAttribute((String) model.getAttribute("usernick"));
		  	model.addAttribute("usernick", usernick);
		  	 bservice.completedIstate(istate, ititle, usernick);
		    model.addAttribute("itemvo", bservice.getShitemVO(usernick));
		    bservice.insertPurchase(puvo, purchaser, usernick, ititle, istate);
			return "/breakdown/sale/salePage";
		}
	  
	  
	  @GetMapping("/salehidden") // 숨김 화면
	  public String gSalehidden (Model model, HttpSession session) {
		  String userNick = (String) session.getAttribute((String) model.getAttribute("usernick"));
		  model.addAttribute("usernick", userNick);
			model.addAttribute("itemvo", bservice.getShitemVO(userNick));
			model.addAttribute("userinfo", bservice.getShuserInfo());
		  return "/breakdown/sale/hiddenPage";
	  }
	  
	  @PostMapping("/salehidden/{istate}/{ititle}") // 숨기기 버튼 클릭 시
	  public String pSalehidden (Model model,
			  @PathVariable("istate") String istate,
			  @PathVariable("ititle") String ititle,
			  HttpSession session) {
		  String userNick = (String) session.getAttribute((String) model.getAttribute("usernick"));
		  bservice.hiddenIstate(istate, ititle, userNick);
		  model.addAttribute("usernick", userNick);
		  model.addAttribute("itemvo", bservice.getShitemVO(userNick));	  
		  return "/breakdown/sale/hiddenPage";
	  }

	  @PostMapping("/reservation/{iReservationState}/{ititle}") // 예약
	  public String reservation(Model model, @PathVariable("iReservationState") String iReservationState, @PathVariable("ititle") String ititle, HttpSession session) {
		  String userNick = (String) session.getAttribute((String) model.getAttribute("usernick"));
		  bservice.reservationStateChange(iReservationState, ititle, userNick);
		  model.addAttribute("usernick", userNick);
		  model.addAttribute("itemvo", bservice.getShitemVO(userNick));
		  model.addAttribute("userinfo", bservice.getShuserInfo());
		  return "/breakdown/sale/salePage";
	  }
	  
	  
	  
	  
	@GetMapping("/purchase")
	public String purchase(Model model, HttpSession session) {	
		String userNick = (String) session.getAttribute((String) model.getAttribute("usernick"));
		model.addAttribute("itemvo", bservice.getShitemVO(userNick));
		model.addAttribute("phvo", bservice.getPhVO(userNick));
		return "/breakdown/purchasePage";
	}
	
	

			
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
