package com.pro.pro.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pro.pro.model.Order;

public interface OrderRepository extends JpaRepository<Order, Integer>{

}
