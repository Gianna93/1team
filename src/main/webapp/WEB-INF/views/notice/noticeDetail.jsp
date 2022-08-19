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
<h1>공지사항</h1>
<div class = "container">

	<div>
		<div>
			글 번호 : <span id="id"><i>${notice.num}</i></span>
			작성자 : <span id="id"><i>${notice.customer.id}</i></span>
		</div>
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
	<c:if test="${notice.customer.id==principal.customer.id}">
		<button id="btn-update" class="btn btn-warning">
		<a href="/notice/${notice.id}/updateForm">수정</a></button>
		<button id="btn-delete" class="btn btn-danger">삭제</button>
	</c:if>	
</div>
<br>	
<script type="text/javascript" src="/js/notice.js"></script>
<%@ include file="../layout/footer.jsp"%>