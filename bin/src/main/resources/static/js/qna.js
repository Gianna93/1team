let index={
	init: function(){
		$("#btn-save").on("click",()=>{
			this.save();
		});
		$("#btn-delete").on("click",()=>{
			this.deleteById();
		});
		$("#btn-update").on("click",()=>{
			this.update();
		});
	},
	
	save: function(){
		let data={
			title: $("#title").val(),
			content: $("#content").val()
		};
		$.ajax({
			type: "POST",
			url:"api/qna",
			data: JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert("1:1문의사항이 등록되었습니다.");
			location.href="/qna/qnaList";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	deleteById: function(){
		var id=$("#num").text();
		$.ajax({
			type:"DELETE",
			url:"/api/qna/"+id,
			dataType:"json"
		}).done(function(resp){
			alert("문의사항이 삭제되었습니다.");
			location.href="/qna/qnaList";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	update: function(){
		let id = $("#id").val();
		let data={
			title: $("#title").val(),
			content: $("#content").val()
		};
		$.ajax({
			type: "POST",
			url:"/api/qna/"+id,
			data: JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert("문의사항이 수정되었습니다.");
			location.href="/qna/qnaList";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	
	}
	
	

}
index.init();