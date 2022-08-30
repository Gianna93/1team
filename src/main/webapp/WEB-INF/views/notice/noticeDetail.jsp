<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<style>
a{
	color: rgba(255,255,255, 0.99);
	text-decoration: none;
}
a:hover{
	color :white;
}
</style>
<br>
<h1 id="titleh1">공지사항</h1>
<div class = "container">

	<div>
		<div>
			글 번호 : <span id="num"><i>${notice.num}</i></span>
			작성자 : <span id="id"><i>${notice.customer.userid}</i></span>
		</div>
		<br>
		<div>
			<h3>${notice.title}</h3>
		</div>
		<hr/>
		<div>
			<div>${notice.content}</div>
		</div>
		<hr/>
	</div>	
	<br><br>
	<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
	<c:if test="${notice.customer.userid==principal.customer.userid}">
		<button class="btn btn-success" onclick="location.href='/notice/${notice.num}/updateForm';">수정</button>
		<button id="btn-delete" class="btn btn-danger">삭제</button>
	</c:if>	
</div>
<br>	
<script type="text/javascript" src="/js/notice.js"></script>
<%@ include file="../layout/footer.jsp"%>