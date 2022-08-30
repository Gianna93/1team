package com.pro.pro.service;

import org.springframework.beans.factory.annotation.Autowired;
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
      
}