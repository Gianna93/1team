package com.pro.pro.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pro.pro.model.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer> {

}
