package com.pro.pro.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pro.pro.model.Order;
import com.pro.pro.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
	

	
	
	@Transactional(readOnly=true)
	public List<Order> 주문목록(){
		return orderRepository.findAll();
	}
	
	
	@Transactional
	public Order 주문찾기(int id){
		return orderRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("fail");
			});
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
	@Transactional
	public void 후기작성완료(Order order) {
		Order ord = orderRepository.findById(order.getId()).orElseThrow(()->{
			return new IllegalArgumentException("fail");
		});
		ord.setState(order.getState());
		orderRepository.save(ord);
	}
}
