<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%! int a= 0; %>

<div class="d-flex align-items-start">
  <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
    <button class="nav-link " id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true" onclick="location.href='/auth/myPage'">회원정보수정</button>
    <button class="nav-link active" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false" onclick="location.href='/auth/myOrder'">주문상품조회</button>
  </div>
  <div class="tab-content" id="v-pills-tabContent">
    <div class="tab-pane fade show active" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
    <br><p class="mypageTitle">상품주문조회</p>
    <div class="ordercontainer">
		<form name="form" id="form" >
		<table class="carttb">
			<tr id="firsttr" >
				<th></th>
				<th></th>
				<th>상품명</th>
				<th>상품설명</th>
				<th>개수</th>
				<th>개별금액 / 합산급액</th>
				<th>주문상태</th>
				<th></th>
			</tr>
			
			<% a=0; %>
			<c:forEach var = "order" items="${orders.content}">
			<c:if test="${order.userid eq principal.customer.userid }">
			<% a=1; %>
			</c:if>
			</c:forEach>
			<c:if test="<%= a==0 %>">
				<tr>
					<td colspan="7"><b>주문한 내역이 없습니다.</b></td>
				</tr>
			</c:if>
				<c:forEach var = "order" items="${orders.content}">
						<% int b=0; b++; %>
						
							<c:if test="${order.userid eq principal.customer.userid }">
								
								<tr>
									<td style="width: 80px;">
									<fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:ss" />
									
									</td>
									<td>
									<img src="${order.image}">
									</td>
									<td>
									<b>${order.productName }</b>
									<input type="hidden" id="order_productName" value="${order.productName}">
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
									<td style="width: 150px;">
									
									<c:choose>
										<c:when test="${order.state eq '배송완료'}"><b>${order.state }</b> <br>
										<button id="btn-review" type="button" class="btn btn-outline-dark" value="${order.id }" style="width: 80px; font-size:13px; height:30px; margin-top:5px; line-height: 15px;">
										후기작성</button>
										</c:when>
										<c:otherwise><b>${order.state }</b></c:otherwise>
									</c:choose>
									
									
									</td>
									
								</tr>
							</c:if>
							
					
					
				</c:forEach>
			
			<tr>
			<td></td>
			<td><b>예상 배송일</b></td>
			<td colspan="3">
			<b>배송까지는 평균 2~3일 소요됩니다.</b><br>
					
					

			</td>
			</tr>
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
    </div>
  </div>
</div>






<script type="text/javascript" src="/js/review.js"></script>
<script type="text/javascript" src="/js/customer.js"></script>
<%@ include file="../layout/footer.jsp"%>