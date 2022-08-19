<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>냥반댁 댕댕이</title>
<link rel="stylesheet" href="${path}/resources/css/header.css">
<link rel="stylesheet" href="${path}/resources/css/footer.css">

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


</script><script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">



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
			<a href="#"><img src="${path}/resources/img/로고3.png" alt="냥반댁 댕댕이 로고" class="logo"></a>
			<input type="text" id="search" placeholder=" 무엇이든지 검색해라냥 🐾">
			<input type="button" id="searchbtn" value="🔍">
			<nav>
				<ul id="topMenu">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
					<li><a href="#">장바구니</a></li>
					<li><a href="/notice/noticeList">고객센터</a></li>
				</ul>
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