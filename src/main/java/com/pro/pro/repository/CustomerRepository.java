package com.pro.pro.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pro.pro.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, String> {
	
	
	Optional<Customer> findByUserId(String userId);
} 