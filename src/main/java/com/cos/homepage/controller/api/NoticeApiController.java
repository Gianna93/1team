package com.cos.homepage.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.homepage.model.Notice;
import com.cos.homepage.service.NoticeService;

@RestController
public class NoticeApiController {
	
		@Autowired
		private NoticeService noticeService;
	
		@PostMapping("/api/notice")
		public ResponseDto<Integer> save(@RequestBody Notice notice,
				@AuthenticationPrincipal PrincipalDetail principal){
			
			noticeService.공지사항등록(notice, principal.getCustomer());
			return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
		}
		
		@DeleteMapping("/api/notice/{id}")
		public ResponseDto<Integer> deleteById(@PathVariable String id){
			noticeService.공지사항삭제하기(id);
			return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
		}
		
		@PutMapping("/api/notice/{id}")
		public ResponseDto<Integer> update(@PathVariable String id,
				@RequestBody Notice notice){
			noticeService.공지사항수정하기(id, notice);
			return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
		}
}
