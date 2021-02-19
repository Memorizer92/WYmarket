package com.kgitbank.controller.rest;

import java.util.Arrays;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.kgitbank.model.UserInfo;
import com.kgitbank.service.GpsToAddress;
import com.kgitbank.service.WYmarketService;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@RestController
//@RequestMapping("/rest")
@SessionAttributes({"smscodes","phonenumber"})
public class RestControllerMain {

	@Autowired
	private WYmarketService wyMarketService;
	
	private String newAddress = null;
	
	// 위도 경도를 주소로 변환하고 DB에 저장하고 다시 메인페이지로 이동
	@GetMapping(value = { "/wymarket/address/{lat}/{lon:.+}" }, produces = "text/html; charset=UTF-8")
	public String gpsGet(@PathVariable("lat") double lat, @PathVariable("lon") double lon,
			Model model) {
		System.out.println(lat);
		System.out.println(lon);
		try {
			String address = new GpsToAddress(lat, lon).getAddress();
			System.out.println(address);
			String[] addressPart = address.split(" ");
			
			for(int i = 0; i < addressPart.length; i++) {
				for(int j = 0; j < addressPart[i].length(); j++) {
					if(addressPart[i].charAt(j) == '동' && j == addressPart[i].length() - 1) {
						newAddress = addressPart[i];
					}
				}
			}
			System.out.println(Arrays.toString(addressPart));
			System.out.println(newAddress);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "<h5>가입하고 " + newAddress + " 중고 상품을 구경하세요!<h5/>";
	}
	
	
	@PostMapping(value = { "wymarket/getsms/{sms}"} , produces = "text/html; charset=UTF-8")
	public String sendSMS(@PathVariable("sms") String phoneNumber, UserInfo userInfo,
			 Model model) {

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		
		System.out.println("수신자 번호 : " + phoneNumber);
		System.out.println("인증번호 : " + numStr);
		model.addAttribute("smscodes", numStr);
		model.addAttribute("phonenumber", phoneNumber);
		// certificationService.certifiedPhoneNumber(phoneNumber,numStr);

		String dashPhoneNumber = phoneNumber.substring(0, 3) + "-" + phoneNumber.substring(3, 7) + "-"
				+ phoneNumber.substring(7);
		
		
		System.out.println(wyMarketService.getUserInfoByPhone(dashPhoneNumber));

		if (wyMarketService.getUserInfoByPhone(dashPhoneNumber).size() == 0) {
			wyMarketService.insertSMS(dashPhoneNumber);
			model.addAttribute(phoneNumber, 1);
		} else {
			for (Map<String, Object> user : wyMarketService.getUserInfoByPhone(dashPhoneNumber)) {
				userInfo.setPhoneNumber(dashPhoneNumber);
				userInfo.setSmsCnt(Integer.parseInt(String.valueOf(user.get("SMSCNT"))));
				if (Integer.parseInt(String.valueOf(user.get("SMSCNT"))) >= 3) {
					System.out.println("3회 초과됨");
				} else {
					wyMarketService.updateSMS(userInfo);
					model.addAttribute(phoneNumber, user.get("SMSCNT"));
				}
			}
		}
		return numStr; // uri 반환 !!!
	}
	
	@PostMapping(value = { "wymarket/getph/{sms}"} , produces = "text/html; charset=UTF-8")
	public String sendph(@PathVariable("sms") String phoneNumber, UserInfo userInfo,
			 Model model) {

		return phoneNumber; // uri 반환 !!!
	}
	
}
