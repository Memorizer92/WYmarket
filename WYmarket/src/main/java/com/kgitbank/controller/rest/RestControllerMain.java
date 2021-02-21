package com.kgitbank.controller.rest;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.Arrays;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.kgitbank.controller.LoginFormController;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.GpsDistance;
import com.kgitbank.service.GpsToAddress;
import com.kgitbank.service.WYmarketService;
import com.kgitbank.service.certificationService;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RestController
@SessionAttributes({ "smscodes", "phonenumber", "check", "lat", "lon", "address", "usernick", "findph" })
public class RestControllerMain {

	@Autowired
	private WYmarketService wyMarketService;

	private String newAddress = null;

	private int result = 0;

	// 위도 경도를 주소로 변환하고 DB에 저장하고 다시 메인페이지로 이동
	@GetMapping(value = { "/wymarket/address/{lat}/{lon:.+}" }, produces = "text/html; charset=UTF-8")
	public String gpsGet(@PathVariable("lat") double lat, @PathVariable("lon") double lon, Model model,
			HttpSession session) {
		System.out.println(lat);
		System.out.println(lon);
		model.addAttribute("lat", lat);
		model.addAttribute("lon", lon);

		double distanceKiloMeter = GpsDistance.distance(lat, lon, 37.338936, 127.111150, "kilometer");
		System.out.println("두 위치 간 km" + distanceKiloMeter);

		try {
			String address = new GpsToAddress(lat, lon).getAddress();
			System.out.println(address);
			model.addAttribute("address", address);
			String[] addressPart = address.split(" ");

			for (int i = 0; i < addressPart.length; i++) {
				for (int j = 0; j < addressPart[i].length(); j++) {
					if (addressPart[i].charAt(j) == '동' && j == addressPart[i].length() - 1) {
						newAddress = addressPart[i];
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "<p>가입하고 " + newAddress + "<br>중고 상품을 구경하세요!<p/>";
	}

	@PostMapping(value = { "wymarket/getsms/{sms}" }, produces = "text/html; charset=UTF-8")
	public String sendSMS(@PathVariable("sms") String phoneNumber, UserInfo userInfo, Model model,
			HttpSession session) {

		String ip = null;
		
		try {
			ip = Inet4Address.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String numStr = "";
		
		if (wyMarketService.getIpCnt(ip) == 0) {
			int insertIp = wyMarketService.insertIp(ip);
			System.out.println("insertIp : " + insertIp);
			session.setAttribute("smsCnt", insertIp);
		} else {
			int smsCnt = wyMarketService.getSmsCnt(ip);
			System.out.println("smsCnt : " + smsCnt);
			if (smsCnt >= 3) {
				session.setAttribute("smsCnt", smsCnt);
			} else {
				int updateIpCnt = wyMarketService.updateIpCnt(ip);
				System.out.println("updateIp : " + updateIpCnt);
				
				session.setAttribute("smsCnt", smsCnt);
				
				Random rand = new Random();
				
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
				int result = wyMarketService.selectphonenumber(dashPhoneNumber);
				System.out.println("이게 널이 뜬다고?" + result);
				this.result = result;

				String userNick = wyMarketService.getUserNickByPh(dashPhoneNumber);
				System.out.println(userNick);
				if (userNick != null) {
					model.addAttribute("usernick", userNick);
					session.setAttribute(userNick, userNick);
				}
			}
		}
		


		return numStr; // uri 반환 !!!
	}

	@PostMapping(value = { "wymarket/getph/{sms}" }, produces = "text/html; charset=UTF-8")
	public String sendph(@PathVariable("sms") String phoneNumber, UserInfo userInfo, Model model) {

		return phoneNumber; // uri 반환 !!!
	}

	@PostMapping(value = { "/toNick" }, produces = "text/html; charset=UTF-8")
	public String toNick(Model model) {

		System.out.println(result);
		String check = String.valueOf(result);

		return check; // uri 반환 !!!
	}

	@PostMapping(value = "/selectNick", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public String selectNick(@RequestBody UserInfo userInfo, Model model) {

		int nickCnt = wyMarketService.selectusernick(userInfo.getUserNick());
		String cntStr = String.valueOf(nickCnt);
		model.addAttribute("check", cntStr);

		return cntStr;
	}

	@PostMapping(value = "/updateNick", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public String updateNick(@RequestBody UserInfo userInfo, Model model, HttpSession session) {

		userInfo.setLatitude((double) model.getAttribute("lat"));
		userInfo.setLongitude((double) model.getAttribute("lon"));
		userInfo.setAddress((String) model.getAttribute("address"));

		model.addAttribute("usernick", userInfo.getUserNick());
		session.setAttribute(userInfo.getUserNick(), userInfo.getUserNick());
		System.out.println(session.getAttribute(userInfo.getUserNick()));

		String dashPhoneNumber = userInfo.getPhoneNumber().substring(0, 3) + "-"
				+ userInfo.getPhoneNumber().substring(3, 7) + "-" + userInfo.getPhoneNumber().substring(7);
		userInfo.setPhoneNumber(dashPhoneNumber);

		System.out.println(userInfo);

		int result = wyMarketService.insertUserPhNk(userInfo);
		System.out.println(result);

		return null;
	}

}
