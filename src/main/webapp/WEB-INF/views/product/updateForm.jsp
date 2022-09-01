<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ include file="../layout/header.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<div class="d-flex align-items-start">
  <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
    <button class="nav-link" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" onclick="location.href='/product/registerForm'" >상품등록</button>
    <button class="nav-link active" id="v-pills-update-tab" data-bs-toggle="pill" data-bs-target="#v-pills-update" type="button" role="tab" aria-controls="v-pills-update" onclick="location.href='/product/updateForm'" >상품수정/삭제</button>
  </div>
  <div class="tab-content" id="v-pills-tabContent">
  
  
  
   
    <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab"><div>
	<form><br>
	<p class="myPageTitle">상품 수정/삭제</p>
	<br><br>
		<div class="form-group">
			<label for="product_name"><b>상품명</b></label>
			<input id="product_name" type="hidden">
			<select id="product_name_selected">
				<option value="" selected>--- 선택 ---</option>
				<optgroup label ="사료/간식">
					<c:forEach var = "product" items="${product.content}">
						<c:if test="${product.category == 'food'}">
							<option value="${product.id}">${product.productName}</option>
						</c:if>
					</c:forEach>	
				</optgroup>
				<optgroup label ="화장실/위생">
					<c:forEach var = "product" items="${product.content}">
						<c:if test="${product.category == 'bath'}">
							<option value="${product.id}">${product.productName}</option>
						</c:if>
					</c:forEach>	
				</optgroup>
				<optgroup label ="장난감">
					<c:forEach var = "product" items="${product.content}">
						<c:if test="${product.category == 'toy'}">
							<option value="${product.id}">${product.productName}</option>
						</c:if>
					</c:forEach>	
				</optgroup>
				<optgroup label ="미용/목욕">
					<c:forEach var = "product" items="${product.content}">
						<c:if test="${product.category == 'beauty'}">
							<option value="${product.id}">${product.productName}</option>
						</c:if>
					</c:forEach>	
				</optgroup>
				<optgroup label ="하우스">
					<c:forEach var = "product" items="${product.content}">
						<c:if test="${product.category == 'house'}">
							<option value="${product.id}">${product.productName}</option>
						</c:if>
					</c:forEach>	
				</optgroup>
				<optgroup label ="기타">
					<c:forEach var = "product" items="${product.content}">
						<c:if test="${product.category == 'etc'}">
							<option value="${product.id}">${product.productName}</option>
						</c:if>
					</c:forEach>	
				</optgroup>
			</select>
		</div>
		
		<div class="form-group">
			<label for="product_price"><b>가격</b></label>
			<input type="text" class="form-control" id="product_price" name="product_price" required>
		</div>
		
		<div class="form-group">
			<label for="product_content"><b>상품 설명</b></label>
			<input type="text" class="form-control"  id="product_content" name="product_content">
		</div>
		
		<div class="form-group">
			 <label for="product_image"><b>상품 사진</b></label>
         <input type="file"  class="form-control" id="product_image" name="product_image" required>
        <input type="hidden" name="file_path" id="file-path" style="width: 300px;">
        
		</div>
		<br>
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
		<br>
		<div class="form-group">
			<label name="select_pet" id="product_pet" for="product_pet"><b>해당 반려동물</b></label>
			<input type="radio" name="select_pet" id="dog" value="dog">강아지
			<input type="radio" name="select_pet" id="cat" value="cat">고양이
		</div>	
	</form>
	<button id="btn-update" class="btn btn-dark" style="width:140px; float:left;">상품수정</button>
	<button id="btn-delete" class="btn btn-dark" style="width:140px; float:left;">상품삭제</button>
	</div></div>
	
  </div>
</div>







<script type="text/javascript" src="/js/product.js"></script>
<%@ include file="../layout/footer.jsp"%>