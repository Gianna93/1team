package com.pro.pro.test;

import java.util.List;
import java.util.function.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.pro.pro.model.Customer;
import com.pro.pro.repository.CustomerRepository;

@RestController
public class DummyControllerTest {

	@Autowired
	private CustomerRepository customerRepository;

	@GetMapping("dummy/customer/{id}")
	public Customer detail(@PathVariable Integer id) {
		Customer customer = customerRepository.findById(id).orElseThrow(new Supplier<IllegalArgumentException>() {
			public IllegalArgumentException get() {
				return new IllegalArgumentException("해당 유저는 없습니다. id : " + id);
			}
		});
		return customer;
	}

	@GetMapping("dummy/customer")
	public List<Customer> list() {
		return customerRepository.findAll();
	}
}
