package com.pro.pro.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pro.pro.model.Image;

public interface ImageRepository extends JpaRepository<Image, Long> {
	
	
}
