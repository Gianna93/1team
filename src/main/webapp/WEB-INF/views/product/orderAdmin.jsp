<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ include file="../layout/header.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="d-flex align-items-start">
  <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
    <button class="nav-link " id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" onclick="location.href='/product/registerForm'" >상품등록</button>
    <button class="nav-link" id="v-pills-update-tab" data-bs-toggle="pill" data-bs-target="#v-pills-update" type="button" role="tab" aria-controls="v-pills-update" onclick="location.href='/product/updateForm'" >상품수정/삭제</button>
	<button class="nav-link active" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" onclick="location.href='/product/orderAdmin'">고객주문내역</button>
  </div>
  <div class="tab-content" id="v-pills-tabContent">
  
  
  
    <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab"><div>
	<div class="ordercontainer">
		<form name="form" id="form" >
			<br>
			<p class="myPageTitle" style="margin-left:300px">고객주문내역조회</p>
			<br> <br>
			<table class="carttb">
			<tr id="firsttr" >
				<th></th>
				<th></th>
				<th>상품명</th>
				<th>상품설명</th>
				<th>개수</th>
				<th>개별금액 / 합산급액</th>
				<th>주문자</th>
				<th>주문상태</th>
				<th>상태변경</th>
				<th></th>
			</tr>
			
				<c:forEach var = "order" items="${orders.content}">
						
								
								<tr>
									<td style="width: 80px;">
									<fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:ss" />
									
									</td>
									<td>
									<img src="${order.image}">
									</td>
									<td>
									<b>${order.productName }</b>
									</td>
									<td>
									
									<c:if test="${order.pet eq 'dog'}">${order.content }/<b>강아지용</b></c:if>
									<c:if test="${order.pet eq 'cat'}">${order.content }/<b>고양이용</b></c:if>
									
									</td>
									<td style="width: 50px;">
										<b>${order.count }개</b>
									</td>
									<td class='pritd' style="width: 150px;">
									<span id="countPrice"><fmt:formatNumber value="${order.price}" pattern="#,###" /></span>원
									 / <span id="sumCountPrice"><fmt:formatNumber value="${order.sumprice }" pattern="#,###" /></span>원
									
									</td>
									<td>${order.userid }</td>
									<td style="width: 100px;"><b>${order.state}</b></td>
									<td style="width: 150px;">
									<div class="btn-group btn-group-sm" role="group" aria-label="...">
										<button type="button" class="btn btn-outline-dark btn-deliver" value="${order.id }" >배송중</button>
										<button type="button" class="btn btn-outline-dark btn-delcomp" value="${order.id }">배송완료</button>
										
									</div>
									</td>
									
									
								</tr>
							
					
					
				</c:forEach>
			<tr>
			<td colspan="7">
			<ul id="food_page" class="pagination justify-content-center">
			<c:choose>
				<c:when test="${product.first}">
					<li class="page-item disabled"><a style="text-decoration:none; color:black" class="page-link" href="?page=${product.number-1}">◁</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a style="text-decoration:none; color:black" class="page-link" href="?page=${product.number-1}">◁</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${product.last}">
					<li class="page-item disabled"><a style="text-decoration:none; color:black" class="page-link" href="?page=${product.number+1}">▷</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a style="text-decoration:none; color:black" class="page-link" href="?page=${product.number+1}">▷</a></li>
				</c:otherwise>
			</c:choose>		
		</ul>
			
			</td>
			</tr>
	
		</table>
		</form>
		</div>
	</div></div>
	
	
   
	
  </div>
</div>







<script type="text/javascript" src="/js/order.js"></script>
<%@ include file="../layout/footer.jsp"%>