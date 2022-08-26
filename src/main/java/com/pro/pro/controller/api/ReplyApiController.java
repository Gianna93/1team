package com.pro.pro.controller.api;

import org.springframework.http.HttpStatus;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.pro.pro.config.auth.PrincipalDetail;
import com.pro.pro.dto.ResponseDto;
import com.pro.pro.model.Reply;
import com.pro.pro.service.ReplyService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class ReplyApiController {
	
	private final ReplyService replyService;

    @PostMapping("/api/qna/reply/{num}")
    public void save(@PathVariable int num,
                     @RequestBody Reply reply,
                     @AuthenticationPrincipal PrincipalDetail principalDetail) {
    	System.out.println(num);
        replyService.replySave(num, reply, principalDetail.getCustomer());
    }
    
    @DeleteMapping("/api/qna/reply/{replyId}")
	public ResponseDto<Integer> replyDelete(@PathVariable int replyId){
		replyService.답변삭제하기(replyId);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
    

}
