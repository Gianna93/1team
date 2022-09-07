<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>냥반댁 댕댕이</title>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/adminCheck.css">
<link rel="stylesheet" href="/css/loginForm.css">
<link rel="stylesheet" href="/css/joinForm.css">
<link rel="stylesheet" href="/css/myPage.css">
<link rel="stylesheet" href="/css/noticeList.css">
<link rel="stylesheet" href="/css/qnaList.css">
<link rel="stylesheet" href="/css/registerForm.css">
<link rel="stylesheet" href="/css/foodProduct.css">
<link rel="stylesheet" href="/css/cart.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">



<style>



</style>
</head>
<body>

	<div id="hdcontainer">
		<header>
			<a href="/"><img src="/img/로고3.png" alt="냥반댁 댕댕이 로고" class="logo"></a>
			<form action="/product/searchProduct" method="get">
				<input type="text" id="search" name="search" placeholder=" 무엇이든지 검색해라냥 🐾">
				<button type="submit" style="border:none; background-color:white">
					<img src="/img/icon_btn.png" id="searchbtn">
				</button>
			</form>
			<nav class="navbar navbar-expand-sm sticky-top">
			<c:choose>
				<c:when test="${empty principal }">
				<ul id="topMenu">
					<li><a href="/auth/loginForm">로그인</a></li>
					<li><a href="/auth/adminCheck">회원가입</a></li>
					<li><a href="/auth/cart">장바구니</a></li>
					<li><a href="/notice/noticeList">고객센터</a></li>
				</ul>
				</c:when>
				<c:otherwise>
					<span id="loginsp"><b>${principal.customer.name}(${principal.customer.userid})님</b></span>
					<ul id="topMenu">
						<li><a href="/auth/myPage">마이페이지</a><li>
						<c:if test="${principal.customer.roles eq 'ADMIN' }">
						<li><a href="/product/registerForm">상품/주문관리</a></li>
						</c:if>
						<li><a href="/notice/noticeList">고객센터</a></li>
						<c:if test="${principal.customer.roles eq 'CUSTOMER' }">
						<li><a href="/auth/cart">장바구니</a></li>
						</c:if>
						
						
						<li><a href="/logout">로그아웃</a></li>
					</ul>
				</c:otherwise>
				 
				 </c:choose>
			</nav>
		</header>
	</div>
	<div id="hdcontainer2">

		<ul id="topMenu2">
			<li><a href="/product/foodProduct">사료/간식</a></li>
			<li><a href="/product/bathProduct">화장실/위생</a></li>
			<li><a href="/product/toyProduct">장난감</a></li>
			<li><a href="/product/beautyProduct">미용/목욕</a></li>
			<li><a href="/product/houseProduct">하우스</a></li>
			<li><a href="/product/etcProduct">기타</a></li>
		</ul>

	</div>