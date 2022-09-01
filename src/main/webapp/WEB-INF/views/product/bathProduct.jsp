<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../layout/header.jsp"%>

<div class ="container">
<h1 style="font-weight:900;">화장실 / 위생</h1>
<br><br>
<div class="btndiv">
	<div class="btn-group" role="group" aria-label="Basic radio toggle button group" style="margin-left:525px;">
 		<input type="radio" class="btn-check" name="select_pet" id="dog" value="dog" autocomplete="off" checked >
		<label class="btn btn-outline-success" for="dog">강아지</label>
		<input type="radio" class="btn-check" name="select_pet" id="cat" value="cat" autocomplete="off">
		<label class="btn btn-outline-success" for="cat">고양이</label>
	</div>
</div>
<br><br>
<div id="dog_pop">
<c:forEach var = "product" items="${product.content}">
<c:if test="${product.category == 'bath' && product.pet == 'dog'}">
	<div class="card">
  		<img src="${product.image}" alt="#" onclick="location.href='/product/productDetail/${product.id}';"  />
 		 <div class="card-body">
   			 <a href="/product/productDetail/${product.id}" style="text-decoration:none; color:black;"><h5 class="card-title">${product.productName}</h5></a>
   			 <a href="/product/productDetail/${product.id}" style="text-decoration:none; color:black;"><p class="card-text">${product.price}원</p></a>
		  </div>
	</div>
</c:if>	
</c:forEach>
</div>

<div id="cat_pop" style="display:none;">
<c:forEach var = "product" items="${product.content}">
<c:if test="${product.category == 'bath' && product.pet == 'cat'}">
	<div class="card">
  		 <img src="${product.image}" alt="#" onclick="location.href='/product/productDetail/${product.id}';"  />
 		 <div class="card-body">
   			 <a href="/product/productDetail/${product.id}" style="text-decoration:none; color:black;"><h5 class="card-title">${product.productName}</h5></a>
   			 <a href="/product/productDetail/${product.id}" style="text-decoration:none; color:black;"><p class="card-text">${product.price}원</p></a>
		  </div>
	</div>
</c:if>	
</c:forEach>
</div>

<br><br>
<ul id="page" class="pagination justify-content-center">
			<c:choose>
				<c:when test="${product.first}">
					<li class="page-item disabled"><a style="text-decoration:none; color:black" class="page-link" href="?page=${product.number-1}">◁</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a style="text-decoration:none; color:black" class="page-link" href="?page=${product.number-1}">◁</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${product.last}">
					<li class="page-item disabled"><a style="text-decoration:none; color:black" class="page-link" href="?page=${product.number+1}">▷</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a style="text-decoration:none; color:black" class="page-link" href="?page=${product.number+1}">▷</a></li>
				</c:otherwise>
			</c:choose>		
		</ul>	

	</div>
<script type="text/javascript" src="/js/product.js"></script>
<%@ include file="../layout/footer.jsp"%>