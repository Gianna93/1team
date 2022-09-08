package com.pro.pro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pro.pro.model.productReply;
import com.pro.pro.repository.productReplyRepository;

@Service
public class productReplyService {

	@Autowired
	private productReplyRepository productreplyRepository;
	
	@Transactional
	public void 후기등록(productReply productreply) {
		productreplyRepository.save(productreply);
	}
	
	@Transactional
	public List<productReply> 후기목록(){
		return productreplyRepository.findAll();
	}
}
