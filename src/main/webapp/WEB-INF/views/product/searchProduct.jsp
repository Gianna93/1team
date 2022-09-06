<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../layout/header.jsp"%>
<%
	String search = request.getParameter("search");
	pageContext.setAttribute("search",search);
%>
<div class ="food_container">
<h1 style="font-weight:900;">' <%=search %> ' 검색 결과</h1>
<br><br>

<div id="pop">
<c:forEach var = "product" items="${product.content}">
<c:if test = "${fn:contains(product.productName,search)
				or fn:contains(product.content,search)}">
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
<ul id="food_page" class="pagination justify-content-center">
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