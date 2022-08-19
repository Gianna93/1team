package com.cos.homepage.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="customer")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Customer {
	@Id
	@Column(nullable=false, length=30, unique=true)
	private String id;
	
	@Column(nullable=false, length=100)
	private String password;
	
	@Column(nullable=false, length=30)
	private String name;
	
	@Column(nullable=false, length=50)
	private String email;
	
	@Column(nullable=false, length=100)
	private String address;
	
	@Enumerated(EnumType.STRING)
	private RoleType roles;

}
