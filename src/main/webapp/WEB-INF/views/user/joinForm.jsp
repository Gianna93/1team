<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ include file="../layout/header.jsp"%>
<% String adminck = request.getParameter("adminck-btn");
	pageContext.setAttribute("adminchk", adminck);
%>
<div class="joincontainer" >
	<br><br>
	<form>
		<div class="form-group">
			<label for="userid"><b>아이디</b></label><br>
			<input type="text" class="form-control" placeholder="아이디" id="userid" name="userid">
			<input type="hidden" id="reid" >
			<input type="button" value="중복체크" class="btn btn-dark" id="btn-check">
			<div id="id_check"></div>
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
			<input type="text" class="form-control" id="name">
		</div>
		<div class="form-group">
			<label for="phone"><b>전화번호</b></label> <br>
			<input type="text" class="form-control" id="phone" placeholder="'-' 는 생략">
			<div id="ph-chk"></div>
			<input type="hidden" id=phnchk>
		</div>
		<br>
		<label for="email"><b>이메일</b></label> <br>
		<div class="row">
			<div class="col-lg-6">
				
				<input type="text" class="form-control"  id="email">
			</div>
		
			<div class="col-lg-6" id="email2div">
				<input type="text" class="form-control" placeholder="@dog.cat" id="email2">
			</div>
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
				readonly="readonly">
			<button type="button" class="btn btn-dark"
				onclick="execPostCode();" id="find-addr">
				<i class="fa fa-search"></i>우편번호 찾기
			</button>
		</div>
		<div class="form-group">
			<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
				name="addr2" id="addr2" type="text" readonly="readonly" />
		</div>
		<div class="form-group">
			<input class="form-control" placeholder="상세주소" name="addr3"
				id="addr3" type="text" />
		</div>

 
      <br>
		
	<div class="form-group">
			<label for="qestion"><b>질문</b></label><br>
				<select name="sel2" id="sel2">
					<option>아이디 찾기에 필요한 질문</option>
					<option>어릴적 별명은?</option>
					<option>내가 다닌 초등학교는?</option>
					<option>감명깊게 읽은 책 이름은?</option>
					<option>내가 사는 아파트의 이름은?</option>
				</select><br><br>
				<label for="answer"><b>답변</b></label>
				<input type="text" class="form-control" placeholder="답변" id="answer">
			<div id="id_check"></div>
		</div>	
		
		<br>
		<c:choose>
		<c:when test="${adminchk eq 'CUSTOMER'}">
		<div class="form-check disabled">
        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="CUSTOMER" disabled checked>
        <label class="form-check-label" for="gridRadios3">
          소비자
        </label>
      </div>

      <div class="form-check disabled">
        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios4" value="ADMIN" disabled>
        <label class="form-check-label" for="gridRadios3">
          관리자
        </label>
      </div>
 	 </c:when>

	<c:otherwise>
	
			<div class="form-check disabled">
        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios5" value="CUSTOMER" disabled >
        <label class="form-check-label" for="gridRadios3">
          소비자
        </label>
      </div>

      <div class="form-check disabled">
        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios6" value="ADMIN" disabled checked>
        <label class="form-check-label" for="gridRadios3">
          관리자
        </label>
      </div>
	
	</c:otherwise>
	</c:choose>
		
	</form>
	<br><br>
	<button id="btn-save" class="btn btn-dark" >회원가입</button>
	</div>
	
	 <script type="text/javascript" src="/js/customer.js"></script>
<%@ include file="../layout/footer.jsp"%>