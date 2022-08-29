package com.pro.pro.controller.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.pro.pro.dto.ResponseDto;
import com.pro.pro.model.Customer;
import com.pro.pro.service.CustomerService;

@RestController
public class CustomerApiController {
	
	@Autowired
	private CustomerService customerService;
	
	@PostMapping("/auth/joinProc")
	public ResponseDto<Integer> save(@RequestBody Customer customer) {
		System.out.println("CustomerApiController 호출됨");
		
		customerService.회원가입(customer);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PostMapping("/auth/idCheckProc")
	public boolean idCheck(@RequestBody Customer customer) {
		System.out.println(customer.getUserid());
		boolean idchk = customerService.중복체크(customer);
		System.out.println(idchk);
		return idchk;
	}
	
	@ResponseBody 
	@PostMapping("/auth/findIdProc")
	public ResponseDto<String> findId(@RequestBody Customer customer) {
		
		Customer cus = customerService.아이디찾기(customer).orElseThrow(()->{
			return new IllegalArgumentException("fail");
		});
		String cusid = cus.getUserid();

		return new ResponseDto<String>(HttpStatus.OK.value(),cusid);
	}
	
	
	@ResponseBody 
	@PostMapping("/auth/findPwdProc")
	public ResponseDto<Boolean> findPwd(@RequestBody Customer customer){
		
		
		Customer cus= customerService.비밀번호찾기(customer).orElseThrow(()->{
			return new IllegalArgumentException("fail");
		});
		String cusid= customer.getUserid();
		String cusid2 = cus.getUserid();
		String cusqes = customer.getQestion();
		String cusqes2 = cus.getQestion();
		String cusans = customer.getAnswer();
		String cusans2 = cus.getAnswer();
		if(cusid.equals(cusid2)&&cusqes.equals(cusqes2)&&cusans.equals(cusans2)) {
			return new ResponseDto<Boolean>(HttpStatus.OK.value(),true);
		}
		return new ResponseDto<Boolean>(HttpStatus.OK.value(),false);
	}
	
	
	
	@PutMapping("/auth/changePwdProc")
	public ResponseDto<Integer> change(@RequestBody Customer customer) {
		customerService.비밀번호변경(customer);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PostMapping("/auth/phoneCheckProc")
	public boolean phoneCheck(@RequestBody Customer customer) {
		boolean phonechk = customerService.번호중복체크(customer);
		return phonechk;
	}
	
}