package com.pro.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.pro.pro.service.NoticeService;

@Controller
public class NoticeController {
	
		@Autowired
		private NoticeService noticeService;
		
		//관리자 권한 필요
		@GetMapping({"/notice/noticeForm"})
		public String noticeForm() {
			return "notice/noticeForm";
		}
		
		@GetMapping({"/notice/noticeList"})
		public String noticeList(Model model, @PageableDefault(size=10, sort="num",
		direction =  Sort.Direction.DESC) Pageable pageable) {
			model.addAttribute("notice", noticeService.공지사항목록(pageable));
			return "notice/noticeList";
		}
		
		@GetMapping("/notice/{num}")
		public String findById(@PathVariable int num, Model model) {
			noticeService.updateCount(num);
			model.addAttribute("notice", noticeService.공지사항상세보기(num));
			return "notice/noticeDetail";
		}
		
		@GetMapping("/notice/{id}/updateForm")
		public String updateForm(@PathVariable int id, Model model) {
			model.addAttribute("notice",noticeService.공지사항상세보기(id));
			return "notice/updateForm";
		}
		
}
