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
	margin-top: 50px;
	font-weight: 900;
	font-size: 25px;
	text-align: center;
	font-family: 'Gamja Flower', cursive;
}
	


</style>
</head>
<div class="container">
	<h1>공지사항 작성</h1>
	<form>
		<div class="form-group">
			<label for ="title">Title</label>
			<input type="text" class="form-control" placeholder="제목" id="title" required>
		</div>
		<div class="form-group">
			<label for="content">Content</label>
			<textarea rows="5" class="form-control summernote" id="content"
			placeholder="내용을 입력해주세요." required></textarea>
		</div>
	</form>
	<button id="btn-save" class="btn btn-primary">저장</button>	
</div>
<br/>
<script>
	$('.summernote').summernote({
		height: 400
	});	
</script>
<script type="text/javascript" src="/js/notice.js"></script>
<%@ include file="../layout/footer.jsp"%>