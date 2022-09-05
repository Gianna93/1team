package com.pro.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CustomerController {



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

	@GetMapping("/auth/findAccount")
	public String findAccountForm() {
		return "user/findAccount";
	}
	
	@GetMapping("/auth/findid")
	public String findIdForm() {
		return "user/findid";
	}
	
	@GetMapping("/auth/findPassword")
	public String findPwdForm() {
		return "user/findPassword";
	}
	
	@GetMapping("/auth/changePwdForm/**")
	public String changePwdForm() {
		return "user/changePwdForm";
	}
	
	@GetMapping("/auth/pwdCheck")
	public String pwdCheck() {
		return "user/pwdCheck";
	}
	
	@GetMapping("/auth/myPage")
	public String myPage() {
		return "user/myPage";
	}
}