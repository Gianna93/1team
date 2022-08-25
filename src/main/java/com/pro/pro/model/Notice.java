package com.pro.pro.model;

import java.sql.Timestamp;

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

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Table(name="notice")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
			name = "NOTICE_SEQ_GENERATOR"
			, sequenceName = "NOTICE_SEQ"
			, initialValue = 1
			, allocationSize = 1
		)
public class Notice {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="NOTICE_SEQ_GENERATOR")
	private int num;
	
	@Column(nullable=false, length=100)
	private String title;
	
	@Lob
	private String content;
	
	@Column(columnDefinition="integer default 0", nullable=false)
	private int count; //조회수
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="customerId")
	private Customer customer;
	
	@CreationTimestamp
	private Timestamp createDate;
	

}
