package com.kgitbank.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kgitbank.model.KakaoProfile;
import com.kgitbank.model.OAuthToken;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.UserService;
import com.kgitbank.service.WYmarketService;

@Controller
@SessionAttributes(names = { "user","lat","lon","address", "usernick"})
public class LoginFormController {

	OAuthToken oauthToken = null;
	String mail = "";
	
	@Autowired
	private UserService service;

	@Autowired
	private WYmarketService wyMarketService;

	@GetMapping("/location")
	public String location() {
		return "location";
	}

	@GetMapping("/echo")
	public String echo() {
		return "echo";
	}

	@GetMapping("/echo2")
	public String echo2() {
		return "echo2";
	}

	@GetMapping("/echo3")
	public String echo3() {
		return "echo3";
	}

	@GetMapping("/chat")
	public String chat() {
		return "echo2";
	}

	@GetMapping("/address")
	public String address() {
		return "address";
	}

	@GetMapping("/auth/kakao")
	public String loginForm() {
		return "loginForm";
	}

	// 로그인
	@GetMapping("/login")
	public String loginPage(Model model, HttpSession session) {
		if(session.getAttribute((String) model.getAttribute("usernick")) != null) {
//			session.removeAttribute((String) model.getAttribute("usernick"));
			System.out.println("로그인페이지 세션에 든 값 : " + session.getAttribute((String) model.getAttribute("usernick")));
			return "/main";
		} else {
			System.out.println("로그인페이지 세션에 든 값 : " + session.getAttribute((String) model.getAttribute("usernick")));
			return "/login/login";
		}
		
		
	}

	@GetMapping("/logout")
	public String logout(Model model, HttpSession session) {
		
		session.removeAttribute((String) model.getAttribute("usernick"));
		System.out.println("왜 안 읽혀"+session.getAttribute((String) model.getAttribute("usernick")));
		
		return null;
	}
	
	 //로그아웃
	@GetMapping("/auth/kakao/logout")
	public String logout(String code,HttpSession session, Model model) {
		System.out.println("제발 들어와주세요");
		RestTemplate rt3 = new RestTemplate();

		// HttpHeaders 오브젝트 생성
		HttpHeaders headers3 = new HttpHeaders();
		headers3.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers3.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");

		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params2 = new LinkedMultiValueMap<>();
		params2.add("grant_type", "authorization_code");
		params2.add("client_id", "f5c99e47d61ce4b7e521d120e1f04199");
		params2.add("redirect_uri", "http://localhost:8080/wymarket/auth/kakao/logout");
		params2.add("code", code);

		// HttpHeaders와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest3 = new HttpEntity<>(params2, headers3);

		// Http 요청 - POST방식으로 - response 변수의 응답 받음
		ResponseEntity<String> response3 = rt3.exchange("https://kapi.kakao.com/v1/user/logout", HttpMethod.POST,
				kakaoProfileRequest3, String.class);

		ObjectMapper objectMapper3 = new ObjectMapper();
		KakaoProfile kakaoprofile = null;

		try {
			kakaoprofile = objectMapper3.readValue(response3.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		session.removeAttribute((String) model.getAttribute("usernick"));
		System.out.println(session.getAttribute((String) model.getAttribute("usernick")));
		
		return "logout";
	}

	// 로그인
	@GetMapping(value = "/auth/kakao/login")
	public String kakaoLogin(String code, Model model, HttpSession session) {
		System.out.println("카카오 로그인" + model.getAttribute("lat"));
		System.out.println("카카오 로그인" + model.getAttribute("lon"));
		System.out.println("카카오 로그인" + model.getAttribute("address"));
		
		// post방식으로 key=value 데이터를 요청(카카오쪽으로)

		RestTemplate rt = new RestTemplate();

		// HttpHeaders 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");

		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "f5c99e47d61ce4b7e521d120e1f04199");
		params.add("redirect_uri", "http://localhost:8080/wymarket/auth/kakao/login");
		params.add("code", code);

		// HttpHeaders와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		// Http 요청 - POST방식으로 - response 변수의 응답 받음
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);

		// Gson, Json Simple, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();

		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		System.out.println("카카오 엑세스 토큰 : " + oauthToken.getAccess_token());
		// dd

		// -------------------------------profile--------------------------------
		// 카카오로부터 정보 받기

		RestTemplate rt2 = new RestTemplate();

		// HttpHeaders 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");

		// HttpHeaders와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);

		// Http 요청 - POST방식으로 - response 변수의 응답 받음
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoProfileRequest2, String.class);

		ObjectMapper objectMapper2 = new ObjectMapper();

		KakaoProfile kakaoprofile = null;

		try {
			System.out.println("값 뜨나" + response2.getBody());
			kakaoprofile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
			System.out.println("카카오 프로파일" + kakaoprofile);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		mail = kakaoprofile.getKakao_account().getEmail();

		String userNick = wyMarketService.getUserNickByMail(mail);
		System.out.println("카카오 닉 : " + userNick);
		if(userNick != null) {
			model.addAttribute("usernick", userNick);
			session.setAttribute(userNick, userNick);
		}
		
		int result = service.selectKakaoMail(mail);
		System.out.println("가입 유무 : " + result);

		model.addAttribute("confirm", result);

		// User 오브젝트 : username, password, email
		System.out.println("카카오 아이디(번호): " + kakaoprofile.getId());
		System.out.println("이름 : " + kakaoprofile.getKakao_account().getProfile().getNickname());
		System.out.println("카카오 이메일: " + mail);

		// 가입유무 : 1이면 바로 메인페이지로 리턴
		if (result == 1) {
			return "redirect:/main";
		} else {
			return "kakaousernick";
		}

		// 가입유무 : 0이면 메모님이 만든 첫login페이지로 이동하고 닉네임설정모달띄우기 페이지 연결
	}

	@PostMapping(value = "auth/kakao/kakaonick", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public String join(@RequestBody UserInfo userInfo, Model model, HttpSession session) {

		userInfo.setLatitude((double) model.getAttribute("lat"));
		userInfo.setLongitude((double) model.getAttribute("lon"));
		userInfo.setAddress((String) model.getAttribute("address"));
		userInfo.setKakaoMail(mail);
		userInfo.setUserNick(userInfo.getUserNick());
		
		model.addAttribute("usernick", userInfo.getUserNick());
		session.setAttribute(userInfo.getUserNick(), userInfo.getUserNick());
		
		System.out.println("db에 넣을 메일: " + mail);
		System.out.println("db에 넣을 닉네임: " + userInfo.getUserNick());
		System.out.println(userInfo);
		
		int rs = service.insertUser(userInfo);
		System.out.println("자동가입 확인 유무: " + rs);

		return "redirect:/main";
	}

}
