package com.pro.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.pro.pro.config.auth.PrincipalDetail;
import com.pro.pro.model.RoleType;
import com.pro.pro.service.ProductService;
import com.pro.pro.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;

	@Autowired
	private ProductService productService;

	// 관리자 권한 필요
	@GetMapping({ "/qna/qnaForm" })
	public String qnaForm( Model model,@AuthenticationPrincipal PrincipalDetail principal) {
		if (principal.getCustomer().getRoles() == RoleType.CUSTOMER) {			
			return "qna/qnaForm";
		} else {
			model.addAttribute("product", productService.상품목록());
			return "index";
		}
	}

	@GetMapping({ "/qna/qnaList" })
	public String qnaList(Model model,
			@PageableDefault(size = 10, sort = "num", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("qna", qnaService.문의목록(pageable));
		return "qna/qnaList";
	}

	@GetMapping("/qna/{num}")
	public String findById(@PathVariable int num, Model model) {
		model.addAttribute("qna", qnaService.문의상세보기(num));
		return "qna/qnaDetail";
	}

	@GetMapping("/qna/{id}/updateForm")
	public String updateForm(@PathVariable int id, Model model, @AuthenticationPrincipal PrincipalDetail principal) {
		if (principal.getCustomer().getRoles() == RoleType.CUSTOMER) {
			model.addAttribute("qna", qnaService.문의상세보기(id));
			return "qna/updateForm";
		} else {
			model.addAttribute("product", productService.상품목록());
			return "index";
		}
	}
}
