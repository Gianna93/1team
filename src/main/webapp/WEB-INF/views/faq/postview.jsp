<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br>
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
		<button type="button" onclick="location.href='/FAQ/postUpdate/${faqid}';">수정</button>
		<!-- 아니 왜 404에러나냐 -->
		<!-- 오늘은 왜 400임;;; -->
		
		<button id="faq-delete">삭제</button>
	</div>
<br>
<script type="text/javascript" src="/js/faq.js"></script>
<%@ include file="../layout/footer.jsp"%>