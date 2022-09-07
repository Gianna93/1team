package com.pro.pro.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="product")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
			name = "PRODUCT_SEQ_GENERATOR"
			, sequenceName = "PRODUCT_SEQ"
			, initialValue = 1
			, allocationSize = 1 
		)
public class Product {
		
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="PRODUCT_SEQ_GENERATOR")
	private int id;
	
	@Column(nullable=false, length=2000)
	private String productName;
	
	@Column(nullable=false, length=100)
	private String price;
	
	@Column(nullable=false, length=2000)
	private String content;
	
	@Column(nullable=false)
	private String image;
	
	@Column(nullable=false)
	private String category;
	
	@Column(nullable=false)
	private String pet;
	
	@OrderBy("id desc")
	@JsonIgnoreProperties({"product"})
	@OneToMany(mappedBy="product", fetch=FetchType.EAGER)
	private List<Review> review;

}