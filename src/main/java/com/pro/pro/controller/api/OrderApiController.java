package com.pro.pro.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.pro.pro.dto.ResponseDto;
import com.pro.pro.model.Order;
import com.pro.pro.service.orderService;

@RestController
public class OrderApiController {

	@Autowired
	private orderService orderService;
	
	@PostMapping("/auth/addOrder")
	public ResponseDto<Integer> addOrder(@RequestBody Order order){
		System.out.println("주문하기 실행");
		orderService.주문하기(order);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
}
