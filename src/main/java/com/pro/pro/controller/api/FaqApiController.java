package com.pro.pro.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.pro.pro.config.auth.PrincipalDetail;
import com.pro.pro.dto.ResponseDto;
import com.pro.pro.model.Faq;
import com.pro.pro.service.FaqService;

@RestController
public class FaqApiController {
	
	@Autowired
	private FaqService faqService;
	@PostMapping("/faq/api/faq")  ///api/FAQ
	public ResponseDto<Integer> save(@RequestBody Faq faq, 
			@AuthenticationPrincipal PrincipalDetail principal){
		faqService.write(faq, principal.getCustomer());
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/faq/{faqid}") ///api/FAQ/{faqid}
	public ResponseDto<Integer> deleteById(@RequestBody Faq faq){
		System.out.println(faq);
		faqService.postDelete(faq);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	} 
	@PutMapping("/api/faq/{faqid}") ///api/FAQ/{faqid} 
	public ResponseDto<Integer> update(@PathVariable int faqid, @RequestBody Faq faq){
		System.out.println(faqid);
		faqService.postUpdate(faq);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
}