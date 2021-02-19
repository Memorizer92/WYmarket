package com.kgitbank.controller;

import java.util.Map;
import java.util.Random;

import org.apache.ibatis.binding.BindingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kgitbank.model.UserInfo;
//import com.kgitbank.service.CertificationTimer;
import com.kgitbank.service.GpsToAddress;
import com.kgitbank.service.WYmarketService;
import com.kgitbank.service.certificationService;

@Controller
@SessionAttributes({"smscodes","phonenumber","certcnt"})
public class ShController {

	@Autowired
	private WYmarketService wyMarketService;

	@GetMapping("/login")
	public String loginPage() {
		return "/login/login";
	}

	@PostMapping("/login/usernick")
	public void userNickPage() {

	}

	@GetMapping("/NewFile2")
	public void gpsCheck() {

	}

//	@PostMapping("/wymarket/getsms/{sms}")
//	public String sendSMS(@PathVariable("sms") String phoneNumber, UserInfo userInfo,
//			RedirectAttributes rttr, Model model) {
//
//		Random rand = new Random();
//		String numStr = "";
//		for (int i = 0; i < 4; i++) {
//			String ran = Integer.toString(rand.nextInt(10));
//			numStr += ran;
//		}
//		
//		System.out.println("수신자 번호 : " + phoneNumber);
//		System.out.println("인증번호 : " + numStr);
//		rttr.addFlashAttribute("smscodes", numStr);
//		rttr.addFlashAttribute("phonenumber", phoneNumber);
//		// certificationService.certifiedPhoneNumber(phoneNumber,numStr);
//
//		String dashPhoneNumber = phoneNumber.substring(0, 3) + "-" + phoneNumber.substring(3, 7) + "-"
//				+ phoneNumber.substring(7);
//		
//		
//		System.out.println(wyMarketService.getUserInfoByPhone(dashPhoneNumber));
//
//		if (wyMarketService.getUserInfoByPhone(dashPhoneNumber).size() == 0) {
//			wyMarketService.insertSMS(dashPhoneNumber);
//			rttr.addFlashAttribute(phoneNumber, 1);
//		} else {
//			for (Map<String, Object> user : wyMarketService.getUserInfoByPhone(dashPhoneNumber)) {
//				userInfo.setPhoneNumber(dashPhoneNumber);
//				userInfo.setSmsCnt(Integer.parseInt(String.valueOf(user.get("SMSCNT"))));
//				if (Integer.parseInt(String.valueOf(user.get("SMSCNT"))) >= 3) {
//					System.out.println("3회 초과됨");
//				} else {
//					wyMarketService.updateSMS(userInfo);
//					rttr.addFlashAttribute(phoneNumber, user.get("SMSCNT"));
//				}
//			}
//		}
//		return "redirect:/login"; // uri 반환 !!!
//	}

	@GetMapping(value = { "/NewFile3/{lat}/{lon:.+}" })
	public String gpsGet(@PathVariable("lat") String lat, @PathVariable("lon") String lon) {
		System.out.println(lat);
		System.out.println(lon);
		try {
			Double latParse = Double.parseDouble(lat);
			Double lonParse = Double.parseDouble(lon);
			System.out.println(new GpsToAddress(latParse, lonParse).getAddress());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/home";
	}

}
