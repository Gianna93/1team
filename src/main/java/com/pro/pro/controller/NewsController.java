package com.pro.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NewsController {
	
	@GetMapping("/auth/membership")
	public String memberShip() {
		return "news/membership";
	}

	@GetMapping("/auth/mooeja")
	public String mooeja() {
		return "news/mooeja";
	}
	
	
}