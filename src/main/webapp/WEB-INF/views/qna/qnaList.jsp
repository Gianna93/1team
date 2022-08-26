<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../layout/header.jsp"%>

<div id="board_menu">
	<div id="button">
		<button class="menu" type="button" id="notice"><a style="text-decoration:none; color:black"  href="/notice/noticeList">공지사항</a></button>
		<button class="menu"type="button" id="fnq"><a style="text-decoration:none; color:black" href="#">자주묻는질문</a></button>
		<button class="menu"type="button" id="qna"><a style="text-decoration:none; color:black" href="/qna/qnaList">1:1문의</a></button>
	</div>
</div>
<h1>1:1문의</h1>
<br>
<div class = "container">
	<table>
	
		<tr style="border-bottom: 1px solid #ccc; background-color: #f1f3f5">
			<td class="qna_num"><b>번호</b></td>
			<td class="qna_title"><b>제목</b></td>
			<td class="qna_writer"><b>작성자</b></td>
			<td class="qna_date"><b>작성일</b></td>
		</tr>
	

		<c:forEach var = "qna" items="${qna.content}">
				<tr style="border-bottom: 1px solid #ccc">
					<td class="qna_num">${qna.num}</td>
					<c:choose>
						<c:when test="${qna.customer.userId==principal.customer.userId}">
							<td id="left_align">
							<a id="a_detail" style="text-decoration:none; color:black" href="/qna/${qna.num}">
							🔒 ${qna.title}</a>
								<c:if test="${not empty qna.reply}">&nbsp&nbsp&nbsp<i style="color:#ccc">답변완료</i></c:if>
							</td>
						</c:when>
						<c:when test="${principal.customer.roles=='ADMIN'}">
							<td id="left_align"><a id="a_detail" style="text-decoration:none; color:black" href="/qna/${qna.num}">🔒 ${qna.title}</a>
							<c:if test="${not empty qna.reply}">&nbsp&nbsp&nbsp<i style="color:#ccc">답변완료</i></c:if>
							</td>
						</c:when>
						<c:otherwise>
							<td id="left_align">🔒 ${qna.title}
							<c:if test="${not empty qna.reply}">&nbsp&nbsp&nbsp<i style="color:#ccc">답변완료</i>
							</c:if></td>
						</c:otherwise>
					</c:choose>	
					<td class="qna_writer">${qna.customer.userId}</td>
					<td class="qna_date">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${qna.createDate}" /></td>
				</tr>
		</c:forEach>

	</table>
	
	
	<br><br>
	
	<ul id="page" class="pagination justify-content-center">
			<c:choose>
				<c:when test="${qna.first}">
					<li class="page-item disabled"><a style="text-decoration:none; color:black" class="page-link" href="?page=${qna.number-1}">◁</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a style="text-decoration:none; color:black" class="page-link" href="?page=${qna.number-1}">◁</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${qna.last}">
					<li class="page-item disabled"><a style="text-decoration:none; color:black" class="page-link" href="?page=${qna.number+1}">▷</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a style="text-decoration:none; color:black" class="page-link" href="?page=${qna.number+1}">▷</a></li>
				</c:otherwise>
			</c:choose>		
		</ul>	
	<br><br>
		<button class="menu" id="btn-write"><a style="text-decoration:none; color:black" href="/qna/qnaForm">글쓰기</a></button>
</div>
<br><br>
<script type="text/javascript" src="/js/qna.js"></script>
<%@ include file="../layout/footer.jsp"%>