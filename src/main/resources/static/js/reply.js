
let replyIndex = {
    init: function () {
        $("#reply-btn-save").on("click", () => {
            this.replySave();
        });
    },

    replySave: function () {
        let data = {
            content: $("#reply-content").val(),
        	 qnaId : $("#qnaId").val()
        };
        console.log(data);
        $.ajax({
            type: "POST",
            url: "/api/qna/"+qnaId+"/reply",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function(resp){
            alert("1:1 답변 작성이 완료되었습니다.");
            location.href = "/qna/qnaList";
        }).fail(function(error) {
            alert(JSON.stringify(error));
        });
    },

}
replyIndex.init();

		