<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../layout/header.jsp"%>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap')
	;
*{
font-family: 'Gamja Flower', cursive;
}
</style>
<div id="board_menu">
	<div id="button">
		<button type="button" class="btn btn-outline-secondary"><a style="text-decoration:none; color:black"  href="/notice/noticeList">공지사항</a></button>
		<button type="button" class="btn btn-outline-secondary"><a style="text-decoration:none; color:black" href="/faq/faqList">자주묻는질문</a></button>
		<button type="button" class="btn btn-outline-secondary"><a style="text-decoration:none; color:black" href="/qna/qnaList">1:1문의</button>
	</div>
</div>
<h1 id="titleh1">자주 묻는 질문</h1>
<br>
<div class = "container">
<table class="table table-striped" style="text-align: center">
  <thead>
    <tr style="border-bottom: 1px solid #ccc; background-color: #f1f3f5">
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var = "faq" items="${faq.content}">
			<tr style="border-bottom: 1px solid #ccc">
				<td class="notice_num">${faq.faqid}</td>
				<td id="left_align"><a style="text-decoration:none; color:black" href="/faq/${faq.faqid}">${faq.title}</a></td>
				<td class="notice_writer">${faq.customer.userid}</td>
			</tr>
	</c:forEach>
  </tbody>
</table>

	<br><br>
	
	<ul id="page" class="pagination justify-content-center">
			<c:choose>
				<c:when test="${faq.first}">
					<li class="page-item disabled"><a style="text-decoration:none; color:black" class="page-link" href="?page=${faq.number-1}">◁</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a style="text-decoration:none; color:black" class="page-link" href="?page=${faq.number-1}">◁</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${faq.last}">
					<li class="page-item disabled"><a style="text-decoration:none; color:black" class="page-link" href="?page=${faq.number+1}">▷</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a style="text-decoration:none; color:black" class="page-link" href="?page=${faq.number+1}">▷</a></li>
				</c:otherwise>
			</c:choose>		
		</ul>	
	<br><br>
 <c:if test="${principal.customer.roles=='ADMIN'}">
 		<button type="button" class="btn btn-dark"><a style="text-decoration:none; color:white" href="/faq/faqForm">글쓰기</a></button>
</c:if> 
</div>
<br><br>
<%@ include file="../layout/footer.jsp"%>