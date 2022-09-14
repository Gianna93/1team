package com.pro.pro.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pro.pro.model.Customer;
import com.pro.pro.repository.CustomerRepository;

@Service
public class CustomerService {

	@Autowired
	private CustomerRepository customerRepository;
	

	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Transactional(readOnly=true)
	public Page<Customer> 회원목록(Pageable pageable){
		return customerRepository.findAll(pageable);
	}
	
	@Transactional
	public void 회원가입(Customer customer) {
		String rawPassword = customer.getPassword();
		String encPassword = encoder.encode(rawPassword);
		customer.setPassword(encPassword);
		customerRepository.save(customer);
	}
	
	@Transactional
	public boolean 중복체크(Customer customer) {
		return customerRepository.existsByUserid(customer.getUserid());
	}
	
	@Transactional
	public boolean 번호중복체크(Customer customer) {
		return customerRepository.existsByPhone(customer.getPhone());
	}
	
	@Transactional
	public Optional<Customer> 아이디찾기(Customer customer) {
		return customerRepository.findByPhone(customer.getPhone());	
	}
	
	@Transactional
	public Optional<Customer> 비밀번호찾기(Customer customer) {
		
		return customerRepository.findByUserid(customer.getUserid());	
	}
	
	@Transactional
	public void 비밀번호변경(Customer customer) {
		Customer cus = customerRepository.findByUserid(customer.getUserid()).orElseThrow(()->{
			return new IllegalArgumentException("fail");
			});
		
		String rawPassword = customer.getPassword();
		String encPassword = encoder.encode(rawPassword);
		
		cus.setPassword(encPassword);
		customerRepository.save(cus);
	}
	
	@Transactional
	public void 회원정보수정(Customer customer) {
		Customer cus = customerRepository.findByUserid(customer.getUserid()).orElseThrow(()->{
			return new IllegalArgumentException("fail");
			});
		String rawPassword = customer.getPassword();
		String encPassword = encoder.encode(rawPassword);
		cus.setPassword(encPassword);
		cus.setPhone(customer.getPhone());
		cus.setEmail1(customer.getEmail1());
		cus.setEmail2(customer.getEmail2());
		cus.setAddress1(customer.getAddress1());
		cus.setAddress2(customer.getAddress2());
		cus.setAddress3(customer.getAddress3());
		customerRepository.save(cus);
	}
	
	
}