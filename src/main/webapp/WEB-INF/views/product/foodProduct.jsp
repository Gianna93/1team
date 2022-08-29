<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../layout/header.jsp"%>

<div class ="container">
<h1>사료 / 간식</h1>
<div class="select_pet">
<input type="radio" name="select_pet" id="dog" value="dog" checked>강아지
<input type="radio" name="select_pet" id="cat" value="cat">고양이
</div>
<div class="procuct_set">
${product.img}
${product.product_name}
${product.price}
</div>

 <c:if test="${principal.customer.roles=='ADMIN'}">
		<button id="btn-product-register"><a style="text-decoration:none; color:black" href="/product/registerForm">상품등록</a></button>
	</c:if>
	</div>
<%@ include file="../layout/footer.jsp"%>