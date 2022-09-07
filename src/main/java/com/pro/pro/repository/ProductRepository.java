package com.pro.pro.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pro.pro.model.Product;

public interface ProductRepository extends JpaRepository<Product,Integer>{

	Optional<Product> findById(int id);
	

	

}