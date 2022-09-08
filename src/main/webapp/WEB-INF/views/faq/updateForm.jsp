<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<br>
<div class = "container">
	<h1 id="titleh1">FAQ 수정</h1>
	<form>	
		<input type="hidden" id="faqid" value="${faq.faqid}"/>
		<div>
			<ul style="list-style:none;">
				
				<li><input type="text" class="form-control" id="title" value="${faq.title}"></li>
			</ul>
		</div>
		<div>
			<ul style="list-style:none;">
				
				<li><textarea rows="5" class="form-control summernote" id="content">${faq.content}</textarea></li>
			</ul>
		</div>
		<button id="faq-update" class="btn btn-primary">저장</button>
	</form>
<br/>	
</div>
<br>
<script>
	$('.summernote').summernote({
		height: 400
	});	
</script>
<script type="text/javascript" src="/js/faq.js"></script>
<%@ include file="../layout/footer.jsp"%>