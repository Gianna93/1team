package com.pro.pro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pro.pro.model.Cart;
import com.pro.pro.repository.CartRepository;

@Service
public class CartService {

	@Autowired
	private CartRepository cartRepository;
	

	
	@Transactional
	public void 장바구니담기(Cart cart) {
		cartRepository.save(cart);
	}
	
	@Transactional(readOnly=true)
	public Page<Cart> 카트목록(Pageable pageable) {
		return cartRepository.findAll(pageable);
	}
	
	@Transactional
	public void 장바구니삭제(int id) {
		cartRepository.deleteById(id);
	}
	
}
