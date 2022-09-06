package com.pro.pro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pro.pro.model.Order;
import com.pro.pro.repository.OrderRepository;

@Service
public class orderService {

	@Autowired
	private OrderRepository orderRepository;
	
	@Transactional
	public void 주문하기(Order order) {
		
		orderRepository.save(order);
	}
}
