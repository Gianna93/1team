<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="/css/findAccount.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>

</head>
<body>
<p id="h1p">아이디/비밀번호 찾기</p>
<div id="findAccuCon">
	
	<div id="button">
		<button id="check-btn" name="find_id" class="btn btn-success btn-lg" onclick="location.href='findid'" >아이디 찾기</button><br><br>
		<button id="check-btn" name="find_password" class="btn btn-success btn-lg" onclick="location.href='findPassword'">비밀번호 찾기</button>
	</div>
	
</div>
	
 <script type="text/javascript" src="/js/customer.js"></script>
</body>
</html>