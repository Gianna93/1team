<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap')
	;
*{
	font-family: 'Gamja Flower', cursive;
}
#grand-lg-font{
	font-size: 4em;
}
#lg-font{
	font-size: 2.25em;
	
}
#md-font{
	font-size: 1.5em;
}
</style>
<div style=" margin: 0 auto; height:1400px; width: 1300px;"><br><br>
	<div class="row mb-6">
		<div class="col-md-12">
			<div class="row g-0 mb-4 h-md-250 position-relative">
				<div class=" d-lg-block" style="width: 600px;height:500px;">
					<svg class="bd-placeholder-img" style="width:500px; height:350px; margin-left:30px;">
					<image href="${product.image}" width="100%" height="100%" /></svg>
				</div>
				
				<div class="col p-4 position-static">
					<div class="card-body"><br>
						<h4 class="card-text" id="grand-lg-font"><b>제품명&nbsp;&nbsp;:&nbsp;&nbsp;${product.productName}</b></h4><br>
						<br>
						<p class="card-text" id="lg-font">가격&nbsp;&nbsp;:&nbsp;&nbsp;${product.price}	&nbsp;&nbsp;원</p>
						<br><!-- ${item.account} -->
						<div style="margin-bottom:30px; border-top: solid black 1px; width:550px;" ></div>
						<button type="#" class="btn btn-dark">구매하기</button> <!-- 구매 장바구니 링크  -->
						<button type="#" class="btn btn-success">장바구니</button>
						<button type="button" class="btn btn-outline-secondary" onclick="history.back()">제품리스트</button>
					</div>
				</div>
				<div style="border-top: solid black 1px; margin-top: 55px;">
				 <span id="lg-font">제품설명</span>
				 <br><br>
				 <p id="md-font">${product.content }</p>
				</div>
			</div>
		</div>
	</div><br><br><div style="border-top: solid black 1px;"></div>
	<span id="lg-font">결제안내</span>
	<br><br>
<h5>결제 방법은 신용카드, 실시간 계좌이체, 휴대폰 결제, 무통장입금 총 4가지의 방법으로 결제가 가능합니다.
 <br><br>
1. 신용카드
고객님의 카드번호, 유효기간 등을 승인받으 신 후 이용하실 수 있는 인터넷 안전결제(ISP), 안심클릭서비스를 이용해 결제 시 지정한 패스워드를 입력하여 편리하게 결제할 수 있습니다.
인터넷안전결제(ISP)를 이용하기 위해서는 국민카드, 비씨카드, 우리카드 홈페이지에서 인증서 등록을 하시면 됩니다.
안심클릭 해당 카드로 30만원 이상 거래시에는 반드시 공인 인증서가 필요합니다.
<br><br> 
비씨카드, 국민카드, 조흥비자, 롯데카드, 삼성카드, 신한카드, 엘지카드, 현대카드(ISP 안심클릭 해당카드)를 제외한 신용카드는 금액애 상관없이 공인 인증서 없이 결제가 가능합니다.
신용카드로 결제 시에는 세금 계산서가 별도 발행되지 않으며 카드 영수증은 세금계산서와 동일하게 사용되므로 증빙등의 용도로 사용하실 때에는 신용카드 결제 영수증으로 사용하십시오.
<br><br> 
2. 실시간 계좌이체
고객님의 거래은행의 계좌에서 지불하는 서비스로 간편하게 통장에서 바로 결제가 가능하며 별도의 수수료가 발생하지 않습니다. 현금 영수증 발행이 가능합니다.
<br><br>
3. 무통장 입금
통장없이 입금하실 수 있는 결제방법으로 주문 시 선택하신 은행의 계좌로 정확한 <span style="background-color:#ced25c;">입금자 성함과 입금하실 금액을 입금</span>해주시면 됩니다.
현금 영수증 발행이 가능합니다. 은행계좌는 홈페이지 제일 하단 오른쪽 농협 계좌가 있습니다.
<span style="background-color:#ced25c;">주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치</span>하여야 하며, 10일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.
<br><br> 
4. 휴대폰 결제
휴대폰 결제는 개인당 월한도 30만원 내에서 휴대폰으로 간편하고 편리하게 주문 가능합니다.
휴대폰 결제는 <span style="background-color:#ced25c;">부분취소는 불가능하고 당월 취소만 가능</span>하니, 취소하실 때 참고 부탁드립니다.</h5>
	
</div>
<%@ include file="../layout/footer.jsp"%>