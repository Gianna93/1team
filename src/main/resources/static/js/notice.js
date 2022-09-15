let index = {

	init: function() {
		$("#btn-save").on("click", () => {
			this.saveCheck();
			if ($("#title").val() != "" && $("#content").val() != "") {
				this.save();
			}
		});
		$("#btn-delete").on("click", () => {
			this.deleteById();
		});
		$("#btn-update").on("click", () => {
			this.updateCheck();
		});
	},

	save: function() {
		let data = {
			title: $("#title").val(),
			content: $("#content").val()
		};
		if (confirm("공지사항을 등록하시겠습니까?")) {
			$.ajax({
				type: "POST",
				url: "api/notice",
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(resp) {
				alert("공지사항이 등록되었습니다.");
				location.href = "/notice/noticeList";
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		} else {
			return;
		}

	},
	
	saveCheck: function() {

		if ($("#title").val() == "") {
			alert("제목을 입력하세요.");
			return false;
		}
		if ($("#content").val() == "") {
			alert("문의사항 내용을 입력하세요.");
			return false;
		}
		return true;
	},
	
	updateCheck: function() {

		if ($("#title").val() == "") {
			alert("제목을 입력하세요.");
			return false;
		}
		else if ($("#content").val() == "") {
			alert("문의사항 내용을 입력하세요.");
			return false;
		}else{
			this.update();
			return true;
		}
		
	},
	
	deleteById: function() {
		var id = $("#num").text();
		if (confirm("공지사항을 삭제하시겠습니까?")) {
			$.ajax({
				type: "DELETE",
				url: "/api/notice/" + id,
				dataType: "json"
			}).done(function(resp) {
				alert("공지사항이 삭제되었습니다.");
				location.href = "/notice/noticeList";
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		} else {
			return;
		}
	},

	update: function() {
		let id = $("#id").val();
		let data = {
			title: $("#title").val(),
			content: $("#content").val()
		};

		if (confirm("공지사항을 수정하시겠습니까?")) {
			$.ajax({
				type: "POST",
				url: "/api/notice/" + id,
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(resp) {
				alert("공지사항이 수정되었습니다.");
				location.href = "/notice/noticeList";
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		} else {
			return;
		}
	}

}
index.init();