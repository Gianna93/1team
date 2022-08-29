
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form>
		<div class="form-group">
			<label for="password"><b>비밀번호를 입력하세요</b></label> <br>
			<input type="password" class="form-control" placeholder="비밀번호" id="password">
		</div>
	</form>
	<button id="btn-ok" class="btn btn-dark" >확인</button>
</div>

<script type="text/javascript" src="/js/customer.js"></script>
<%@ include file="../layout/footer.jsp"%>