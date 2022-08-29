<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container">
<h1>상품 등록</h1>
<form class="form_set">
	<div class="form-group">
			<label for="product_name"><b>상품명</b></label>
			<input type="text" class="form-control" placeholder="상품명" id="product_name" name="product_name" required>
	</div>
	<div class="form-group">
			<label for="product_price"><b>가격</b></label>
			<input type="text" class="form-control" placeholder="가격" id="product_price" name="product_price" required>
	</div>
	<div class="form-group">
			<label for="product_content"><b>상품 설명</b></label>
			<input type="text" class="form-control" placeholder="상품 설명" id="product_content" name="product_content">
	</div>
	<div class="form-group">
			<label for="product_image"><b>상품 사진</b></label>
			<input type="file"  class="form-control" id="product_image" name="product_image" required>
	</div>
	<div class="form-group">
			<label for="product_category"><b>상품 카테고리</b></label>
			<select id="product_category">
				<option value="" selected>-- 선택 --</option>
				<option value="food">사료/간식</option>
				<option value="bath">화장실/위생</option>
				<option value="toy">장난감</option>
				<option value="beauty">미용/목욕</option>
				<option value="house">하우스</option>
				<option value="etc">기타</option>
			</select>
	</div>
	<div class="form-group">
			<label id="product_pet" for="product_pet"><b>해당 반려동물</b></label>
			<input type="radio" name="select_pet" id="dog" value="dog" checked>강아지
			<input type="radio" name="select_pet" id="cat" value="cat">고양이
	</div>

</form>
<button id="btn-save">상품등록</button>
</div>
<script type="text/javascript" src="/js/product.js"></script>
<%@ include file="../layout/footer.jsp"%>


