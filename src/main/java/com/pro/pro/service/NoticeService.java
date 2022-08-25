package com.pro.pro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pro.pro.model.Customer;
import com.pro.pro.model.Notice;
import com.pro.pro.repository.NoticeRepository;

@Service
public class NoticeService {
		
		@Autowired
		private NoticeRepository noticeRepository;
		
		@Transactional
		public int updateCount(int num) {
			return noticeRepository.updateCount(num);
		}
		
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
		public Notice 공지사항상세보기(int num) {
			return noticeRepository.findById(num).orElseThrow(()->{ 
				return new IllegalArgumentException("공지사항 상세보기 실패: 아이디를 찾을 수 없습니다.");
			});
		}
		
		@Transactional
		public void 공지사항삭제하기(int num) { 
			noticeRepository.deleteById(num);
		}
		
		@Transactional
		public void 공지사항수정하기(int id, Notice requestNotice) {
			Notice notice = noticeRepository.findById(id).orElseThrow(()->{
				return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
			});
			notice.setTitle(requestNotice.getTitle());
			notice.setContent(requestNotice.getContent());
		}
		
}
