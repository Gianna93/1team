package com.pro.pro.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="userorder")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
			name = "ORDER_SEQ_GENERATOR"
			, sequenceName = "ORDER_SEQ"
			, initialValue = 1
			, allocationSize = 1 
		)
public class Order {
		
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="ORDER_SEQ_GENERATOR")
	private int id;
	
	@Column(nullable=false, length=100)
	private String productName;
	
	@Column(nullable=false, length=100)
	private String price;
	
	@Column(nullable=false, length=100)
	private String sumprice;
	
	@Column(nullable=false, length=100)
	private String content;
	
	@Column
	private String image;
	
	@Column(nullable=false)
	private String category;
	
	@Column(nullable=false)
	private String pet;

	@Column(nullable=false)
	private String count;
	
	@Column(nullable=false)
	private String userid;
	
	@Column(nullable=false)
	private String addr1;
	
	@Column(nullable=false)
	private String addr2;
	
	@Column(nullable=false)
	private String addr3;
	
	@Column(nullable=false)
	private String phone;
	
	@Column(nullable=false)
	@CreationTimestamp
	private Timestamp orderDate;
	
	@Column(nullable=false)
	private String state;
}