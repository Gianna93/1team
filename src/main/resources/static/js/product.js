let index={
	init: function(){
			$("#btn-save").on("click",()=>{
			this.save();
		});	
	},
	
	save:function(){
		let data={
			productName: $("product_name").val(),
			price: $("#product_price").val(),
			content:$("#product_content").val(),
		//	imageId:$("#product_image").val(),
			category:$("#product_category").val(),
			pet:$("#product_pet").val(),
		};
		$.ajax({
			type: "POST",
			url:"api/product",
			data: JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert("상품이 등록되었습니다.");
			location.href="/product/foodProduct";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}
}
index.init();