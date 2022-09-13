package com.pro.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.pro.dto.ResponseDto;
import com.pro.pro.model.Product;
import com.pro.pro.service.OrderService;
import com.pro.pro.service.ProductService;
import com.pro.pro.service.productReplyService;

@Controller
public class ProductController {
		
		@Autowired
		private ProductService productService;
		
		@Autowired
		private OrderService orderService;
		
		@Autowired
		private productReplyService productreplyService; 
		
		@GetMapping({"","/"})
		public String index(Model model) {
			model.addAttribute("product", productService.상품목록()); 
			return "index";
		}
		
		@GetMapping("/auth/chaochur")
		public String chochur(Model model) {
			model.addAttribute("product", productService.상품목록()); 
			return "slideDetail/chaochur";
		}
		

		@GetMapping({"/auth/holdsomeball"})
		public String slideDetail(Model model) {
			model.addAttribute("product", productService.상품목록());
			return "slideDetail/holdsomeball";
		}
		
		@GetMapping({"/auth/bite"})
		public String bite(Model model) {
			model.addAttribute("product", productService.상품목록());
			return "slideDetail/bite";
		}
		
		@GetMapping({"/product/registerForm"})
		public String registerForm() {
			return "product/registerForm";
		}
		
		@GetMapping({"/product/searchProduct"})
		public String searchProduct(Model model) {
				model.addAttribute("product", productService.상품목록());
			return "product/searchProduct";
		}
		
		@GetMapping("/product/writeReply/{id}")
		public String writeReply(Model model,@PathVariable int id){
			model.addAttribute("orders", orderService.주문찾기(id));
			return "product/writeReply";
		}
		
		@ResponseBody
		@PostMapping({"/product/updateForm/{id}"})
		public ResponseDto<Product> findById(@PathVariable int id) {
			Product pro = productService.상품상세(id);
			return new ResponseDto<Product>(HttpStatus.OK.value(),pro);
		}
	
		@GetMapping({"/product/updateForm"})
		public String updateForm(Model model){
			model.addAttribute("product", productService.상품목록());
			return "product/updateForm";
		}
		
		@GetMapping({"/product/foodProduct"})
		public String foodProduct(Model model) {
			model.addAttribute("product", productService.상품목록());
			return "product/foodProduct";
		}
		
		@GetMapping({"/product/bathProduct"})
		public String bathProduct(Model model) {
			model.addAttribute("product", productService.상품목록());
			return "product/bathProduct";
		}
		
		@GetMapping({"/product/toyProduct"})
		public String toyProduct(Model model) {
			model.addAttribute("product", productService.상품목록());
			return "product/toyProduct";
		}
		
		@GetMapping({"/product/beautyProduct"})
		public String beautyProduct(Model model) {
			model.addAttribute("product", productService.상품목록());
			return "product/beautyProduct";
		}
		
		@GetMapping({"/product/houseProduct"})
		public String houseProduct(Model model) {
			model.addAttribute("product", productService.상품목록());
			return "product/houseProduct";
		}
		
		@GetMapping({"/product/etcProduct"})
		public String etcProduct(Model model) {
			model.addAttribute("product", productService.상품목록());
			return "product/etcProduct";
		}
		
		@GetMapping({ "/product/productDetail/{id}" })
		public String productDetail(@PathVariable int id, Model model) {
			model.addAttribute("product", productService.상품상세(id));
			model.addAttribute("proRe", productreplyService.후기목록());
			return "product/productDetail";
		}
		
}