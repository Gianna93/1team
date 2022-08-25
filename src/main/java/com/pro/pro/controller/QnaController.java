package com.pro.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.pro.pro.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	//관리자 권한 필요
	@GetMapping({"/qna/qnaForm"})
	public String qnaForm() {
		return "qna/qnaForm";
	}
	
	@GetMapping({"/qna/qnaList"})
	public String qnaList(Model model, @PageableDefault(size=10, sort="num",
	direction =  Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("qna", qnaService.문의목록(pageable));
		return "qna/qnaList";
	}
	
	@GetMapping("/qna/{num}")
	public String findById(@PathVariable int num, Model model) {
		model.addAttribute("qna", qnaService.문의상세보기(num));
		return "qna/qnaDetail";
	}
	
	@GetMapping("/qna/{id}/updateForm")
	public String updateForm(@PathVariable int id, Model model) {
		model.addAttribute("qna",qnaService.문의상세보기(id));
		return "qna/updateForm";
	}
}
