<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
}
</style>
</head>
<br>

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


<br>
<script type="text/javascript" src="/js/faq.js"></script>
<%@ include file="../layout/footer.jsp"%>