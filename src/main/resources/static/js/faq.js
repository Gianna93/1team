let index = {

	init: function() {

		$("#faq-save").on("click", () => {

			this.save();

		});

		$("#faq-delete").on("click", () => {

			this.deleteById();

		});

		$("#faq-update").on("click", () => {

			this.update();

		});

	},





	save: function() {

		//alert('user의 save함수 호출됨');

		let data = {

			title: $("#title").val(),

			content: $("#content").val()

		};

		if (confirm("자주묻는질문을 등록하시겠습니까?")) {
			$.ajax({

				type: "POST",

				url: "/faq/api/faq/",

				data: JSON.stringify(data),

				contentType: "application/json; charset=utf-8",

				dataType: "json"

			}).done(function(resp) {

				alert("질문 등록이 완료되었습니다.");

				location.replace('/faq/faqList');

			}).fail(function(error) {

				alert(JSON.stringify(error));

			});
		} else {
			return;
		}
	},

	deleteById: function() {

		let faqid = $("#faqid").val();

		let data = {

			faqid: $("#faqid").val(),

			title: $("#title").val(),

			content: $("#content").val()

		};

		console.log(faqid);


		if (confirm("해당 질문을 삭제 하시겠습니까?")) {
			$.ajax({

				type: "DELETE",

				url: "/api/faq/" + faqid,

				data: JSON.stringify(data),

				contentType: "application/json; charset=utf-8",

				dataType: "json"

			}).done(function(resp) {

				alert("삭제가 완료되었습니다.");

				location.href="/faq/faqList";

			}).fail(function(error) {

				alert(JSON.stringify(error));

			});
		} else {
			return
		}
	},

	update: function() {

		let faqid = $("#faqid").val();

		let data = {

			faqid: $("#faqid").val(),

			title: $("#title").val(),

			content: $("#content").val()

		};


		if (confirm("해당 질문을 수정 하시겠습니까?")) {
			$.ajax({

				type: "PUT",

				url: "/api/faq/" + faqid,

				data: JSON.stringify(data),

				contentType: "application/json; charset=utf-8",

				dataType: "json"

			}).done(function(resp) {

				alert("질문 수정이 완료되었습니다.");

				location.replace('/faq/faqList');

			}).fail(function(error) {

				alert(JSON.stringify(error));

			});
		} else {
			return;
		}
	},

}

index.init();
