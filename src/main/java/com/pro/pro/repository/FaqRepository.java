package com.pro.pro.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pro.pro.model.Faq;

public interface FaqRepository extends JpaRepository<Faq, Integer>{
}