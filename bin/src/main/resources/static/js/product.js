let index={
	
	init: function(){
			$("#product_image").on("change",()=>{
         	this.theimage();
      });
			$("#btn-save").on("click",()=>{
			this.saveCheck();
		});
			$('input[type="radio"][id="cat"]').on('click', function(){
  			var chkValue = $('input[type=radio][id="cat"]:checked').val();
  			if(chkValue){
             $('#dog_pop').css('display','none');
             $('#cat_pop').css('display','block');
 			 }else{
              $('#dog_pop').css('display','block');
              $('#cat_pop').css('display','none');
  			}
		});
		$('input[type="radio"][id="dog"]').on('click', function(){
  			var chkValue = $('input[type=radio][id="dog"]:checked').val();
  			if(chkValue){
             $('#dog_pop').css('display','block');
             $('#cat_pop').css('display','none');
 			 }else{
              $('#dog_pop').css('display','none');
              $('#cat_pop').css('display','block');
  			}
		});
		
		$("#product_name_selected").on("change",()=>{
			this.findById();
		});
		
		$("#btn-delete").on("click",()=>{
			this.deleteById();
		});
		$("#btn-update").on("click",()=>{
			this.update();
		});
		
	},
	findById: function(){
		let id = $("#product_name_selected").val();
		$.ajax({
			type: "POST",
			url:"/product/updateForm/"+id,
			data: JSON.stringify(id), 
			contentType:"application/json; charset=utf-8"
		}).done(function(resp){
			$('#product_name').val(resp.data.productName);
			$('#product_price').val(resp.data.price);
			$('#product_price').val(resp.data.price);
			$('#product_content').val(resp.data.content);
			$('#product_category').val(resp.data.category);
			
			if(resp.data.pet=='cat'){
				$("#cat").prop('checked', true); 
			}else if(resp.data.pet=='dog'){
				$("#dog").prop('checked', true); 
			}
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	
	},
	saveCheck: function(){
		var productName = $("#product_name").val();
        var price = $("#product_price").val();
        var content = $("#product_content").val();
        var image = $("#file-path").val();
        var category = $("#product_category").val();
        var pet = $('input:radio[name="select_pet"]:checked').val();
		if (productName==""){
			alert("상품명을 입력해주세요.");
			$("#product_name").focus();
			return false;
		}
		else if (price==""){
			alert("가격을 입력해주세요.");
			$("#product_price").focus();
			return false;
		}
		else if (content==""){
			alert("상품설명을 입력해주세요.");
			$("#product_content").focus();
			return false;
		}
		else if (image==""){
			alert("이미지를 선택해주세요.");
			$("#file-path").focus();
			return false;
		}
		else if (category==""){
			alert("카테고리를 선택해주세요.");
			$("#product_category").focus();
			return false;
		}
		else this.save();
	},
	
	theimage: function() {
      
      var filename = document.getElementById("product_image").files[0].name; 
      document.getElementById('file-path').value =filename;
      
   },
	save:function(){
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
			url:"api/product",
			data: JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert("상품이 등록되었습니다.");
			location.href="/product/registerForm";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	deleteById: function(){
		let id = $("#product_name_selected").val();
		$.ajax({
			type:"DELETE",
			url:"/api/product/"+id,
			dataType:"json"
		}).done(function(resp){
			alert("해당 상품이 삭제되었습니다.");
			location.href="/product/updateForm";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	update: function(){
		let id = $("#product_name_selected").val();
		let data={
		 productName: $("#product_name").val(),
         price: $("#product_price").val(),
         content: $("#product_content").val(),
         image: $("#file-path").val(),
         category: $("#product_category").val(),
         pet: $('input:radio[name="select_pet"]:checked').val()
		};
		console.log(data);
		$.ajax({
			type: "POST",
			url:"/api/product/"+id,
			data: JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert("상품정보가 수정되었습니다.");
			location.href="/product/updateForm";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	
	}
}
index.init();