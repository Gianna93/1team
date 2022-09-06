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
<% String ide = (String)request.getParameter("saveid");
System.out.print(ide);
  pageContext.setAttribute("saveid2", ide);
  request.setAttribute("uid", ide);
%>
<p id="h1p">비밀번호 찾기</p>
	<div class="container">
		<form>
			<div class="form-group">
				<label for="id"><b>아이디</b></label> <br>
				<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요." value="${saveid2 }">
				
			</div>
			<br>
			<label for="qestion"><b>질문</b></label><br>
			<select name="sel" id="sel">
					<option>질문을 선택하세요</option>
					<option>어릴적 별명은?</option>
					<option>내가 다닌 초등학교는?</option>
					<option>감명깊게 읽은 책 이름은?</option>
					<option>내가 사는 아파트의 이름은?</option>
				</select><br>
				<label for="answer"><b>답변</b></label>
				<input type="text" class="form-control" placeholder="답변" id="answer"><br>
			<input type="button" value ="비밀번호 재설정하기" class="btn btn-success" id="btn-findpwd" >
			<input type="button" value ="아이디 찾기 이동" class="btn btn-success" id="findid-btn" onclick="location.href='findid'">
			<div id="find" style="display:none">
				<div id="find_pwd" >
				</div>
			</div>
			<input type="button" value ="닫기" class="btn btn-dark" id="btn-close">
		</form>
	</div>
	
	<script type="text/javascript" src="/js/customer.js"></script>
</body>
</html>