<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../layout/header.jsp"%>

<% int finalprice = 0; 
	pageContext.setAttribute("finalprice", finalprice);
%>

<c:choose>
	<c:when test="${empty principal }">
	<script>
	alert("로그인후 사용 할 수 있는 페이지 입니다.");
	</script>
		

	<div class="logcontainer">
	<br><br>
		<form action="/auth/loginProc" method="post">
		<br>
			<div class="form-group">
				<label for="username"><b>아이디</b></label> <input type="text"
				class="form-control" placeholder="Enter id" 
				id="username" name="username" autofocus>
			</div>
			<div class="form-group">
				<label for="password"><b>비밀번호</b></label> <input type="password"
				class="form-control" placeholder="Enter password" 
				id="password" name="password">
			</div>
			<br>
		
			<button type="submit" id="btn-login" class="btn btn-dark">로그인</button>
		</form>
		<button id="findid-btn" class="btn btn-dark" onclick="findAccount()">아이디/비밀번호 찾기</button><br>
	</div>


	</c:when>
	<c:otherwise>
	<br>
	<div class="cartcontainer">
		<h1 style="font-weight:900;">장바구니</h1><br>
		<form name="form" id="form" onload = "alert('hello')">
		<table class="carttb">
			<tr id="firsttr" >
				<th></th>
				<th></th>
				<th>상품명</th>
				<th>상품설명</th>
				<th>개수</th>
				<th>개별금액 / 합산급액</th>
				<th></th>
				<th></th>
			</tr>
			
				<c:forEach var = "cart" items="${carts.content}">
					
						
							<c:if test="${cart.userid eq principal.customer.userid }">
								
								<tr>
									<td>
									<input type="checkbox" id="${cart.id }" name="chkbox" onClick="itemSum(this.form);"  value="${cart.sumprice }">
									${cart.id }
									<input type="hidden" id="cartId"  value="${cart.id }">
									<input type="hidden" id="userId"  value="${cart.userid }">
									</td>
									<td>
									<img src="${cart.image}">
									<input type="hidden" value="${cart.image }">
									</td>
									<td>
									<b>${cart.productName }</b>
									<input type="hidden" value="${cart.productName }">
									</td>
									<td>
									${cart.content }
									<input type="hidden" value="${cart.content }">
									</td>
									<td>
				
									<input type="number" value="${cart.count }" class="productCount" style="width: 40px;" min="1" max="99">
									</td>
									<td class='pritd'>
									<span id="countPrice"><fmt:formatNumber value="${cart.price}" pattern="#,###" /></span>원
									 / <span id="sumCountPrice"><fmt:formatNumber value="${cart.sumprice }" pattern="#,###" /></span>원
									</td>
									<td>
									<button type="button" class="btn btn-danger btn-cartdel" value="${cart.id }" >삭제</button>
									</td>
									
								</tr>
							</c:if>
							
					
					
				</c:forEach>
			
			<tr>
			<td></td>
			<td><b>총 금액 : </b></td>
			<td colspan="3">
			(합산금액 + 배송비 = 총 결제 금액)<br>
			<span id="total_sum"></span>
					
					

			</td>
			<td><button type="button" class="btn btn-success" id="order">주문하기</button></td>
			<td><button type="button" class="btn btn-danger" id="btn-clear" >전체비우기</button></td>
			</tr>
		</table>
		</form>
		</div>
	</c:otherwise>
</c:choose>
<script type="text/javascript" src="/js/cart.js"></script>
<%@ include file="../layout/footer.jsp"%>