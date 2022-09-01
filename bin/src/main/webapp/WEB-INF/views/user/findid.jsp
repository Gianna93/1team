<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/findAccount.css">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>

<p id="h1p">아이디 찾기</p>
	<div class="container">
		<form action="findPassword" method="get">
			<div class="form-group">
				<label for="phone"><b>전화번호로 아이디찾기</b></label> <br>
				<input type="text" class="form-control" id="phone" placeholder="'-'없이 휴대폰 번호를 입력해주세요.">
				<input type="hidden" name="saveid" id="saveid">
			<input type="button" value ="아이디 찾기" class="btn btn-success" id="btn-findid">
			</div>
			<div id="find" style="display:none">
				<div id="find_id" >
				</div>
			</div>
			<input type="submit" value ="비밀번호 찾기 이동" class="btn btn-success" id="findpwd-btn">
			
			<input type="button" value ="닫기" class="btn btn-dark" id="btn-close">
			
		</form>
	</div>
<script type="text/javascript" src="/js/customer.js"></script>
</body>
</html>