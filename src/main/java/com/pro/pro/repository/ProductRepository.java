package com.pro.pro.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pro.pro.model.Notice;
import com.pro.pro.model.Product;

public interface ProductRepository extends JpaRepository<Notice,Integer>{

	void save(Product product);

}
