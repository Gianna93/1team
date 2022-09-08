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

<h1 id="titleh1">자주 묻는 질문</h1>
<br>
<div class="container">
<table id="tb">
    <tr style="border-bottom: 1px solid #ccc; background-color: #f1f3f5">
      <th class="notice_num">번호</th>
      <th class="notice_title">제목</th>
      <th class="notice_writer">작성자</th>
    </tr>
    <c:forEach var = "faq" items="${faq.content}">
         <tr style="border-bottom: 1px solid #ccc">
            <td class="notice_num">${faq.faqid}</td>
            <td id="left_align"><a style="text-decoration:none; color:black" href="/faq/${faq.faqid}">${faq.title}</a></td>
            <td class="notice_writer">${faq.customer.userid}</td>
         </tr>
   </c:forEach>
   
   
</table>
<div class="btn-div">
 <c:if test="${principal.customer.roles=='ADMIN'}">
       <button type="button" style="background-color:black; color:white; border-radius:10px; width:120px; height : 40px; " onclick="location.href='/faq/faqForm'">FAQ쓰기</button>
	</c:if> 
</div>
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
   
   	

</div>
<br><br>
<%@ include file="../layout/footer.jsp"%>