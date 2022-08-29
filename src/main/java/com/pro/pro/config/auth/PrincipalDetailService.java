package com.pro.pro.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.pro.pro.model.Customer;
import com.pro.pro.repository.CustomerRepository;

@Service
public class PrincipalDetailService implements UserDetailsService {
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException{
		Customer principal = customerRepository.findByUserid(userid)
				.orElseThrow(()->{
					return new UsernameNotFoundException("해당 사용자를 찾을 수 없습니다.: ");
				});
		return new PrincipalDetail(principal);
		
	}
	
}
