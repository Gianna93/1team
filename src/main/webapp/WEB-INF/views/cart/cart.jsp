<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../layout/header.jsp"%>


<%! int a= 0; %>
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
		<form name="form" id="form" >
		<table class="carttb">
			<tr id="firsttr" >
				<th></th>
				<th colspan="2">상품명</th>
				<th>상품설명</th>
				<th>개수</th>
				<th>개별금액 / 합산급액</th>
				<th></th>
				<th></th>
			</tr>
			
			<% a=0; %>
			<c:forEach var = "cart" items="${carts}">
			<c:if test="${cart.userid eq principal.customer.userid }">
			<% a=1; %>
			</c:if>
			</c:forEach>
			<c:if test="<%= a==0 %>">
				<tr>
					<td colspan="7"><b>장바구니가 비어있습니다.</b></td>
				</tr>
			</c:if>
				<c:forEach var = "cart" items="${carts}">
					
						
							<c:if test="${cart.userid eq principal.customer.userid }">
								
								<tr>
									<td>
									<input type="checkbox" id="${cart.id }" class="chk${cart.id }" name="chkbox" onClick="itemSum(this.form);"  value="${cart.sumprice }">
									
									<input type="hidden" id="cartId"  value="${cart.id }">
									<input type="hidden" id="userId"  value="${cart.userid }">
									<input type="hidden" id="productNumber" value="${cart.pronum }">
									</td>
									<td>
									<img src="${cart.image}">
									<input type="hidden" value="${cart.image }" id="productImg">
									</td>
									<td>
									<b>${cart.productName }</b>
									<input type="hidden" value="${cart.productName }" id="productName">
									</td>
									<td>
									
									<c:if test="${cart.pet eq 'dog'}">${cart.content }/<b>강아지용</b></c:if>
									<c:if test="${cart.pet eq 'cat'}">${cart.content }/<b>고양이용</b></c:if>
									
									<input type="hidden" value="${cart.content }" id="productContent">
									<input type="hidden" value="${cart.pet }" id="productPet">
									</td>
									<td>
				
									<input type="number" id="num${cart.id }" value="${cart.count }" class="p_num" name="productCount${cart.id }" style="width: 60px;" min="1" max="99" onchange="javascript:index.changeCount(${cart.id}); javascript:itemSum(this.form); countno(${cart.id});" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
									<input type="hidden" class="hidecount${cart.id }" value="${cart.count }">
									</td>
									<td class='pritd' style="width: 150px;">
									<span id="countPrice"><fmt:formatNumber value="${cart.price}" pattern="#,###" /></span>원
									 / <span class="sumCountPrice${cart.id }"><fmt:formatNumber value="${cart.sumprice }" pattern="#,###" /></span>원
									<input type="hidden" value="${cart.price}" class="Price${cart.id }">
									<input type="hidden" value="${cart.sumprice}" id="sumPrice">
									<input type="hidden" class="hideSumprice${cart.id }" value="${cart.sumprice }">
									
									</td>
									<td style="width: 150px;">
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
			<b><span id="total_sum"></span></b>
			
					
					

			</td>
			<td><button type="button" class="btn btn-success" id="btn-order">주문하기</button></td>
			<td><button type="button" class="btn btn-danger" id="btn-clear" >전체비우기</button></td>
			</tr>
		</table>
		</form>
		</div>
	</c:otherwise>
</c:choose>
<script type="text/javascript" src="/js/cart.js"></script>
<%@ include file="../layout/footer.jsp"%>