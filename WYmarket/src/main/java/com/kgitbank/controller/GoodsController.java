package com.kgitbank.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.model.GoodsVO;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.GoodsService;
import com.kgitbank.util.UploadFileUtils;


import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/goods/*")
@Log4j
@SessionAttributes({"user","userNick"})
public class GoodsController {
	
	@Autowired
	GoodsService gservice;
	
	@Autowired
	private String uploadPath;
	
	UserInfo user;
	
	// 상품등록페이지
	@GetMapping("register") 
	public void getGoodsRegister() throws
	Exception{
		log.info("상품등록페이지");
	}
	
	// 상품 등록
	@PostMapping("add/{ititle}/{icategory}/{icontent}/{price}")
	public String success(Model model, 
			GoodsVO goods, MultipartFile file, HttpSession session,
			/* @PathVariable("iimagepath") String iimagepath, */
			@PathVariable("ititle") String ititle,
			@PathVariable("icategory") String icategory,
			@PathVariable("icontent") String icontent,
			@PathVariable("price") Integer price
			) throws IOException, Exception {
				/*
				 * String imgUploadPath = uploadPath + File.separator + "imgUpload"; String
				 * ymdPath = UploadFileUtils.calcPath(imgUploadPath); String fileName = null;
				 * 
				 * if(file != null) { fileName = UploadFileUtils.fileUpload(imgUploadPath,
				 * file.getOriginalFilename(), file.getBytes(), ymdPath); } else { fileName =
				 * uploadPath + File.separator + "images" + File.separator + "none.png"; }
				 * 
				 * goods.setIimagepath(File.separator + "imgUpload" + ymdPath + File.separator +
				 * fileName);
				 */
		
		 user = (UserInfo) session.getAttribute("user"); 
		 model.addAttribute("userNick", user.getUserNick()); // 주의
		 log.info(user.getUserNick());
		
		 
		
		int result = gservice.createGoods(goods, user.getUserNick(), ititle, icategory, icontent, price);
		
		return "redirect:/main";
	}
	
	//상품 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getList(@RequestParam("n") int itemid, Model model, HttpSession session) {
		GoodsVO goods = gservice.getGoods(itemid);
		model.addAttribute("goods",goods);
		//구매자 시퀀스 필요
		String nick = gservice.getId(goods.getUsernick());  
		user = (UserInfo) session.getAttribute("user");  
		session.setAttribute("buyerId",user.getUserID()); 
		session.setAttribute("buyerName", user.getUserNick()); 
		session.setAttribute("sellerId", nick);
	}
	
	
	
	//상품 수정페이지
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	//@GetMapping("modify") 
	public void getGoodsModify(@RequestParam("n") int itemid, Model model) {
		System.out.println(itemid);
		GoodsVO goods = gservice.getGoods(itemid);
		System.out.println(itemid);
		model.addAttribute("goods",goods);
	}
	
	/*
	 * //상품 수정
	 * 
	 * @RequestMapping(value = "/modify", method = RequestMethod.POST) public String
	 * postGoodsModify(GoodsVO goods, MultipartFile file, HttpServletRequest req)
	 * throws Exception {
	 * 
	 * // 새로운 파일이 등록되었는지 확인 if(file.getOriginalFilename() != null &&
	 * file.getOriginalFilename() != "") { // 기존 파일을 삭제 new File(uploadPath +
	 * req.getParameter("iimagepath")).delete();
	 * 
	 * // 새로 첨부한 파일을 등록 String imgUploadPath = uploadPath + File.separator +
	 * "imgUpload"; String ymdPath = UploadFileUtils.calcPath(imgUploadPath); String
	 * fileName = UploadFileUtils.fileUpload(imgUploadPath,
	 * file.getOriginalFilename(), file.getBytes(), ymdPath);
	 * 
	 * goods.setIimagepath(File.separator + "imgUpload" + ymdPath + File.separator +
	 * fileName);
	 * 
	 * } else { // 새로운 파일이 등록되지 않았다면 // 기존 이미지를 그대로 사용
	 * goods.setIimagepath(req.getParameter("iimagepath"));
	 * 
	 * }
	 * 
	 * gservice.goodsModify(goods);
	 * 
	 * return "redirect:/main"; }
	 */
	


}
