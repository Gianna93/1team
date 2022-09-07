package com.pro.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {

	
	//관리자 권한 필요
		@GetMapping({"/review/reviewForm/{productName}"})
		public String reviewForm(String productName) {
			System.out.println(productName);
			return "review/reviewForm";
		}
}
