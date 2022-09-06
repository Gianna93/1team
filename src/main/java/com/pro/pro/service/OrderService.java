package com.pro.pro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pro.pro.model.Customer;
import com.pro.pro.model.Order;
import com.pro.pro.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
	
	@Transactional(readOnly=true)
	public Page<Order> 주문목록(Pageable pageable){
		return orderRepository.findAll(pageable);
	}
	
	@Transactional
	public void 주문하기(Order order) {
		orderRepository.save(order);
	}
	
	@Transactional
	public void 배송중(Order order) {
		Order ord = orderRepository.findById(order.getId()).orElseThrow(()->{
			return new IllegalArgumentException("fail");
			});
		ord.setState(order.getState());
		orderRepository.save(ord);
	}
	@Transactional
	public void 배송완료(Order order) {
		Order ord = orderRepository.findById(order.getId()).orElseThrow(()->{
			return new IllegalArgumentException("fail");
		});
		ord.setState(order.getState());
		orderRepository.save(ord);
	}
}
