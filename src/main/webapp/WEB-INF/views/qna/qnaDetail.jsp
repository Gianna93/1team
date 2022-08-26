<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<head>
<style>
.container {
	margin-top: 50px;
	width: 1000px;
	height: 400px;
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
<h1>1:1문의</h1>
<div class = "container">
		<div>
			글 번호 : <span id="num"><i>${qna.num}</i></span>
			작성자 : <span id="id"><i>${qna.customer.userId}</i></span>
		</div>
		<br>
		<div>
			<h3>${qna.title}</h3>
		</div>
		<hr/>
		<div>
			<div>${qna.content}</div>
		</div>
		<hr/>
		
	<br><br>
	<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
	<c:if test="${qna.customer.userId==principal.customer.userId}">
		<button class="btn btn-warning">
		<a href="/qna/${qna.num}/updateForm">수정</a></button>
		<button id="btn-delete" class="btn btn-danger">삭제</button>
	</c:if>	
</div>


<h1>🐾 1:1문의 답변</h1>
<div class="container">
${reply.content}
</div>


<c:if test="${principal.customer.roles=='ADMIN'}">
 <div class="container">
	<h1>답변 작성</h1>
	<form>
		<div class="form-group">
			<label for="content">Content</label>
			<input type="hidden" id="num" value="${qna.num}"/>
			<textarea rows="5" class="form-control summernote" id="reply-content"
			placeholder="내용을 입력해주세요." required></textarea>
		</div>
	</form>	
	<button  id="reply-btn-save" class="btn btn-primary">저장</button>
 </div>
 </c:if>
 
 
<br/>  
<script>
	$('.summernote').summernote({
		height: 300
	});	
</script>

<br>	
<script type="text/javascript" src="/js/reply.js"></script>
<%@ include file="../layout/footer.jsp"%>