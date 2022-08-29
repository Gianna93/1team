<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<br>
<div class = "container">
	<form>	
		<input type="hidden" id="faqid" value="${faq.faqid}"/>
		<div>
			<ul style="list-style:none;">
				<li><label for="title">title</label></li>
				<li><input type="text" id="title" value="${faq.title}"></li>
			</ul>
		</div>
		<div>
			<ul style="list-style:none;">
				<li><label for="content">Content</label></li>
				<li><textarea rows="5" id="content">${faq.content}</textarea></li>
			</ul>
		</div>
		<button id="faq-update">저장</button>
	</form>
<br/>	
</div>
<br>

<script type="text/javascript" src="/js/faq.js"></script>
<%@ include file="../layout/footer.jsp"%>