let index = {

	init: function() {
		$("#btn-writeReply").click(function(){
			var orderid = $(this).attr('value');
		
		let data = {
			title: $("#title").val(),
			pronum: $("#product_number").text(),
			productName: $("#product_name").text(),
			content: $("#content").val(),
			userid: $("#userid").text(),
			orderid: $("#orderid").val()
		}

		console.log(data)

		$.ajax({
			type: "POST",
			url: "/auth/saveReplyProc",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function() {
			if (confirm("후기를 작성 하시겠습니까?") == true) {
				alert("후기를 작성하였습니다")
				location.href = "/auth/myOrder";
			}else{
				return;
			}
		})

		let data2={
			state:"후기작성완료",
			id: orderid
		}
		$.ajax({
			type: "PUT",
			url: "/auth/ReplycompleteProc",
			data: JSON.stringify(data2),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(){
			console.log("후기작성완료")
		}).fail(function(){
			alert('에러입니다')
		})
		
		
		})

	}
	
	
	
	
	
	
	
}




index.init();
