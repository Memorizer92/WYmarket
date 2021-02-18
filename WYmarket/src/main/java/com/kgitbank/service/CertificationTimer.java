//package com.kgitbank.service;
//
//import java.util.concurrent.Executors;
//import java.util.concurrent.ScheduledExecutorService;
//import java.util.concurrent.TimeUnit;
//
//import org.springframework.ui.Model;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//public class CertificationTimer {
//
//	public CertificationTimer() {
//		Runnable runnable = new Runnable() {
//
//			RedirectAttributes rttr;
//			Model model;
//			int startTime = 61;
//			boolean flag = true;
//
//			public void run() {
//
//				if (flag) {
//					// task to run goes here
//					startTime--;
//					model.addAttribute("certimer", startTime);
//					
//					if (startTime == 0) {
//						rttr.addFlashAttribute("smscodes", "");
//						rttr.addFlashAttribute("phonenumber", "");
//						flag = false;
//					}
//				}
//			}
//
//		};
//
//		ScheduledExecutorService service = Executors
//
//				.newSingleThreadScheduledExecutor();
//
//		service.scheduleAtFixedRate(runnable, 0, 1, TimeUnit.SECONDS);
//	}
//
//}
