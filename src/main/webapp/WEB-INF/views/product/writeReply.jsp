<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ include file="../layout/header.jsp"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%Date now = new Date();%>
<%SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
String today = sf.format(now);%>
<div class="replycontainer">
<form>
		<br>
		<h1 style="font-weight:900;">후기 작성</h1>
		<div class="form-group">
			<h5 style="font-weight: 700;">제목</h5>
			<input type="text" class="form-control" id="title" required>
		</div>
		
		<br>
		
		
		<div class="form-group">
		
		
		
		<b>일련번호 : <span id="product_number">${orders.pronum }</span></b><br><br>
		<b>상품이름 : <span id="product_name">${orders.productName}</span></b><br><br>
		<input type="hidden" value="${orders.id }" id="orderid">
		</div>
		<div class="form-group">
			<label for="content"><b>내용 </b></label>
			<textarea rows="5" class="form-control summernote" id="content"
			placeholder="내용을 입력해주세요." required></textarea>
		</div>
		<br>
		<div class="form-group">
		<b>작성자 :<span id="userid">${orders.userid}</span></b><br><br>
		<b>작성날짜 : <span id="writeDate"><%=today %></span></b><br><br>
		</div>
		
			
</form>
	<button id="btn-writeReply" class="btn btn-dark" value="${orders.id }">후기등록</button>
</div>

<script>
	$('.summernote').summernote({
		height: 400
	});	
</script>

<script type="text/javascript" src="/js/productReply.js"></script>
<%@ include file="../layout/footer.jsp"%>