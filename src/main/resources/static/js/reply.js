
let replyIndex = {
    init: function () {
        $("#reply-btn-save").on("click", () => {
            this.replySaveCheck();
        });
        $("#reply-btn-delete").on("click", () => {
            this.replyDelete();
        });
    },
    replySaveCheck: function(){
		var content = $("#reply-content").val();
			if (content == "") {		
			alert("내용을 입력해주세요.");	
			return false;
		}else this.replySave();
	},

    replySave: function () {
	let numm =$("#num").text();
        let data = {
            content: $("#reply-content").val(),
        	 num : $("#num").text()
        };
        console.log(data);
        $.ajax({
            type: "POST",
            url: "/api/qna/reply/"+numm,
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "text"
        }).done(function(resp){
            alert("1:1 답변 작성이 완료되었습니다.");
            location.href = "/qna/qnaList";
        }).fail(function(error) {
            alert(JSON.stringify(error));
        });
    },
    
    replyDelete: function(){
	var replyId =$("#replyId").val();
	$.ajax({
			type:"DELETE",
			url:"/api/qna/reply/"+replyId,
			dataType:"json"
		}).done(function(resp){
			alert("답변이 삭제되었습니다.");
			location.href="/qna/qnaList";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}
	


}
replyIndex.init();

		