<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/findAccount.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<% 
  String uid = (String)request.getParameter("userid");
  System.out.print(uid);
  pageContext.setAttribute("saveid2", uid);
%>

<p id="h1p">비밀번호 변경</p>
<div class="container">
<form>
	<div class="form-group">
			<label for="userid"><b>아이디(수정불가)</b></label> <br>
			<input type="text" class="form-control" id="userid" value="${saveid2 }" readonly>
		</div>
	<div class="form-group">
			<label for="password"><b>비밀번호</b></label> <br>
			<input type="password" class="form-control" placeholder="비밀번호" id="password">
		</div>
		
		<div class="form-group">
			<label for="password"><b>비밀번호확인</b></label> <br>
			<input type="password" class="form-control" placeholder="비밀번호 확인" id="password2">
		</div>
		</form>
		<br>
		<button id="btn-change" class="btn btn-success" >비밀번호 변경</button>
		<input type="button" value ="뒤로가기" class="btn btn-dark" id="btn-back" onclick="history.go(-1)">
		<input type="button" value ="닫기" class="btn btn-dark" id="btn-close">
		</div>
		
		
		<script type="text/javascript" src="/js/customer.js"></script>
</body>
</html>