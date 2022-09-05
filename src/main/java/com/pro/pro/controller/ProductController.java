package com.pro.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.pro.dto.ResponseDto;
import com.pro.pro.model.Product;
import com.pro.pro.service.ProductService;

@Controller
public class ProductController {
		
		@Autowired
		private ProductService productService;
		
		@GetMapping({"","/"})
		public String index(Model model, @PageableDefault(size=1000, sort="id",
				direction =  Sort.Direction.ASC)Pageable pageable) {
			model.addAttribute("product", productService.상품목록(pageable)); 
			return "index";
		}
		
		@GetMapping({"/product/registerForm"})
		public String registerForm() {
			return "product/registerForm";
		}
		
		@ResponseBody
		@PostMapping({"/product/updateForm/{id}"})
		public ResponseDto<Product> findById(@PathVariable int id) {
			Product pro = productService.상품상세(id);
			return new ResponseDto<Product>(HttpStatus.OK.value(),pro);
		}
	
		@GetMapping({"/product/updateForm"})
		public String updateForm(Model model, @PageableDefault(size=1000, sort="id",
				direction =  Sort.Direction.DESC) Pageable pageable){
			model.addAttribute("product", productService.상품목록(pageable));
			return "product/updateForm";
		}
		
		@GetMapping({"/product/foodProduct"})
		public String foodProduct(Model model, @PageableDefault(size=1000, sort="id",
		direction =  Sort.Direction.DESC) Pageable pageable) {
			model.addAttribute("product", productService.상품목록(pageable));
			return "product/foodProduct";
		}
		
		@GetMapping({"/product/bathProduct"})
		public String bathProduct(Model model, @PageableDefault(size=1000, sort="id",
		direction =  Sort.Direction.DESC) Pageable pageable) {
			model.addAttribute("product", productService.상품목록(pageable));
			return "product/bathProduct";
		}
		
		@GetMapping({"/product/toyProduct"})
		public String toyProduct(Model model, @PageableDefault(size=1000, sort="id",
		direction =  Sort.Direction.DESC) Pageable pageable) {
			model.addAttribute("product", productService.상품목록(pageable));
			return "product/toyProduct";
		}
		
		@GetMapping({"/product/beautyProduct"})
		public String beautyProduct(Model model, @PageableDefault(size=1000, sort="id",
		direction =  Sort.Direction.DESC) Pageable pageable) {
			model.addAttribute("product", productService.상품목록(pageable));
			return "product/beautyProduct";
		}
		
		@GetMapping({"/product/houseProduct"})
		public String houseProduct(Model model, @PageableDefault(size=1000, sort="id",
		direction =  Sort.Direction.DESC) Pageable pageable) {
			model.addAttribute("product", productService.상품목록(pageable));
			return "product/houseProduct";
		}
		
		@GetMapping({"/product/etcProduct"})
		public String etcProduct(Model model, @PageableDefault(size=1000, sort="id",
		direction =  Sort.Direction.DESC) Pageable pageable) {
			model.addAttribute("product", productService.상품목록(pageable));
			return "product/etcProduct";
		}
		
		@GetMapping({ "/product/productDetail/{id}" })
		public String productDetail(@PathVariable int id, Model model) {
			model.addAttribute("product", productService.상품상세(id));
			return "product/productDetail";
		}
		
}