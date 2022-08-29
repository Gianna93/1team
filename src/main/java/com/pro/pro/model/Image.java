package com.pro.pro.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Entity
@NoArgsConstructor(access= AccessLevel.PROTECTED)
public class Image {
	
	@Id
	@GeneratedValue
	private Long id;
	
	@Column(nullable=false)
	private String originFileName;
	
	@Column(nullable=false)
	private String fileName;
	
	@Column(nullable=false)
	private String filePath;
	
	@Builder
	public Image(Long id, String originFileName, String fileName, String filePath) {
		this.id = id;
		this.originFileName=originFileName;
		this.fileName = fileName;
		this.filePath = filePath;
	}


}
