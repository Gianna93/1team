<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<head>
<style>
.container {
	margin-top: 50px;
	width: 1000px;
	height: 700px;
	margin: 0 auto;
}
h1{
	font-weight: 900;
	font-size: 25px;
	text-align: center;
	font-family: 'Gamja Flower', cursive;
}
</style>
</head>
<br>
<h1>공지사항</h1>
<div class = "container">

	<div>
		<div>
			글 번호 : <span id="num"><i>${notice.num}</i></span>
			작성자 : <span id="id"><i>${notice.customer.userId}</i></span>
		</div>
		<br>
		<div>
			<h3>${notice.title}</h3>
		</div>
		<hr/>
		<div>
			<div>${notice.content}</div>
		</div>
		<hr/>
	</div>	
	<br><br>
	<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
	<c:if test="${notice.customer.userId==principal.customer.userId}">
		<button class="btn btn-warning">
		<a href="/notice/${notice.num}/updateForm">수정</a></button>
		<button id="btn-delete" class="btn btn-danger">삭제</button>
	</c:if>	
</div>
<br>	
<script type="text/javascript" src="/js/notice.js"></script>
<%@ include file="../layout/footer.jsp"%>