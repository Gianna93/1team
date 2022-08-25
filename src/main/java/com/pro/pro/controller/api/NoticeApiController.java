package com.pro.pro.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.pro.pro.config.auth.PrincipalDetail;
import com.pro.pro.dto.ResponseDto;
import com.pro.pro.model.Notice;
import com.pro.pro.service.NoticeService;
@Controller
@RestController
public class NoticeApiController {
	
		@Autowired
		private NoticeService noticeService;
	
		@PostMapping("notice/api/notice")
		public ResponseDto<Integer> save(@RequestBody Notice notice,
				@AuthenticationPrincipal PrincipalDetail principal){
			noticeService.공지사항등록(notice, principal.getCustomer());
			return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
		}
		
		@DeleteMapping("/api/notice/{id}")
		public ResponseDto<Integer> deleteById(@PathVariable int id){
			noticeService.공지사항삭제하기(id);
			return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
		}
		
		@PostMapping("/api/notice/{id}")
		public ResponseDto<Integer> update(@PathVariable int id,
				@RequestBody Notice notice){
			noticeService.공지사항수정하기(id, notice);
			return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
		}
	
}
