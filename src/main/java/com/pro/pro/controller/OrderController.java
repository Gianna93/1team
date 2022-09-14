package com.pro.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.pro.pro.config.auth.PrincipalDetail;
import com.pro.pro.model.RoleType;
import com.pro.pro.service.OrderService;
import com.pro.pro.service.ProductService;
import com.pro.pro.service.productReplyService;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;

	@Autowired
	productReplyService productreplyService;

	@Autowired
	private ProductService productService;
	
	@GetMapping("/auth/myOrder")
	public String orderList(Model model, @AuthenticationPrincipal PrincipalDetail principal) {
		if (principal.getCustomer().getRoles() == RoleType.CUSTOMER) {
			model.addAttribute("orders", orderService.주문목록());
			return "/user/myOrder";
		} else {
			model.addAttribute("product", productService.상품목록());
			return "index";
		}
	}

	@GetMapping("/product/orderAdmin")
	public String orderListAll(Model model, @AuthenticationPrincipal PrincipalDetail principal) {
		if (principal.getCustomer().getRoles() == RoleType.ADMIN) {
			model.addAttribute("orders", orderService.주문목록());
			return "product/orderAdmin";
		} else {
			return "/admin/adminPage";
		}
	}

}
