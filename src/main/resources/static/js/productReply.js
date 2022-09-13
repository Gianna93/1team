let index = {

	init: function() {
		$("#btn-writeReply").click(function() {

			if ($("#title").val() == "") {
				console.log("제목을 입력하세요")
				alert("제목을 입력하세요")
				return false;
			} else if ($("#content").val() == "") {
				console.log("후기를 입력하세요")
				alert("후기을 입력하세요")
				return false;
			}else if($("#content").val().length<20){
				console.log("후기를 20자이상 입력하세요")
				alert("후기를 20자이상 입력하세요")
				return false;
			}
			
			 else {


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
				if (confirm("후기를 작성 하시겠습니까?") == true) {
					$.ajax({
						type: "POST",
						url: "/auth/saveReplyProc",
						data: JSON.stringify(data),
						contentType: "application/json; charset=utf-8",
						dataType: "json"
					}).done(function() {

						alert("후기를 작성하였습니다")
						location.href = "/auth/myOrder";

					})
					let data2 = {
						state: "후기작성완료",
						id: orderid
					}
					$.ajax({
						type: "PUT",
						url: "/auth/ReplycompleteProc",
						data: JSON.stringify(data2),
						contentType: "application/json; charset=utf-8",
						dataType: "json"
					}).done(function() {
						console.log("후기작성완료")
					}).fail(function() {
						alert('에러입니다')
					})




				} else {
					return;
				}



				return true;
			}










		})

	}







}




index.init();