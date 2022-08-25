<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<% String adminck = request.getParameter("adminck-btn");
	pageContext.setAttribute("adminchk", adminck);
%>
<div class="container" >
	<form>
		<div >
			<label for="userId">아이디</label><br>
			<input type="text"  placeholder="Enter id" id="userId">
		</div>
		<div >
			<label for="password">비밀번호</label> <br>
			<input type="password" placeholder="Enter password" id="password">
		</div>
		<div >
			<label for="password">비밀번호확인</label> <br>
			<input type="password" placeholder="Check password" id="password2">
		</div>
		<div >
			<label for="name">이름</label> <br>
			<input type="text"	placeholder="Enter name" id="name">
		</div>
		<div >
			<label for="email">이메일</label> <br>
			<input type="text" placeholder="Enter email" id="email"> @
			<input type="text" id="email2">
			<select name="sel" id="sel" onchange="change()">
				<option>선택하세요</option>
				<option>naver.com</option>
				<option>daum.net</option>
				<option>gmail.com</option>
				<option>yahoo.co.kr</option>
				<option>bing.com</option>
			</select>
		</div>
		<div>
			<label for="address">주소</label> <br>
			<input type="text" placeholder="Enter address" id="address">
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
      <br>
		
	</form>
	<button id="btn-save" class="btn btn-dark" >회원가입</button>
	</div>
	
	 <script type="text/javascript" src="/js/customer.js"></script>
<%@ include file="../layout/footer.jsp"%>