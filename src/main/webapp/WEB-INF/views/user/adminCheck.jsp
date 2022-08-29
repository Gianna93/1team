<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div id="adchkCon">
	<form action="/auth/joinForm">
		<button type="submit" id="check-btn" name="adminck-btn" class="btn btn-secondary btn-lg" value="ADMIN" >관리자 회원가입</button>
		<button type="submit" id="check-btn" name="adminck-btn" class="btn btn-primary btn-lg" value="CUSTOMER" >소비자 회원가입</button>
	</form>
</div>
<%@ include file="../layout/footer.jsp"%>