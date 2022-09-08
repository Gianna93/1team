<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ include file="layout/header.jsp"%>
<div class='maincontainer'>

	  
    <div id="slideShow">
      <div id="slides">
        <img src="/img/slide-1.jpg">
        <img src="/img/slide-2.jpg">
        <img src="/img/slide-3.jpg">
        <img src="/img/slide-4.jpg">
        <button id="prev">&lang;</button>
        <button id="next">&rang;</button> 
      </div>
    </div>
    
    <div id="dogbest">
    	<p class="subtitle">강아지 베스트 상품</p>
    	
    	<c:forEach var = "product" items="${product}" begin="0" end="3" step="1">
			<c:if test="${product.pet == 'dog'}">
			<div class="card">	
				<div class ="food_card_img">
					<a href="/product/productDetail/${product.id}">
  					<img src="${product.image}" alt=""/>
  					</a>
  				</div>	
 				<div class="card-body">
   					 <h5 class="card-title">${product.productName}</h5>
   			 	 	<p class="card-text">
   			 		 <b><fmt:formatNumber value="${product.price}" pattern="#,###"/></b>원</p>
		   		</div>
		    </div>
		   </c:if>
		 </c:forEach>
		</div>
		    
		  
    <div id="catbest">
    	<p class="subtitle">고양이 베스트 상품</p>
    	<c:forEach var = "product" items="${product}" begin="11" end="14" step="1">
			<c:if test="${product.pet == 'cat'}">
			<div class="card">	
				<div class ="food_card_img">
					<a href="/product/productDetail/${product.id}">
  					<img src="${product.image}" alt=""/>
  					</a>
  				</div>	
 				<div class="card-body">
   					 <h5 class="card-title">${product.productName}</h5>
   			 	 	<p class="card-text">
   			 		 <b><fmt:formatNumber value="${product.price}" pattern="#,###"/></b>원</p>
		   		</div>
		    </div>
		   </c:if>
		 </c:forEach>
    </div>
    
    <div id="newproduct">
    
    	<p class="subtitle">신상품</p>
    	<c:forEach var = "product" items="${product}" begin="0" end="45" step="15">
			<div class="card">	
				<div class ="food_card_img">
					<a href="/product/productDetail/${product.id}">
  					<img src="${product.image}" alt=""/>
  					</a>
  				</div>	
 				<div class="card-body">
   					 <h5 class="card-title">${product.productName}</h5>
   			 	 	<p class="card-text">
   			 		 <b><fmt:formatNumber value="${product.price}" pattern="#,###"/></b>원</p>
		   		</div>
		    </div>
		 </c:forEach>

	</div>
 

    <div id="news">
    	<p class="subtitle">알리미</p>
    	<hr>
    	<ul>
    		<li>
    			<a href="/auth/membership"><img src="/img/membericon.jpg"></a>
    			<p>멤버쉽</p>
    		</li>
    		<li>
    			<a href="/auth/mooeja"><img src="/img/mooejaicon.jpg"></a>
    			<p>무이자 할부</p>
    		</li>
    		<li>
    			<a href="https://programs.sbs.co.kr/culture/animalfarm/main"><img src="/img/sbsdongmoolicon.jpg"></a>
    			<p>SBS 동물농장 협찬</p>
    		</li>
    		<li>
    			<a href="https://home.ebs.co.kr/baddog/main"><img src="/img/senagaeicon.jpg"></a>
    			<p>세나개 협찬</p>
    		</li>
    		<li>
    			<a href="http://www.ichannela.com/program/template/program_refinement.do?cateCode=0501&subCateCode=050062&pgm_id=WPG2190210D"><img src="/img/gaebobnamicon.jpg"></a>
    			<p>개밥남 협찬</p>
    		</li>
    		
    	</ul>
    </div>
</div>
<script type="text/javascript" src="/js/index.js"></script>
<%@ include file="layout/footer.jsp"%>