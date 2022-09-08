package com.pro.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.pro.pro.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@GetMapping("/auth/myOrder")
	public String orderList(Model model) {
		model.addAttribute("orders",orderService.주문목록());
		return "/user/myOrder";
	}
	
	
	@GetMapping("/product/orderAdmin")
	public String orderListAll(Model model) {
		model.addAttribute("orders",orderService.주문목록());
		return "/product/orderAdmin";
	}
	
}