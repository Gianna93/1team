package com.pro.pro.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pro.pro.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
	
	
	Optional<Customer> findByUserid(String userid);
	Optional<Customer> findByQestion(String qestion);
	Optional<Customer> findByAnswer(String answer);
	boolean existsByUserid(String userid);
	boolean existsByPhone(String phone);
	Optional<Customer> findByPhone(String phone);
} 