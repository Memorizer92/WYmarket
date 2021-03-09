package com.kgitbank.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
@SessionAttributes("user")
public class GoodsController {

	@Autowired
	GoodsService gservice;

	@Autowired
	private String uploadPath;

	// 상품등록페이지
	@GetMapping("register")
	public void getGoodsRegister() throws Exception {
		log.info("상품등록페이지");
	}

	
	  @PostMapping("add") 
	  public String success(Model model, @ModelAttribute GoodsVO goods, MultipartFile file,
			  HttpSession session) throws Exception {
	  
	  String imgUploadPath = uploadPath + File.separator + "imgUpload"; // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
	  String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 위의 폴더를 기준으로 연월일 폴더를 생성 
	  String fileName = null; // 기본 경로와 별개로 작성되는 경로 + 파일이름
	  
	  if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
	  // 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
	  
	  fileName = UploadFileUtils.fileUpload(imgUploadPath, 
			  file.getOriginalFilename(), file.getBytes(), ymdPath);
	  
	  // gdsImg에 원본 파일 경로 + 파일명 저장 
	  goods.setIimagepath(File.separator + "imgUpload"
	  + ymdPath + File.separator + fileName);
	  
	  } else { // 첨부된 파일이 없으면 
		  fileName = File.separator + "images" + File.separator + "none.png"; // 미리 준비된 none.png파일을 대신 출력함
	  
	  goods.setIimagepath(fileName); }
	  
	  UserInfo user = (UserInfo)
	  session.getAttribute((String)model.getAttribute("user"));
	  model.addAttribute("user", user.getUserNick()); log.info(user.getUserNick());
	  
	  int result = gservice.createGoods(goods,user.getUserNick(),goods.getItitle(),
			  goods.getIcategory(),goods.getIcontent(),goods.getPrice(),goods.getIimagepath());
	  
	  
	  return "redirect:/main"; }
	 

	// 상품 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getList(@RequestParam("n") int itemid, Model model) {
		GoodsVO goods = gservice.getGoods(itemid);
		model.addAttribute("goods", goods);

	}

	// 상품 수정페이지
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getGoodsModify(@RequestParam("n") int itemid, Model model) {
		System.out.println(itemid);
		GoodsVO goods = gservice.getGoods(itemid);
		System.out.println(itemid);
		model.addAttribute("goods", goods);
	}

	
	//상품 수정

	@RequestMapping(value = "/modify", method = RequestMethod.POST) 
	public String postGoodsModify(GoodsVO goods, MultipartFile file, HttpServletRequest req)
			throws Exception {

		// 새로운 파일이 등록되었는지 확인 
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") { 
			// 기존 파일을 삭제 
			new File(uploadPath + req.getParameter("iimagepath")).delete();

			// 새로 첨부한 파일을 등록 
			String imgUploadPath = uploadPath + File.separator + "imgUpload"; 
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath); 
			String fileName = UploadFileUtils.fileUpload(imgUploadPath,
					file.getOriginalFilename(), file.getBytes(), ymdPath);

			goods.setIimagepath(File.separator + "imgUpload" + ymdPath + File.separator +
					fileName);

		} else { // 새로운 파일이 등록되지 않았다면 // 기존 이미지를 그대로 사용
			goods.setIimagepath(req.getParameter("iimagepath"));
		}

		gservice.goodsModify(goods);

		return "redirect:/main"; }


}
