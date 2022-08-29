<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>냥반댁 댕댕이</title>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<link rel="stylesheet" href="/css/adminCheck.css">
<link rel="stylesheet" href="/css/loginForm.css">
<link rel="stylesheet" href="/css/noticeList.css">
<link rel="stylesheet" href="/css/qnaList.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">



<style>
#container3 {
	margin:0 auto;
	width: 1500px;
	height: 200px;
	background-color: orange;
}


</style>
</head>
<body>

	<div id="hdcontainer">
		<header>
			<a href="/"><img src="/img/로고3.png" alt="냥반댁 댕댕이 로고" class="logo"></a>
			<input type="text" id="search" placeholder=" 무엇이든지 검색해라냥 🐾">
			<input type="button" id="searchbtn" value="🔍">
			<nav>
			<c:choose>
				<c:when test="${empty principal }">
				<ul id="topMenu">
					<li><a href="/auth/loginForm">로그인</a></li>
					<li><a href="/auth/adminCheck">회원가입</a></li>
					<li><a href="#">장바구니</a></li>
					<li><a href="/notice/noticeList">고객센터</a></li>
				</ul>
				</c:when>
				<c:otherwise>
					<ul id="topMenu">
						<li><a href="#">마이페이지</a><li>
						<li><a href="#">장바구니</a></li>
						<li><a href="/notice/noticeList">고객센터</a></li>
						<li><a href="/logout">로그아웃</a></li>
					</ul>
				</c:otherwise>
				 
				 </c:choose>
			</nav>
		</header>
	</div>
	<div id="hdcontainer2">

		<ul id="topMenu2">
			<li><a href="#">사료/간식</a></li>
			<li><a href="#">화장실/위생</a></li>
			<li><a href="#">장난감</a></li>
			<li><a href="#">미용/목욕</a></li>
			<li><a href="#">하우스</a></li>
			<li><a href="#">기타</a></li>
		</ul>

	</div>