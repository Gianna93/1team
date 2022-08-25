package com.pro.pro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pro.pro.model.Customer;
import com.pro.pro.model.Qna;
import com.pro.pro.repository.QnaRepository;

@Service
public class QnaService {
		
	@Autowired
	private QnaRepository qnaRepository;
	
	@Transactional
	public void 문의등록(Qna qna,Customer customer) {
		qna.setCustomer(customer);
		qnaRepository.save(qna);
	}
	
	@Transactional(readOnly=true)
	public Page<Qna> 문의목록(Pageable pageable){
		return qnaRepository.findAll(pageable);
	}
	
	@Transactional(readOnly=true)
	public Qna 문의상세보기(int num) {
		return qnaRepository.findById(num).orElseThrow(()->{ 
			return new IllegalArgumentException("1:1문의 상세보기 실패: 아이디를 찾을 수 없습니다.");
		});
	}
	
	@Transactional
	public void 문의삭제하기(int num) { 
		qnaRepository.deleteById(num);
	}
	
	@Transactional
	public void 문의수정하기(int id, Qna requestQna) {
		Qna qna = qnaRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
		});
		qna.setTitle(requestQna.getTitle());
		qna.setContent(requestQna.getContent());
	}
	
}
