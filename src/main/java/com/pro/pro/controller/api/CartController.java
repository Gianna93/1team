package com.pro.pro.controller.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {

	@GetMapping("/auth/cart")
	public String index() {
		return "cart/cart";
	}
}
