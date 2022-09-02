package com.pro.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.pro.pro.service.CartService;

@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	@GetMapping("/auth/cart")
	public String cartList(Model model, @PageableDefault(size=10, sort="id",
			direction =  Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("carts", cartService.카트목록(pageable));
		return "cart/cart";
	}
	
}
