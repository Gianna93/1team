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
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="reply")
@Data
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
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="REPLY_SEQ_GENERATOR")
	private int id;
	
	@Column(nullable=false, length=200)
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
