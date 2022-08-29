<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container">
<div class="logcontainer">
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
</div>
<script type="text/javascript" src="/js/customer.js"></script>
<%@ include file="../layout/footer.jsp"%>