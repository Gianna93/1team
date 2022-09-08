let index = {

	init: function() {

		$(".btn-deliver").click(function() {
			
			var orderid = $(this).attr('value');
		
			let data= {
				id : orderid,
				state : "배송중"
			}
			
			$.ajax({
				type: "put",
				url: "/auth/deliverProc",
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function() {
				alert('배송중으로 변경되었습니다.');
				location.href = "/product/orderAdmin";
			}).fail(function(){
				alert('에러입니다')
			});
		
		})
		
		
		$(".btn-delcomp").click(function() {
			
			var orderid = $(this).attr('value');
		
			let data= {
				id : orderid,
				state : "배송완료"
			}
			
			$.ajax({
				type: "put",
				url: "/auth/delcompProc",
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function() {
				alert('배송완료로 변경되었습니다.');
				location.href = "/product/orderAdmin";
			}).fail(function(){
				alert('에러입니다')
			});
		
		});
	
		
		
	},
	
	writeReply:function(id){
		
		
	}
	


}

index.init();