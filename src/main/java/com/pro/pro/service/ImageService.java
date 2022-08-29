package com.pro.pro.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pro.pro.dto.ImageDto;
import com.pro.pro.model.Image;
import com.pro.pro.repository.ImageRepository;

@Service
public class ImageService {
		
		private ImageRepository imageRepository;
		
		public ImageService(ImageRepository imageRepository) {
			this.imageRepository = imageRepository;
		}
		
		@Transactional
		public Long saveImage(ImageDto imageDto) {
			return imageRepository.save(imageDto.toEntity()).getId();
		}
		
		@Transactional
		public ImageDto getImage(Long id) {
			Image image = imageRepository.findById(id).get();
			ImageDto imageDto = ImageDto.builder()
					.id(id)
					.originFileName(image.getOriginFileName())
					.fileName(image.getFileName())
					.filePath(image.getFilePath())
					.build();
			return imageDto;
		}
}
