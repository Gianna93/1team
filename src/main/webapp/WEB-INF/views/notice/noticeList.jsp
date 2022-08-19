<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ include file="../layout/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body>
<h1>공지사항</h1>
<div class = "container">
	<table>
		<tr>
			<td class="notice_num">번호</td>
			<td class="notice_title">제목</td>
			<td class="notice_writer">작성자</td>
			<td class="notice_date">작성일</td>
			<td class="notice_count">조회수</td>
		</tr>
		<c:forEach var = "notice" items="${notice.content}">
			<tr>
				<td class="notice_num">${notice.num}</td>
				<td class="notice_title"><a href="#">${notice.title}</a></td>
				<td class="notice_writer">${notice.customerId}</td>
				<td class="notice_date">${notice.createDate}</td>
				<td class="notice_count">${notice.count}</td>
			</tr>
		</c:forEach>
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${notice.first}">
					<li class="page-item disabled"><a href="page-link" href="?page=${notice.number-1}">◁</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a href="page-link" href="?page=${notice.number-1}">◁</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${notice.last}">
					<li class="page-item disabled"><a href="page-link" href="?page=${notice.number+1}">▷</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a href="page-link" href="?page=${notice.number+1}">▷</a></li>
				</c:otherwise>
			</c:choose>		
		</ul>	
		
	</table>
	<c:if test="${notice.customer.customerId==principal.customer.roles}">
		<button><a href="noticeForm">글쓰기</a></button>
	</c:if>
</div>
<%@ include file="../layout/footer.jsp"%>