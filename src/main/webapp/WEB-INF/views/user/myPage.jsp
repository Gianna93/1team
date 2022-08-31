<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>









<div class="d-flex align-items-start">
  <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
    <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">회원정보수정</button>
    <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">주문상품조회</button>
  </div>
  <div class="tab-content" id="v-pills-tabContent">
  
  
  
    <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab"><div>
    
	<form><br>
	<p class="mypageTitle">회원정보수정</p>
	<br><br>
		<div class="form-group">
			<label for="userid"><b>아이디</b></label><br>
			<input type="text" class="form-control" placeholder="아이디" id="userid" name="userid" value="${principal.customer.userid }" disabled>
		</div>
		<br>
		<div class="form-group">
			<label for="password"><b>비밀번호</b></label> <br>
			<input type="password" class="form-control" placeholder="비밀번호" id="password">
		</div>
		<div class="form-group">
			<label for="password"><b>비밀번호확인</b></label> <br>
			<input type="password" class="form-control" placeholder="비밀번호 확인" id="password2">
		</div>
		<br>
		<div class="form-group">
			<label for="name"><b>이름</b></label> <br>
			<input type="text" class="form-control" id="name" value="${principal.customer.name }" disabled>
		</div>
		<div class="form-group">
			<label for="phone"><b>전화번호</b></label> <br>
			<input type="text" class="form-control" id="phone" placeholder="'-' 는 생략" value="${principal.customer.phone }">
			<div id="ph-chk"></div>
			<input type="hidden" id=phnchk>
		</div>
		<br>
		<label for="email"><b>이메일</b></label> <br>
		<div class="input-group mb-3">
		
  		<input type="text" class="form-control" aria-label="email" id="email" value="${principal.customer.email1 }">
  		<span class="input-group-text">@</span>
 	 	<input type="text" class="form-control" placeholder="@dog.cat" aria-label="email2" id="email2" value="${principal.customer.email2 }">
		</div>
			<select name="sel" id="sel" onchange="change()">
				<option>선택하세요</option>
				<option>naver.com</option>
				<option>daum.net</option>
				<option>gmail.com</option>
				<option>yahoo.co.kr</option>
				<option>bing.com</option>
				<option value="" onclick="self()">직접입력</option>
		</select>
		<br><br>
		
			<div class="form-group">
			<b>주소</b><br>
			<input class="form-control" style="width: 40%; display: inline;"
				placeholder="우편번호" name="addr1" id="addr1" type="text"
				readonly="readonly" value="${principal.customer.address1 }">
			<button type="button" class="btn btn-dark"
				onclick="execPostCode();" id="find-addr">
				<i class="fa fa-search"></i>우편번호 찾기
			</button>
		</div>
		<div class="form-group">
			<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
				name="addr2" id="addr2" type="text" readonly="readonly" value="${principal.customer.address2 }" />
		</div>
		<div class="form-group">
			<input class="form-control" placeholder="상세주소" name="addr3"
				id="addr3" type="text" value="${principal.customer.address3 }" />
		</div>
		
		
	</form>
	<button id="btn-edit" class="btn btn-dark" >회원정보수정</button>
	</div></div>
    <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab"><br><p class="mypageTitle">상품주문조회</h1></div>
  </div>
</div>







<script type="text/javascript" src="/js/customer.js"></script>
<%@ include file="../layout/footer.jsp"%>