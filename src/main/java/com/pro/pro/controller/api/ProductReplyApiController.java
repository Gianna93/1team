package com.pro.pro.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.pro.pro.dto.ResponseDto;
import com.pro.pro.model.productReply;
import com.pro.pro.service.productReplyService;

@RestController
public class ProductReplyApiController {
	@Autowired
	private productReplyService productreplyservice;
	
	@PostMapping("/auth/saveReplyProc")
	public ResponseDto<Integer> saveReply(@RequestBody productReply productreply){
		System.out.println("후기등록 실행");
		productreplyservice.후기등록(productreply);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
}
