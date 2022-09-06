package com.pro.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.pro.pro.model.Faq;
import com.pro.pro.service.FaqService;


@Controller
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	@GetMapping("/faq/faqForm") 
	public String postForm() {
		return "faq/faqForm";
	}
	
	@GetMapping("faq/faqList") 
	public String Faq(Model model, @PageableDefault(size = 10, sort = "faqid", 
	direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("faq", faqService.postList(pageable));
		return "faq/faqList";
	}
	
	@GetMapping("/faq/{faqid}") 
	public String findById(@PathVariable int faqid, Model model) {
		model.addAttribute("faq", faqService.postView(faqid));
		return "faq/faqDetail";
	}
	
	@GetMapping("faq/{faqid}/updateForm") 
	public String updateForm(@PathVariable int faqid, Model model) {
		model.addAttribute("faq", faqService.postUpdate2(faqid));
		return "faq/updateForm";
	}
}