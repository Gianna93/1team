package com.pro.pro.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.pro.pro.model.Qna;
import com.pro.pro.model.Customer;
import com.pro.pro.model.Reply;
import com.pro.pro.repository.QnaRepository;
import com.pro.pro.repository.ReplyRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReplyService {

    private final ReplyRepository replyRepository;
    private final QnaRepository qnaRepository;

    @Transactional
    public void replySave(Long num, Reply reply, Customer customer) {
    	Qna qna = qnaRepository.findByNum(num).orElseThrow(() -> 
    	new IllegalArgumentException("해당 num이 없습니다. id=" + num));
        reply.save(qna, customer);
        replyRepository.save(reply);
    }
}