package com.pro.pro.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name = "REPLY_SEQ_GENERATOR"
		, sequenceName = "REPLY_SEQ"
		, initialValue = 1
		, allocationSize = 1
	)
public class Reply {
	public void save(Qna qna, Customer customer) {
		this.qna = qna;
		this.customer = customer;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="REPLY_SEQ_GENERATOR")
	private int id;
	
	@Column(nullable=false, length=500)
	private String content;
	
	@ManyToOne
	@JoinColumn(name="qnaId")
	private Qna qna;
	
	@ManyToOne
	@JoinColumn(name="customerId")
	private Customer customer;
	
	@CreationTimestamp
	private Timestamp createDate;

}
