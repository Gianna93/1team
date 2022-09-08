package com.pro.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.pro.pro.service.CartService;

@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	@GetMapping("/auth/cart")
	public String cartList(Model model) {
		model.addAttribute("carts", cartService.카트목록());
		return "cart/cart";
	}
	
}
