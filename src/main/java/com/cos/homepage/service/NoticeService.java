package com.cos.homepage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.homepage.model.Customer;
import com.cos.homepage.model.Notice;
import com.cos.homepage.repository.NoticeRepository;

@Service
public class NoticeService {
		
		@Autowired
		private NoticeRepository noticeRepository;
		
		@Transactional
		public void 공지사항등록(Notice notice,Customer customer) {
			notice.setCount(0);
			notice.setCustomer(customer);
			noticeRepository.save(notice);
		}
		
		@Transactional(readOnly=true)
		public Page<Notice> 공지사항목록(Pageable pageable){
			return noticeRepository.findAll(pageable);
		}
		
		@Transactional(readOnly=true)
		public Notice 공지사항상세보기(String id) {
			return noticeRepository.findById(id).orElseThrow(()->{ //id integer임..
				return new IllegalArgumentException("공지사항 상세보기 실패: 아이디를 찾을 수 없습니다.");
			});
		}
		
		@Transactional
		public void 공지사항삭제하기(String id) { //id integet.....??? 
			noticeRepository.deleteById(id);
		}
		
		@Transactional
		public void 공지사항수정하기(String id, Notice requestNotice) {
			Notice notice = noticeRepository.findById(id).orElseThrow(()->{
				return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
			});
			notice.setTitle(requestNotice.getTitle());
			notice.setContent(requestNotice.getContent());
		}
		
}
