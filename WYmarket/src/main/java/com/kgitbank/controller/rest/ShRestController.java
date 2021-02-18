//package com.kgitbank.controller.rest;
//
//import java.util.Random;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//@RestController
//@RequestMapping("/rest")
//@SessionAttributes({"phonenumber", "smscodes"})
//public class ShRestController {
//
//	@PostMapping("/getsms/{sms}")
//    public @ResponseBody
//    String sendSMS(@PathVariable("sms") String phoneNumber, Model model) {
//
//        Random rand  = new Random();
//        String numStr = "";
//        for(int i=0; i<4; i++) {
//            String ran = Integer.toString(rand.nextInt(10));
//            numStr+=ran;
//        }
//
//        System.out.println("수신자 번호 : " + phoneNumber);
//        System.out.println("인증번호 : " + numStr);
//        model.addAttribute("smscodes", numStr);
//        model.addAttribute("phonenumber", phoneNumber);
//        System.out.println(model.getAttribute("smscodes"));
////        certificationService.certifiedPhoneNumber("010-2863-8340",numStr);
//        return numStr;
//    }
//	
//}
