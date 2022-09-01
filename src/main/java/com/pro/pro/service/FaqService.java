package com.pro.pro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pro.pro.model.Customer;
import com.pro.pro.model.Faq;
import com.pro.pro.repository.FaqRepository;

@Service
public class FaqService {

	@Autowired
	private FaqRepository faqRepository;

	@Transactional
	public void write(Faq faq, Customer customer) {
		faq.setCustomer(customer);
		faqRepository.save(faq);
	}

	@Transactional(readOnly = true)
	public Page<Faq> postList(Pageable pageable) {
		return faqRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public Faq postView(int faqid) {
		return faqRepository.findById(faqid).orElseThrow(() -> {
			return new IllegalArgumentException("실패");
		});
	}

	@Transactional
	public void postDelete(Faq faq) {
		faqRepository.deleteById(faq.getFaqid());
	}

	@Transactional
	public void postUpdate(Faq after) {
		Faq before = faqRepository.findById(after.getFaqid()).orElseThrow(() -> {
			return new IllegalArgumentException("실패");
		});
		before.setContent(after.getContent());
		before.setTitle(after.getTitle());
		faqRepository.save(before);
	}
	@Transactional
	public Faq postUpdate2(int faqid) {
		return faqRepository.findById(faqid).orElseThrow(() -> {
			return new IllegalArgumentException("실패");
		});
	}
}