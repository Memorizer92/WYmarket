package com.kgitbank.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kgitbank.model.GoodsVO;
import com.kgitbank.model.SearchInDistance;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.GoodsService;
import com.kgitbank.service.GpsDistance;
import com.kgitbank.service.WYmarketService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@SessionAttributes({ "user", "userNick" })
public class MainController {

	@Autowired
	GoodsService gservice;

	@Autowired
	WYmarketService wyMarketService;

	// 메인페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPageGET(HttpSession session, Model model) {
		log.info("메인 페이지");
		System.out.println("메인페이지 세션 값 : " + session.getAttribute("user"));

		UserInfo userInfo = (UserInfo) session.getAttribute("user");

		model.addAttribute("userNick", userInfo.getUserNick());

		List<String> userNickList = wyMarketService.selectUserNickFromItem();

		List<String> userNickList6km = new ArrayList<String>();

		for (String userNick : userNickList) {

			UserInfo latLong = wyMarketService.selectLatLong(userNick);

			double distanceKiloMeter = GpsDistance.distance(userInfo.getLatitude(), userInfo.getLongitude(),
					latLong.getLatitude(), latLong.getLongitude(), "kilometer");

			System.out.println("두 지점 간의 거리 : " + distanceKiloMeter);

			if (distanceKiloMeter < 6) {
				userNickList6km.add(userNick);
			}
		}

		// 6km 이내인 상품들 따로 DB 테이블 관리를 위해 해당 테이블 내용 삭제
		wyMarketService.deleteSearchInDistance();

		// 거리 이내의 상품 띄우는 리스트
		for (String userNick : userNickList6km) {
			List<GoodsVO> goodsVO = gservice.getGoodsList(userNick);
			for (GoodsVO goods : goodsVO) {
				// 6km 이내 상품들을 DB에 하나씩 insert
				wyMarketService.insertSearchInDistance(goods);
			}
		}

		List<SearchInDistance> sid = wyMarketService.selectSearchInDistance();

		System.out.println(sid);
		model.addAttribute("goods", sid);

		return "/main";
	}

}
