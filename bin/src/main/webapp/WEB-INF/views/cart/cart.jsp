<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ include file="../layout/header.jsp"%>
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
		<h1 style="font-weight:900;">장바구니</h1><br>
		<table class="carttb">
			<tr id="firsttr" >
				<th>상품이름</th>
				<th>상품설명</th>
				<th>개수</th>
				<th>총액</th>
			</tr>
			<tr>
				<td>상품이름</td>
				<td>상품설명</td>
				<td>개수</td>
				<td>총액</td>
			</tr>
			<tr>
			<td colspan="3">선택상품금액 + 배송비 = 예상금액</td>
			<td><button type="button" class="btn btn-success" id="order">주문하기</button></td>
			</tr>
		</table>
	</c:otherwise>
</c:choose>
<script type="text/javascript" src="/js/customer.js"></script>
<%@ include file="../layout/footer.jsp"%>