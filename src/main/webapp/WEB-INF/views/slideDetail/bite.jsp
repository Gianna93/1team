<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../layout/header.jsp"%>

<div class ="food_container">
<img src="/img/slide-2.jpg"><br><br>
<p class="subtitle">네츄럴코어 간식 2+1 Event</p>
<br><br>
<div id="dog_pop">
<c:forEach var = "product" items="${product}">
<c:if test = "${fn:contains(product,'네추럴')}">
	<div class="card">
	<div class ="food_card_img">
  		<img src="${product.image}" alt="#" onclick="location.href='/product/productDetail/${product.id}';"  />
  		</div>
 		 <div class="food_card_body">
   			 <a href="/product/productDetail/${product.id}" style="text-decoration:none; color:black;"><h5 class="food_card_title">${product.productName}</h5></a>
   			 <a href="/product/productDetail/${product.id}" style="text-decoration:none; color:black;">
   			 <p class="food_card_text"><b><fmt:formatNumber value="${product.price }" pattern="#,###"/></b>원</p></a>
		  </div>
	</div>
</c:if>	
</c:forEach>
</div>


<br><br>
	

	</div>
<script type="text/javascript" src="/js/product.js"></script>
<%@ include file="../layout/footer.jsp"%>


