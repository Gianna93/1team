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

<c:choose>
	<c:when test ="${search !=''}">
					<c:if test = "${not fn:contains(product,search)}">
						<p style="text-align:center;">해당 상품은 존재하지 않습니다.</p>
					</c:if>
						<c:forEach var = "product" items="${product}">
						<c:if test = "${fn:contains(product,search)}">	
						<div id="pop">
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
						</div>
						</c:if>
						</c:forEach>
					
	</c:when>
	<c:otherwise>
			<p style="text-align:center;">검색어를 입력해주세요.</p>
	</c:otherwise>
</c:choose>


<br><br>


	</div>
<script type="text/javascript" src="/js/product.js"></script>
<%@ include file="../layout/footer.jsp"%>