package com.kgitbank.controller.rest;

import java.io.Serializable;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.kgitbank.controller.LoginFormController;
import com.kgitbank.model.AdminInfo;
import com.kgitbank.model.UserIP;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.GpsDistance;
import com.kgitbank.service.GpsToAddress;
import com.kgitbank.service.WYmarketService;
import com.kgitbank.service.CertificationService;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RestController
@SessionAttributes({ "smscodes", "phonenumber", "check", "lat", "lon", "address", "user", "findph" })
public class RestControllerMain implements Serializable {

   @Autowired
   private WYmarketService wyMarketService;

   private String newAddress = null;

   private int result = 0;

   private int smsCnt = 0;

   private int smsLeftCnt = 3;

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

   @PostMapping(value = { "/getsms/{sms}" }, produces = "text/html; charset=UTF-8")
   public String sendSMS(@PathVariable("sms") String phoneNumber, UserInfo userInfo, Model model, HttpSession session,
         UserIP userIp) {

      String ip = null;

      try {
         ip = Inet4Address.getLocalHost().getHostAddress();
      } catch (UnknownHostException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      String numStr = "";

      smsLeftCnt--;
      session.setAttribute("smsLeftCnt", smsLeftCnt);
      if (smsLeftCnt == 0) {
         smsLeftCnt = 3;
      }

      if (wyMarketService.getIpCnt(ip) == 0) {
         int insertIp = wyMarketService.insertIp(ip);
         Random rand = new Random();

         smsCnt = 1;
         session.setAttribute("smsCnt", smsCnt);

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

         int result = wyMarketService.getAdminPhCount(dashPhoneNumber);

         if (result == 0) {
            result = wyMarketService.selectphonenumber(dashPhoneNumber);
         }

         this.result = result;

         String userNick = wyMarketService.getUserNickByPh(dashPhoneNumber);

      } else {
         smsCnt = wyMarketService.getSmsCnt(ip);
         session.setAttribute("smsCnt", smsCnt);
         System.out.println("smsCnt : " + smsCnt);
         if (smsCnt >= 3) {

            userIp.setSmsExceedDate(new Date());

            Date getSmsExceedDate = wyMarketService.getSmsExceedDate(ip);

            Calendar getToday = Calendar.getInstance();
            getToday.setTime(userIp.getSmsExceedDate()); // 현재 날짜

            Calendar cmpDate = Calendar.getInstance();
            System.out.println(cmpDate + "/" + getSmsExceedDate);
            cmpDate.setTime(wyMarketService.getSmsExceedDate(ip)); // 특정 일자

            long diffSec = (getToday.getTimeInMillis() - cmpDate.getTimeInMillis()) / 1000;
            long diffDays = diffSec / (24 * 60 * 60); // 일자수 차이

            System.out.println(diffSec + "초 차이");
            System.out.println(diffDays + "일 차이");

            if (diffSec >= 60) {
               int exceedUpdate = wyMarketService.updateSmsExceedDate(ip);
               smsCnt = 1;
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

               int result = wyMarketService.getAdminPhCount(dashPhoneNumber);

               if (result == 0) {
                  result = wyMarketService.selectphonenumber(dashPhoneNumber);
               }

               this.result = result;

               String userNick = wyMarketService.getUserNickByPh(dashPhoneNumber);

            }

         } else {
            int updateIpCnt = wyMarketService.updateIpCnt(ip);
            if (wyMarketService.getSmsCnt(ip) == 3) {
               wyMarketService.insertSmsExceedDate(ip);
            }

            session.setAttribute("smsCnt", wyMarketService.getSmsCnt(ip));
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

            int result = wyMarketService.getAdminPhCount(dashPhoneNumber);

            if (result == 0) {
               result = wyMarketService.selectphonenumber(dashPhoneNumber);
            }

            this.result = result;

            String userNick = wyMarketService.getUserNickByPh(dashPhoneNumber);

         }
      }

      return numStr; // uri 반환 !!!
   }

   @PostMapping(value = { "/getph/{sms}" }, produces = "text/html; charset=UTF-8")
   public String sendph(@PathVariable("sms") String phoneNumber, UserInfo userInfo, Model model) {

      return phoneNumber; // uri 반환 !!!
   }

   @PostMapping(value = { "/smsReqCnt" }, produces = "text/html; charset=UTF-8")
   public String SmsReqCnt(Model model) {

      System.out.println("인증횟수 : " + smsCnt);
      String check = String.valueOf(smsCnt);

      return check; // uri 반환 !!!
   }

   @PostMapping(value = { "/smsCntInc" }, produces = "text/html; charset=UTF-8")
   public String smsCntInc(Model model) {

      smsCnt += 1;
      System.out.println("인증횟수는 몇일까 : " + smsCnt);
      String check = String.valueOf(smsCnt);

      return check; // uri 반환 !!!
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
       
      String dashPhoneNumber = userInfo.getPhoneNumber().substring(0, 3) + "-"
            + userInfo.getPhoneNumber().substring(3, 7) + "-" + userInfo.getPhoneNumber().substring(7);
      userInfo.setPhoneNumber(dashPhoneNumber);

      System.out.println(userInfo);

      int result = wyMarketService.insertUserPhNk(userInfo);
      System.out.println(result);

      SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
      // 일자별 접속자 수 알기 위한 쿼리 (하루 동안 동일한 접속자 중복 수 제거)
      Date now = new Date();
      Date userAccessDate = wyMarketService.selectUserAccessDate(userInfo.getUserNick());
      if(wyMarketService.selectUserAccessCount(userInfo.getUserNick()) == 1) {
         if (format.format(now) != format.format(userAccessDate)) {
            wyMarketService.insertUserAccessDate(userInfo.getUserNick());
            // 누적 접속자 수 알기 위해 카운트 올리는 DB 쿼리
            wyMarketService.updateUserCountTotal(wyMarketService.selectAccessCount());
         }
      } else {
         wyMarketService.insertUserAccessDate(userInfo.getUserNick());
         // 누적 접속자 수 알기 위해 카운트 올리는 DB 쿼리
         wyMarketService.updateUserCountTotal(wyMarketService.selectAccessCount());
      }
      
      userInfo.setUserID(wyMarketService.selectIdByUserNick(userInfo.getUserNick()));
      
      model.addAttribute("user", userInfo.getUserNick());
      session.setAttribute(userInfo.getUserNick(), userInfo); // 중요, 가변하는 닉네임에 VO 담음
      System.out.println(session.getAttribute(userInfo.getUserNick()));
      return null;
   }

   // 관리자 또는 사용자 메인 페이지로 넘어가기 전에 세션에 정보 담음
   @PostMapping(value = { "/ajaxToMain" }, consumes = "application/json", produces = "text/html; charset=UTF-8")
   public String ajaxToMain(@RequestBody UserInfo userInfo, AdminInfo adminInfo, Model model, HttpSession session) {

      String dashPhoneNumber = userInfo.getPhoneNumber().substring(0, 3) + "-"
            + userInfo.getPhoneNumber().substring(3, 7) + "-" + userInfo.getPhoneNumber().substring(7);

      // 관리자가 로그인하려는 것이라면
      if (wyMarketService.getAdminPhCount(dashPhoneNumber) == 1) {
         adminInfo = new AdminInfo();
         Map<String, Object> adminList = wyMarketService.getAdminInfo(dashPhoneNumber);
         AdminInfo topAdminInfo = wyMarketService.getAdminInfo2();
         adminInfo.setAdminMemo(topAdminInfo.getAdminMemo());
         adminInfo.setPhoneNumber((String) adminList.get("PHONENUMBER"));
         adminInfo.setAdminNick((String) adminList.get("ADMINNICK"));
         adminInfo.setAdminCreateDate((Date) adminList.get("ADMINCREATEDATE"));
         adminInfo.setAdminGrade((String) adminList.get("ADMINGRADE"));
//         adminInfo.setAdminMemo((String) adminList.get("ADMINMEMO"));
         session.setAttribute("Admin", adminInfo);
      }
      // 사용자가 로그인하려는 것이라면
      else {
         userInfo.setPhoneNumber(dashPhoneNumber);
         UserInfo info = wyMarketService.selectUserInfo(userInfo.getPhoneNumber());
         
         SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
         // 일자별 접속자 수 알기 위한 쿼리 (하루 동안 동일한 접속자 중복 수 제거)
         Date now = new Date();
         Date userAccessDate = wyMarketService.selectUserAccessDate(info.getUserNick());
         System.out.println("현재 날짜 " + format.format(now));
         if(wyMarketService.selectUserAccessCount(info.getUserNick()) == 1) {
            if (!format.format(now).equals(format.format(userAccessDate))) {
               wyMarketService.insertUserAccessDate(info.getUserNick());
               // 누적 접속자 수 알기 위해 카운트 올리는 DB 쿼리
               wyMarketService.updateUserCountTotal(wyMarketService.selectAccessCount());
            }
         } else {
            wyMarketService.insertUserAccessDate(info.getUserNick());
            // 누적 접속자 수 알기 위해 카운트 올리는 DB 쿼리
            wyMarketService.updateUserCountTotal(wyMarketService.selectAccessCount());
         }

         userInfo.setUserID(wyMarketService.selectIdByUserNick(info.getUserNick()));
         
         model.addAttribute("user", info.getUserNick());
         session.setAttribute((String) model.getAttribute("user"), info);

         System.out.println(session.getAttribute((String) model.getAttribute("user")));
      }

      return String.valueOf(wyMarketService.getAdminPhCount(dashPhoneNumber));
   }

   @PostMapping(value = "/saveMemo", consumes = "application/json", produces = "text/html; charset=UTF-8")
   public String saveMemo(@RequestBody AdminInfo adminInfo, Model model, HttpSession session) {
      int updateRow = wyMarketService.updateAdminMemo(adminInfo);
      adminInfo = (AdminInfo) session.getAttribute("Admin");
      adminInfo = (AdminInfo) wyMarketService.getAdminInfo2();

      session.setAttribute("Admin", adminInfo);
      System.out.println(session.getAttribute("Admin"));
      return null;
   }

   @GetMapping("/admin/ban/{userNick}")
   public String adminUserBan(@PathVariable("userNick") String userNick, Model model) {
      int updateBan = wyMarketService.updateUserBan(userNick);
      String selectBanResult = wyMarketService.selectUserBan(userNick);

      return selectBanResult;
   }

   @GetMapping(value = "/admin/unban/{userNick}", produces = "text/html; charset=UTF-8")
   public String adminUserUnBan(@PathVariable("userNick") String userNick, Model model) {
      int updateResult = wyMarketService.updateUserUnBan(userNick);
      String selectBanResult = wyMarketService.selectUserBan(userNick);

      return selectBanResult;
   }

}