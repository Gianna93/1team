package com.pro.pro.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.pro.pro.dto.ResponseDto;
import com.pro.pro.model.Cart;
import com.pro.pro.service.CartService;

@RestController
public class CartApiController {
	
	@Autowired
	private CartService cartService;
	
	@PostMapping("/auth/saveCartProc")
	public ResponseDto<Integer> save(@RequestBody Cart cart){
		System.out.println("장바구니담기 실행");
		cartService.장바구니담기(cart);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/auth/deleteCartProc")
	public ResponseDto<Integer> delete(@RequestBody Cart cart){
		System.out.println("장바구니 삭제 실행");
		cartService.장바구니삭제(cart.getId());
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}

}
