<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
*{
	font-family: 'Gamja Flower', cursive;
}
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
	
}
</style>
</head>
<br>
<<!--  
<h1>공지사항</h1>
<div class = "container">

	<div>
		<div>
		<input type="hidden" id="faqid" value="${faq.faqid}">
		<label for="title">${faq.title}</label>
		<input type="text" id="title" style="border-style:none;">
	</div>
		<br>
		<div>
			<h3>${notice.title}</h3>
		</div>
		<hr/>
	<div>
		<label for="content">${faq.content}</label>
			<input type="text" id="content" style="border-style:none;">
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
-->
<h1>공지사항</h1>
<div class = "container">

	<div>
		<div>
			글 번호 : <span id="num"><i>${faq.faqid}</i></span>
			작성자 : <span id="id"><i>${faq.customer.userid}</i></span>
		</div>
		<br>
		<div>
			<h3>${faq.title}</h3>
		</div>
		<hr/>
		<div>
			<div>${faq.content}</div>
		</div>
		<hr/>
	</div>	
	<br><br>
	<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
	<button class="btn btn-secondary" onclick="location.href='/faq/updateForm/${faqid}';">수정</button>	
	<button class="btn btn-secondary"  id="faq-delete">삭제</button>
</div>
<br>	



<!-- 구분부누주누 -->
<!--<br>
	<div>
		<input type="hidden" id="faqid" value="${faq.faqid}">
		<label for="title">${faq.title}</label>
			<input type="text" id="title" style="border-style:none;">
	</div>
	</hr>
	<div>
		<label for="content">${faq.content}</label>
			<input type="text" id="content" style="border-style:none;">
	</div>
	<div>
		<button onclick="history.back()">돌아가기</button>
		<button type="button" onclick="location.href='/faq/updateForm/${faqid}';">수정</button>\ 
		
		<button id="faq-delete">삭제</button>
	</div>-->
<br>
<script type="text/javascript" src="/js/faq.js"></script>
<%@ include file="../layout/footer.jsp"%>