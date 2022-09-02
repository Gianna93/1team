


let index = {

	init: function() {


		$("#btn-cart").on("click", () => {
			this.saveCart();
		})
		
		$("#productCount").on("change",()=>{
			this.countChange();
		})
		$("#btn-cartdel").on("click",()=>{
			this.deleteByid();
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
			if (confirm("장바구니에 담으시겠습니까? ?") == true) {
				alert("장바구니에 담았습니다.");
				location.href = "/auth/cart";
			}
			else {
				return;
			}

		})

	},
	
	countChange: function(){
		var proCount = $("#productCount").val();
		console.log(proCount)
		var countPrice = $("#countPrice").text();
		console.log(countPrice)
		var sumCountPrice = $("#sumCountPrice").text();
		console.log(sumCountPrice)
		
	},
	
	deleteByid: function(){
		var cartid= $("#cartId").val();
		
		let data={
			id: cartid
		}
		$.ajax({
			type:"delete",
			url:"/auth/deleteCartProc",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(){
			alert('삭제되었습니다');
			location.href="/auth/cart";
		})
		
	}
	
	
	
}



function itemSum(frm){
		var sum =0 ;
		var count = frm.chkbox.length;
		for(var i=0; i<count; i++){
			if(frm.chkbox[i].checked== true){
				sum+= parseInt(frm.chkbox[i].value);
			}
		}
		if(sum>0){
		$("#total_sum").text(sum+" + 3000 = " + Number(sum+3000));
		}
		else{
			$("#total_sum").text("");
		}
	}




 //document.frm.addEventListener("DOMContentLoaded", itemSum(frm));
index.init();