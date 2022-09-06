


let index = {
	
	


	init: function() {
	
		
		$("#btn-cart").on("click", () => {
			this.saveCart();
		})
		
		
		
		$(".productCount").change(function(){
			var proCount = $(".productCount").val();
			console.log(proCount)
			var countPrice = $("#countPrice").text();
			console.log(countPrice)
			var sumCountPrice = $("#sumCountPrice").text();
			console.log(sumCountPrice)
		})
		$(".btn-cartdel").click(function() {

			console.log($(this).attr('value'))
			var cartid = $(this).attr('value');


			let data = {
				id: cartid
			}
			$.ajax({
				type: "delete",
				url: "/auth/deleteCartProc",
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function() {
				alert('삭제되었습니다');
				location.href = "/auth/cart";
			})


		})
		
		$("#btn-clear").on("click", () => {
			this.clearCart();
		})
		
		$("#btn-order").on("click", () => {
			this.order();
		})
		

	},

	saveCart: function() {

		var productPrice = parseInt($("#productPrice").val());
		var productCount = parseInt($("#productCount").val());

		let data = {
			productName: $("#productName").val(),
			sumprice: productPrice * productCount,
			content: $("#productContent").val(),
			image: $("#productImg").val(),
			category: $("#productCategory").val(),
			price: $("#productPrice").val(),
			pet: $("#productPet").val(),
			count: productCount,
			userid: $("#proUserid").val(),
			addr1: $("#proAddr1").val(),
			addr2: $("#proAddr2").val(),
			addr3: $("#proAddr3").val(),
			addr3: $("#proAddr3").val(),
			phone: $("#proPhone").val()
		}

		console.log(data);

		$.ajax({
			type: "POST",
			url: "/auth/saveCartProc",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function() {
			if (confirm("장바구니에 담으시겠습니까?") == true) {
				alert("장바구니에 담았습니다.");
				if (confirm("장바구니로 이동하시겠습니까?") == true) {
					location.href = "/auth/cart";
				}
				else{
					return;
				}
			}
			else {
				return;
			}

		}).fail(function(){
			alert("에러");
		});

	},
	
	clearCart:function(){
		
		var userid = $("#userId").val();
		
		let data = {
			
			userid: userid
		}
		console.log(data);
		
		$.ajax({
			type: "delete",
			url: "/auth/clearCartProc",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			if (confirm("장바구니를 비우시겠습니까?") == true) {
				alert(resp.data);
				location.href = "/auth/cart";
			}else{
					return;
				}
		}).fail(function(error){
			alert("에러");
		})
		
	},
	

	order :function(){
		
		var checked = document.querySelectorAll("input[type='checkbox']:checked");
		for (var i = 0; i < checked.length; i++) {
			var cartid = checked[i].id;
			
			let data = {
				id:cartid
			}
			
			$.ajax({
			type: "post",
			url: "/auth/findBycartidProc",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
			}).done(function(resp){
				
				let data2 = {
					productName: resp.data.productName,
					price: resp.data.price,
					sumprice: resp.data.sumprice,
					category: resp.data.category,
					content: resp.data.content,
					pet: resp.data.pet,
					phone: resp.data.phone,
					addr1: resp.data.addr1,
					addr2: resp.data.addr2,
					addr3: resp.data.addr3,
					count: resp.data.count,
					image: resp.data.image,
					userid: resp.data.userid,
					state: "주문완료"
				}
				$.ajax({
					type: "post",
					url: "/auth/addOrder",
					data: JSON.stringify(data2),
					contentType: "application/json; charset=utf-8",
					dataType: "json"
				}).done(function(){
					console.log('주문이 완료되었습니다.')
				}).fail(function(){
					console.log('에러입니다.')
				});
				
				
				
				let data3={
					id:resp.data.id
				}
				
				$.ajax({
					type: "delete",
					url: "/auth/orderAndClearProc",
					data: JSON.stringify(data3),
					contentType: "application/json; charset=utf-8",
					dataType: "json"
				}).done(function(){
					location.href = "/auth/cart";
				}).fail(function(){
					console.log('에러입니다.')
				});
				
				
				
			})
		}
		
		if (confirm("선택된 항목을 주문 하시겠습니까?") == true) {
				alert('주문이 완료되었습니다.');
			}else{
					return;
				}

        
		
		
	}
	
	
	
}





function itemSum(frm) {
	var sum = 0;
	var count = frm.chkbox.length;
	if (count > 1) {
		for (var i = 0; i < count; i++) {
			if (frm.chkbox[i].checked == true) {
				sum += parseInt(frm.chkbox[i].value);
			}
		}
	} else {
		if (frm.chkbox.checked == true) {
			sum += parseInt(frm.chkbox.value);
		}
	}
	
	
	if (sum > 0) {
		$("#total_sum").text(new Intl.NumberFormat('en-US').format(sum) + "원 + 3,000원 = " + new Intl.NumberFormat('en-US').format(sum + 3000)+"원");
	}
	else {
		$("#total_sum").text("");
	}

}




 //document.frm.addEventListener("DOMContentLoaded", itemSum(frm));
index.init();