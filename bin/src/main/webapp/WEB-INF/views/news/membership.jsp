<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<style>
	.membcon{
	width:1500px;
	margin:0 auto;
	}

	.membcon> .imgcon{
	
	margin:0 auto;
	margin-top:50px;
	width:860px;
	}
	.membcon> .imgcon > .btn {
		width:200px;
		text-align:center;
		margin-top:30px;
		margin-left:320px;
	}
	
</style>
	<div class='membcon'>
	<br>
		<p class='subtitle'>Membership</p>
		<div class='imgcon'>
			<img src="/img/membership.jpg" id="membership">
			<button type="button" class="btn btn-dark" onclick='history.go(-1)'>메인화면으로</button>
		</div>
		
	</div>
<script type="text/javascript" src="/js/index.js"></script>
<%@ include file="../layout/footer.jsp"%>