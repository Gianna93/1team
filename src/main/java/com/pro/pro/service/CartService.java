package com.pro.pro.service;

import java.util.Optional;

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
	
	@Transactional
	public String 장바구니비우기(String userid) {
		if(cartRepository.existsByUserid(userid)) {
		cartRepository.deleteAllByUserid(userid);
			return "장바구니를 비웠습니다";
		}else {
			return "장바구니에 담긴 물품이 없습니다";
		}
	}
	
	@Transactional
	public Optional<Cart> 장바구니목록(Cart cart){
		return cartRepository.findById(cart.getId());
	}
	
	@Transactional
	public void 주문후장바구니삭제(Cart cart) {
		cartRepository.deleteById(cart.getId());
	}
	
}