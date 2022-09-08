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

@Table(name="productReply")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
			name = "proReply_SEQ_GENERATOR"
			, sequenceName = "proReply_SEQ"
			, initialValue = 1
			, allocationSize = 1 
		)

public class productReply {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="proReply_SEQ_GENERATOR")
	private int id;
	
	
	@Column(nullable=false)
	private String title;
	
	@Column(nullable=false)
	private String pronum;
	
	@Column(nullable=false)
	private String productName;
	
	@Column(nullable=false)
	private String content;
	
	@Column(nullable=false)
	@CreationTimestamp
	private Timestamp replyDate;
	
	@Column(nullable=false)
	private String userid;
	
	@Column(nullable=false)
	private String orderid;
	
}
