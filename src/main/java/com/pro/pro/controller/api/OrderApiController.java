package com.pro.pro.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.pro.pro.dto.ResponseDto;
import com.pro.pro.model.Order;
import com.pro.pro.service.OrderService;

@RestController
public class OrderApiController {

	@Autowired
	private OrderService orderService;
	
	@PostMapping("/auth/addOrder")
	public ResponseDto<Integer> addOrder(@RequestBody Order order){
		System.out.println("주문하기 실행");
		orderService.주문하기(order);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/auth/deliverProc")
	public ResponseDto<Integer> deliver(@RequestBody Order order){
		System.out.println("배송중으로 변경");
		orderService.배송중(order);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	@PutMapping("/auth/delcompProc")
	public ResponseDto<Integer> delcomp(@RequestBody Order order){
		System.out.println("배송완료로 변경");
		orderService.배송완료(order);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
}