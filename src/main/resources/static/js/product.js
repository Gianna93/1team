let index = {
	init: function() {
		$("#btn-save").on("click", () => {
			this.save();
		});
		$("#product_image").on("change",()=>{
			this.theimage();
		})
	},

	save: function() {
		let data = {
			productName: $("#product_name").val(),
			price: $("#product_price").val(),
			content: $("#product_content").val(),
			image: $("#file-path").val(),
			category: $("#product_category").val(),
			pet: $('input:radio[name="select_pet"]:checked').val()

		};

		$.ajax({
			type: "POST",
			url: "api/product",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {

			alert("상품이 등록되었습니다.");
			location.href = "/product/registerForm";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},

	theimage: function() {
		
		var filename = document.getElementById("product_image").files[0].name; 
		document.getElementById('file-path').value =filename;
		
	}

}

index.init();