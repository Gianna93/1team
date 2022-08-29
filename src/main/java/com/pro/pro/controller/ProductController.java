package com.pro.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {
		
		@GetMapping({"/product/foodProduct"})
		public String foodProduct(){
			return "product/foodProduct";
		}
		
		@GetMapping({"/product/registerForm"})
		public String registerForm(){
			return "product/registerForm";
		}
}
