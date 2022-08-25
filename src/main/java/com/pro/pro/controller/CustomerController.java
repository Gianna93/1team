package com.pro.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerController {

	@GetMapping({"","/"})
	public String index() {
		return "index";
	}

	@GetMapping("/auth/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}
	@GetMapping("/auth/adminCheck")
	public String adminCheck() {
		return "user/adminCheck";
	}
	@GetMapping("/auth/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}
	@GetMapping("/auth/idcheck")
	public String idcheckForm() {
		return "user/idcheck";
	}
	
	
	
	
}