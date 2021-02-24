//package com.kgitbank.controller;
//
//import java.net.Inet4Address;
//import java.net.UnknownHostException;
//import java.util.Calendar;
//import java.util.Date;
//import java.util.Map;
//import java.util.Random;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//
//import com.kgitbank.model.AdminInfo;
//import com.kgitbank.model.UserIP;
//import com.kgitbank.model.UserInfo;
//import com.kgitbank.service.WYmarketService;
//
//@Controller
//public class SignUpLogInController {
//
//	@Autowired
//	private WYmarketService wyMarketService;
//
//	// 로그인
//	@GetMapping("/login")
//	public String loginPageGet(Model model, HttpSession session) {
//
//		return "/login/login";
//	}
//
//	@GetMapping("/loginModal")
//	public String loginPagePost(Model model, HttpSession session) {
//
//		return "/login/login";
//	}
//
//	@PostMapping(value = { "/getsms/{phoneNumber}" })
//	public String getSms(@PathVariable("phoneNumber") String phoneNumber, UserInfo userInfo, Model model,
//			HttpSession session, UserIP userIp) {
//
//		String ip = null;
//
//		try {
//			ip = Inet4Address.getLocalHost().getHostAddress();
//		} catch (UnknownHostException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		String numStr = "";
//
//		model.addAttribute("mainModal", 1);
//		
//		if (wyMarketService.getSmsCnt(ip) <= 2 || wyMarketService.getIpCnt(ip) == 0) {
//
//			if (wyMarketService.getIpCnt(ip) == 0) {
//				int insertIp = wyMarketService.insertIp(ip);
//			} else {
//				wyMarketService.updateIpCnt(ip); // cnt 증가
//			}
//
//			Random rand = new Random();
//
//			for (int i = 0; i < 4; i++) {
//				String ran = Integer.toString(rand.nextInt(10));
//				numStr += ran;
//			}
//
//			System.out.println("수신자 번호 : " + phoneNumber);
//			System.out.println("인증번호 : " + numStr);
//			session.setAttribute("phonenumber", phoneNumber);
//			session.setAttribute("smscodes", numStr);
//			// certificationService.certifiedPhoneNumber(phoneNumber,numStr);
//			String dashPhoneNumber = phoneNumber.substring(0, 3) + "-" + phoneNumber.substring(3, 7) + "-"
//					+ phoneNumber.substring(7);
//
//			int result = wyMarketService.getAdminPhCount(dashPhoneNumber);
//			session.setAttribute("adminExist", result);
//
//			if (result == 0) {
//				result = wyMarketService.selectphonenumber(dashPhoneNumber);
//				session.setAttribute("userExist", result);
//			}
//
//			if (wyMarketService.getSmsCnt(ip) == 2) {
//
//				wyMarketService.insertSmsExceedDate(ip);
//
//			}
//		} else {
//
//			Calendar getToday = Calendar.getInstance();
//			getToday.setTime(new Date()); // 현재 날짜
//
//			Calendar cmpDate = Calendar.getInstance();
//
//			cmpDate.setTime(wyMarketService.getSmsExceedDate(ip)); // 특정 일자
//
//			long diffSec = (getToday.getTimeInMillis() - cmpDate.getTimeInMillis()) / 1000;
//			long diffDays = diffSec / (24 * 60 * 60); // 일자수 차이
//
//			System.out.println(diffSec + "초 차이");
//			System.out.println(diffDays + "일 차이");
//			if (diffSec >= 30) {
//
//				int exceedUpdate = wyMarketService.updateSmsExceedDate(ip);
//				Random rand = new Random();
//
//				for (int i = 0; i < 4; i++) {
//					String ran = Integer.toString(rand.nextInt(10));
//					numStr += ran;
//				}
//
//				System.out.println("수신자 번호 : " + phoneNumber);
//				System.out.println("인증번호 : " + numStr);
//				session.setAttribute("phonenumber", phoneNumber);
//				session.setAttribute("smscodes", numStr);
//				// certificationService.certifiedPhoneNumber(phoneNumber,numStr);
//				String dashPhoneNumber = phoneNumber.substring(0, 3) + "-" + phoneNumber.substring(3, 7) + "-"
//						+ phoneNumber.substring(7);
//
//				int result = wyMarketService.getAdminPhCount(dashPhoneNumber);
//				session.setAttribute("adminExist", result);
//
//				if (result == 0) {
//					result = wyMarketService.selectphonenumber(dashPhoneNumber);
//					session.setAttribute("userExist", result);
//				}
//			}
//		}
//
//		return "redirect:/loginModal";
//	}
//}
