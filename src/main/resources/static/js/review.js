
let reviewIndex = {
    init: function () {
        $("#btn-review").on("click", () => {
            this.reviewForm();
        });
      
    },
	reviewForm:function(){
		var productName = $("#order_productName").val();
		$.ajax({
			type: "GET",
			url:"/review/reviewForm/"+productName,
			data: JSON.stringify(productName), 
			contentType:"application/json; charset=utf-8"
	}).done(function(resp){
		
	}).fail(function(error){
			alert(JSON.stringify(error));
		});
}

}
reviewIndex.init();

	