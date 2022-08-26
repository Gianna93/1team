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
    public void replySave(int num, Reply reply, Customer customer) {
    	Qna qna = qnaRepository.findByNum(num).orElseThrow(() -> 
    	new IllegalArgumentException("해당 num이 없습니다. 글번호=" + num));
        System.out.println(qna.getTitle());
    	reply.save(qna, customer);
        replyRepository.save(reply);
    }
    
    @Transactional
	public void 답변삭제하기(int replyId) { 
		replyRepository.deleteById(replyId);
	}
}