<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<head>
<style>
.container{
	margin-top: 50px;
	width: 1000px;
	height: 1200px;
	margin: 0 auto;
}
.container_qna {
	margin-top: 50px;
	width: 1000px;
	height: 300px;
	margin: 0 auto;
}
.container_reply{
	margin-top: 50px;
	width: 1000px;
	height: 300px;
	margin: 0 auto;
}
.container_write{
	margin-bottom: 50px;
	width: 1000px;
	height: 400px;
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
<div class="container">
<div class = "container_qna">
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



<c:if test="${not empty qna.reply}">
	<h1>🐾 1:1문의 답변</h1>
	<div class="container_reply">
   	<c:forEach items="${qna.reply}" var="reply">
   		<div>
			작성자 : <span id="id"><i>ADMIN</i></span>
			<input type="hidden" id="replyId" value="${reply.id}">
		</div>
		<br>
		<div>
			<div>${reply.content}</div>
		</div>
		<hr/>
		<br><br>
		<c:if test="${principal.customer.roles=='ADMIN'}">
			<button id="reply-btn-delete" class="btn btn-danger">삭제</button>
	</c:if>	     
   	</c:forEach>
	</div>
</c:if>



<c:if test="${empty qna.reply}">
<c:if test="${principal.customer.roles=='ADMIN'}">
 <div class="container_write">
	<h1>답변 작성</h1>
	<form>
		<div class="form-group">
			<label for="content">Content</label>
			<input type="hidden" id="num" value="${qna.num}">
			<textarea rows="5" class="form-control summernote" id="reply-content"
			placeholder="내용을 입력해주세요." required></textarea>
		</div>
	</form>	
	<button  id="reply-btn-save" class="btn btn-primary">저장</button>
 </div>
 </c:if>
 </c:if>
 </div>
 
 
<br/>  
<script>
	$('.summernote').summernote({
		height: 300
	});	
</script>

<br>	
<script type="text/javascript" src="/js/reply.js"></script>
<script type="text/javascript" src="/js/qna.js"></script>
<%@ include file="../layout/footer.jsp"%>