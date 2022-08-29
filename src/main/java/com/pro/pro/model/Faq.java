package com.pro.pro.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="FAQ")
@SequenceGenerator(
name = "FAQ_SEQ_GENERTOR"
, sequenceName = "FAQ_SEQ"
, initialValue = 1
, allocationSize = 1
)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Faq {
	@Id //primary key
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="FAQ_SEQ_GENERTOR")
	private int faqid;
	
	@Column(nullable=false, length = 100)
	private String title;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="customerId")
	private Customer customer;
	
	@Lob
	private String content;


}