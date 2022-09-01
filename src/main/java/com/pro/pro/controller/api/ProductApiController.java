package com.pro.pro.controller.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.pro.pro.dto.ResponseDto;
import com.pro.pro.model.Notice;
import com.pro.pro.model.Product;
import com.pro.pro.service.ProductService;

@Controller
@RestController
public class ProductApiController {
	
		@Autowired
		private ProductService productService;
		
		@PostMapping("product/api/product")
	      public ResponseDto<Integer> save(@RequestBody Product product, String image){
	         image = product.getImage();
	         productService.상품등록(product, image);
	         return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	      }
		
		@PostMapping("/api/product/{id}")
		public ResponseDto<Integer> update(@PathVariable int id,
				@RequestBody Product product){
			productService.상품수정(id, product);
			return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
		}
		@DeleteMapping("/api/product/{id}")
		public ResponseDto<Integer> deleteById(@PathVariable int id){
			productService.상품삭제(id);
			return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
		}
}