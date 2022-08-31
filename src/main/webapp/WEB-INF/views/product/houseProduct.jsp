<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../layout/header.jsp"%>

<div class ="container">
<h1>하우스</h1>
<br><br>
<div class="select_pet">
<input type="radio" name="select_pet" id="dog" value="dog" checked>강아지
<input type="radio" name="select_pet" id="cat" value="cat">고양이
</div>
<br><br>
<div id="dog_pop">
<c:forEach var = "product" items="${product.content}">
<c:if test="${product.category == 'house' && product.pet == 'dog'}">
	<div class="card">
  		<img src="${product.image}" alt=""/>
 		 <div class="card-body">
   			 <h5 class="card-title">${product.productName}</h5>
   			 <p class="card-text">${product.price}원</p>
		  </div>
	</div>
</c:if>	
</c:forEach>
</div>

<div id="cat_pop" style="display:none;">
<c:forEach var = "product" items="${product.content}">
<c:if test="${product.category == 'house' && product.pet == 'cat'}">
	<div class="card">
  		<img src="${product.image}" alt=""/>
 		 <div class="card-body">
   			 <h5 class="card-title">${product.productName}</h5>
   			 <p class="card-text">${product.price}원</p>
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