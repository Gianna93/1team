package com.pro.pro.repository;



import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pro.pro.model.Qna;

public interface QnaRepository extends JpaRepository<Qna,Integer> {

	Optional<Qna> findByNum(int num);

	

}
