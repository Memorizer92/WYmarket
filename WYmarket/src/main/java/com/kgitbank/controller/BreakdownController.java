package com.kgitbank.controller;

import java.net.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.kgitbank.model.PurchasedetailsVO;
import com.kgitbank.model.ShItemVO;
import com.kgitbank.service.BreakdownService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/param/")
@Log4j
public class BreakdownController {

	@Setter(onMethod_ = {@Autowired})
	BreakdownService bservice;
	
	
	@GetMapping("/test01")
	public String test01() {
		return "/test01";
	}
	
	@GetMapping("/sale") // 판매중 화면
	public String sale(Model model) {	
		model.addAttribute("vo", bservice.getShitemVO());
		return "/breakdown/sale/salePage";
	}
	
	
	  @GetMapping("/salecomplete") // 거래 완료 화면
	  public String gSalecomplete(Model model) { 
	  model.addAttribute("vo", bservice.getShitemVO()); 
	  return "/breakdown/sale/saleCompletedPage"; 
	  }
	
	  @PostMapping("/salecomplete/{ititle}/{usernick}")  // 거래 완료 버튼
		public String pSalecomplete(Model model,PurchasedetailsVO puvo , @PathVariable("ititle") String ititle, @PathVariable("usernick") String usernick) {			
			bservice.completedIstate(ititle);
			bservice.insertPurchase(puvo, usernick, ititle);
			model.addAttribute("vo", bservice.getShitemVO());
			
			return "/breakdown/sale/salePage";
		}
	
	@GetMapping("/purchase")
	public String purchase(Model model) {	
		model.addAttribute("vo", bservice.getShitemVO());
		model.addAttribute("phvo", bservice.getPhVO());
		return "/breakdown/purchasePage";
	}
	
	
	
	
//	@GetMapping("TransactionCompleted")
//	public String TransactionCompleted() {
//		return null;
//	}
	
	
	
	
}
