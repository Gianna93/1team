<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="logcontainer">
	<form action="/auth/loginProc" method="post" name="frm">
		<div class="form-group">
			<label for="id">ID</label> <input type="text"
				class="form-control" placeholder="Enter id" 
				id="username" name="username">
		</div>
		<div class="form-group">
			<label for="password">PASSWORD</label> <input type="password"
				class="form-control" placeholder="Enter password" 
				id="password" name="password">
		</div>
		<br>
	<div id="faillogin" class="alert alert-danger" ></div>
		
		<button type="submit" id="btn-login" class="btn btn-dark">로그인</button>
		</form>
		<button id="btn-find" class="btn btn-dark">아이디/비밀번호찾기</button>
</div>
<script type="text/javascript" src="/js/customer.js"></script>
<%@ include file="../layout/footer.jsp"%>