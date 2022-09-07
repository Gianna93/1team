package com.pro.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.pro.pro.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;

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
	public String myPage(Model model, @PageableDefault(size=10, sort="id",
			direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("customers", customerService.회원목록(pageable));
		return "user/myPage";
	}
	

}