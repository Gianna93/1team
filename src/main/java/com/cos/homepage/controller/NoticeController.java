package com.cos.homepage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.homepage.service.NoticeService;

@Controller
public class NoticeController {
	
		@Autowired
		private NoticeService noticeService;
		
		@GetMapping({"","/"})
		public String index() {
			return "index";
		}
		
		@GetMapping({"/notice/noticeList"})
		public String noticeList(Model model, @PageableDefault(size=3, sort="id",
		direction =  Sort.Direction.DESC) Pageable pageable) {
			model.addAttribute("notice", noticeService.공지사항목록(pageable));
			return "notice/noticeList";
		}
		
		@GetMapping("/notice/{id}")
		public String findById(@PathVariable String id, Model model) {
			model.addAttribute("notice", noticeService.공지사항상세보기(id));
			return "notice/noticeDetail";
		}
		
		@GetMapping("/notice/{id}/updateForm")
		public String updateForm(@PathVariable String id, Model model) {
			model.addAttribute("notice",noticeService.공지사항상세보기(id));
			return "notice/updateForm";
		}
		
}
