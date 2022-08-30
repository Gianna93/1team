let index={
	init: function(){
		$("#faq-save").on("click",()=>{
			this.save();
		});
		$("#faq-delete").on("click",()=>{
			this.deleteById();
		});
		$("#faq-update").on("click",()=>{
			this.update();
		});
	},

	
	save: function(){
		//alert('user의 save함수 호출됨');
		let data={
			title: $("#title").val(),
			content: $("#content").val()
		};
		$.ajax({ 
			type:"POST",
			url:"/faq/api/faq/",
			data:JSON.stringify(data), 
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("글쓰기가 완료되었습니다.");
			location.replace('/faq/faqList');
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	deleteById: function(){
		let id= $("#faqid").val();
		let data={
			faqid: $("#faqid").val(),
			title: $("#title").val(),
			content: $("#content").val()
		};
		console.log(faqid);
		
		$.ajax({ 
			type:"DELETE",
			url:"/api/faq/"+id,
			data:JSON.stringify(data), 
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("삭제가 완료되었습니다.");
			location.replace('/faq/faqList');
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},	
	update : function(){
		let faqid= $("#faqid").val();
		let data={
			faqid: $("#faqid").val(),
			title: $("#title").val(),
			content: $("#content").val()
		};

	$.ajax({
		type:"PUT",
		url:"/api/faq/"+faqid,
		data:JSON.stringify(data), 
		contentType:"application/json; charset=utf-8",
		dataType:"json" 
		}).done(function(resp){
			alert("글쓰기가 완료되었습니다.");
			location.replace('/faq/faqList');
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},	
}
index.init();

