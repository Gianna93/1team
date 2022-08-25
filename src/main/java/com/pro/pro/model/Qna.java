package com.pro.pro.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Table(name="qna")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
			name = "QNA_SEQ_GENERATOR"
			, sequenceName = "QNA_SEQ"
			, initialValue = 1
			, allocationSize = 1
		)
public class Qna {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="QNA_SEQ_GENERATOR")
	private int num;
	
	@Column(nullable=false, length=100)
	private String title;
	
	@Lob
	private String content;
		
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="customerId")
	private Customer customer;
	
	@CreationTimestamp
	private Timestamp createDate;
	
	@OneToMany(mappedBy="qna", fetch=FetchType.EAGER)
	private List<Reply> reply;
	

}
