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
import com.pro.pro.model.Qna;
import com.pro.pro.service.QnaService;

@Controller
@RestController
public class QnaApiController {
	
	@Autowired
	private QnaService qnaService;

	@PostMapping("qna/api/qna")
	public ResponseDto<Integer> save(@RequestBody Qna qna,
			@AuthenticationPrincipal PrincipalDetail principal){
		qnaService.문의등록(qna, principal.getCustomer());
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/qna/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id){
		qnaService.문의삭제하기(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PostMapping("/api/qna/{id}")
	public ResponseDto<Integer> update(@PathVariable int id,
			@RequestBody Qna qna){
		qnaService.문의수정하기(id, qna);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}

}
