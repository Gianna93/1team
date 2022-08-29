package com.pro.pro.dto;

import com.pro.pro.model.Product;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ProductDto {
		
		private int id;
		private String productName;
		private String price;
		private Long imageId;
		private String category;
		private String pet;
		
		public Product toEntity() {
			Product build = Product.builder()
					.id(id)
					.productName(productName)
					.price(price)
					.imageId(imageId)
					.category(category)
					.pet(pet)
					.build();
			return build;
		}
		
		@Builder
		public ProductDto(int id, String productName, String price, Long imageId, String category, String pet) {
			this.id=id;
			this.productName =productName;
			this.price = price;
			this.imageId = imageId;
			this.category = category;
			this.pet = pet;
		}
		
}
