package com.pro.pro.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pro.pro.model.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer> {
	
	Optional<Cart> deleteAllByUserid(String userid);
	Optional<Cart> findAllByUserid(String userid);
	boolean existsByUserid(String userid);
}