<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../layout/header.jsp"%>

<div id="board_menu">
	<div id="button">
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='/notice/noticeList'" style="color: black">공지사항</button>
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='/faq/faqList'" style="color: black">자주묻는질문</button>
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='/qna/qnaList'" style="color: black">1:1문의</button>
	</div>
</div>
<h1 id="titleh1">공지사항</h1>
<br>
<div class = "container">
	<table id="tb">
	
		<tr style="border-bottom: 1px solid #ccc; background-color: #f1f3f5">
			<td class="notice_num"><b>번호</b></td>
			<td class="notice_title"><b>제목</b></td>
			<td class="notice_writer"><b>작성자</b></td>
			<td class="notice_date"><b>작성일</b></td>
			<td class="notice_count"><b>조회수</b></td>
		</tr>
	

		<c:forEach var = "notice" items="${notice.content}">
				<tr style="border-bottom: 1px solid #ccc">
					<td class="notice_num">${notice.num}</td>
					<td id="left_align"><a style="text-decoration:none; color:black" href="/notice/${notice.num}">${notice.title}</a></td>
					<td class="notice_writer">${notice.customer.userid}</td>
					<td class="notice_date">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.createDate}" /></td>
					<td class="notice_count">${notice.count}</td>
				</tr>
		</c:forEach>

	</table>
	<div class="btn-div">
	<c:if test="${principal.customer.roles=='ADMIN'}">
     <button type="button" style="background-color:black; color:white; border-radius:10px; width:120px; height : 40px;" onclick="location.href='/notice/noticeForm'">공지사항쓰기</button>
  </c:if>
  </div>
	
	<br><br>
	
	<ul id="page" class="pagination justify-content-center">
			<c:choose>
				<c:when test="${notice.first}">
					<li class="page-item disabled"><a style="text-decoration:none; color:black" class="page-link" href="?page=${notice.number-1}">◁</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a style="text-decoration:none; color:black" class="page-link" href="?page=${notice.number-1}">◁</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${notice.last}">
					<li class="page-item disabled"><a style="text-decoration:none; color:black" class="page-link" href="?page=${notice.number+1}">▷</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a style="text-decoration:none; color:black" class="page-link" href="?page=${notice.number+1}">▷</a></li>
				</c:otherwise>
			</c:choose>		
		</ul>	
	<br><br>
	<div>
	
	</div>
 
</div>
<br><br>
<%@ include file="../layout/footer.jsp"%>