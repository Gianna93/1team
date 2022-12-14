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
<div class="container">
	<h1>공지사항 수정</h1>
	<form>
		<input type="hidden" id="id" value="${notice.id}"/>
		<div class="form-group">
			<input type="text" class="form-control" value="${notice.title}"
			placeholder="제목" id="title" required>
		</div>
		<div class="form-group">
			<textarea rows="5" class="form-control summernote" id="content"
			 required>${notice.content}</textarea>
		</div>
	</form>
	<button id="btn-update" class="btn btn-primary">수정</button>	
</div>
<br/>
<script>
	$('.summernote').summernote({
		height: 400
	});	
</script>
<script type="text/javascript" src="/js/notice.js"></script>
<%@ include file="../layout/footer.jsp"%>