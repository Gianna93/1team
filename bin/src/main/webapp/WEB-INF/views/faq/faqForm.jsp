<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap');
	
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
	margin-top: 50px;
	font-weight: 900;
	font-size: 25px;
	text-align: center;
	font-family: 'Gamja Flower', cursive;
}
	


</style>
</head>




<div class="container">
	<h1>자주 묻는 질문 작성</h1>
	<form>
		<div class="form-group">
			<h5>Title</h5>
			<input type="text" class="form-control" placeholder="제목" id="title" required>
		</div>
		<div class="form-group">
			<h5>Content</h5>
			<textarea rows="5" class="form-control summernote" id="content"
			placeholder="내용을 입력해주세요." required></textarea>
		</div>
	</form>	
	<button id="faq-save" class="btn btn-dark">저장</button>
</div>
<br/>
<script>
	$('.summernote').summernote({
		height: 300
	});	
</script>
<script type="text/javascript" src="/js/faq.js"></script>
<%@ include file="../layout/footer.jsp"%>