package com.pro.pro.dto;

import com.pro.pro.model.Image;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ImageDto {
	
	private Long id;
	private String originFileName;
	private String fileName;
	private String filePath;
	
	public Image toEntity() {
		Image build = Image.builder()
				.id(id)
				.originFileName(originFileName)
				.fileName(fileName)
				.filePath(filePath)
				.build();
		return build;
	}
	
	@Builder
	public ImageDto(Long id, String originFileName, String fileName, String filePath) {
		this.id = id;
		this.originFileName = originFileName;
		this.fileName = fileName;
		this.filePath = filePath;
	}

}
