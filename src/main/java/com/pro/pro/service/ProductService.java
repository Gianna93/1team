package com.pro.pro.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pro.pro.model.Product;
import com.pro.pro.repository.ProductRepository;

@Service
public class ProductService {
		
	@Autowired
	private ProductRepository productRepository;
	
	 @Transactional
	   public void 상품등록(Product product, String image) {
	      product.setImage("/img/"+image);
	      productRepository.save(product);
	   }
	 
	 @Transactional(readOnly=true)
		public Product 상품상세(int id) {
			return productRepository.findById(id).orElseThrow(()->{ 
				return new IllegalArgumentException("상품을 찾을 수 없습니다.");
			});
		}	
	 @Transactional(readOnly=true)
		public Product 상품상세2(String pronum) {
			return productRepository.findByPronum(pronum).orElseThrow(()->{ 
				return new IllegalArgumentException("상품을 찾을 수 없습니다.");
			});
		}
	 
	 @Transactional(readOnly=true)
		public List<Product> 상품목록(){
			return productRepository.findAll(Sort.by(Sort.Direction.ASC, "id"));
		}	
	 
	 @Transactional
		public void 상품수정(int id, Product requestProduct) {
		 Product product = productRepository.findById(id).orElseThrow(()->{
				return new IllegalArgumentException("상품 찾기 실패: 아이디를 찾을 수 없습니다.");
			});
			product.setProductName(requestProduct.getProductName());
			product.setPrice(requestProduct.getPrice());
			product.setContent(requestProduct.getContent());
			product.setCategory(requestProduct.getCategory());
			product.setImage("/img/"+requestProduct.getImage());
			product.setPet(requestProduct.getPet());
		}
	 @Transactional
		public void 상품삭제(int id) { 
			productRepository.deleteById(id);
		}
	 
	 @Transactional
	 	public boolean 일련번호중복체크(Product product) {
		 return productRepository.existsByPronum(product.getPronum());
	 }
}