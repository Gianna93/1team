<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../layout/header.jsp"%>

<div class ="food_container">
<h1 style="font-weight:900;">화장실 / 위생</h1>
<br><br>

<div class="food_btndiv">
	<div class="btn-group" role="group" aria-label="Basic radio toggle button group" style="margin-left:525px;">
 		<input type="radio" class="btn-check" name="select_pet" id="dog" value="dog" autocomplete="off" checked >
		<label class="btn btn-outline-success" for="dog">강아지</label>
		<input type="radio" class="btn-check" name="select_pet" id="cat" value="cat" autocomplete="off">
		<label class="btn btn-outline-success" for="cat">고양이</label>
	</div>
</div>

<br><br>
<div id="dog_pop">
<c:forEach var = "product" items="${product}">
<c:if test="${product.category == 'bath' && product.pet == 'dog'}">
	<div class="card">
	<div class = "food_card_img">
  		<img src="${product.image}" alt="#" onclick="location.href='/product/productDetail/${product.id}';"  />
  		</div>
 		 <div class="food_card_body">
   			 <a href="/product/productDetail/${product.id}" style="text-decoration:none; color:black;"><h5 class="food_card_title">${product.productName}</h5></a>
   			 <a href="/product/productDetail/${product.id}" style="text-decoration:none; color:black;">
   			 <p class="food_card-text"><b><fmt:formatNumber value="${product.price }" pattern="#,###"/></b>원</p></a>
		  </div>
	</div>
</c:if>	
</c:forEach>
</div>

<div id="cat_pop" style="display:none;">
<c:forEach var = "product" items="${product}">
<c:if test="${product.category == 'bath' && product.pet == 'cat'}">
	<div class="card">
	<div class = "food_card_img">
  		 <img src="${product.image}" alt="#" onclick="location.href='/product/productDetail/${product.id}';"  />
  		 </div>
 		 <div class="food_card_body">
   			 <a href="/product/productDetail/${product.id}" style="text-decoration:none; color:black;"><h5 class="food_card_title">${product.productName}</h5></a>
   			 <a href="/product/productDetail/${product.id}" style="text-decoration:none; color:black;"><p class="food_card_text"><b><fmt:formatNumber value="${product.price }" pattern="#,###"/></b>원</p></a>
		  </div>
	</div>
</c:if>	
</c:forEach>
</div>


<br>


	</div>
<script type="text/javascript" src="/js/product.js"></script>
<%@ include file="../layout/footer.jsp"%>