let index = {
	init: function() {
		$("#btn-save").on("click", () => {
			this.save();
		});
		$("#btn-login").on("click", () => {
			this.loginCheck();
		});
	},

	save: function() {
		const radioval = document.getElementsByName('gridRadios');
		var adminchkval;
		radioval.forEach((node)=>{
			if(node.checked){
				adminchkval = node.value;
			}
		})
		let data = {
			userId: $("#userId").val(),
			password: $("#password").val(),
			name: $("#name").val(),
			email: $("#email").val() + "@" + $("#email2").val(),
			address: $("#address").val(),
			roles: adminchkval
		};

		$.ajax({
			type: "POST",
			url: "/auth/joinProc",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert("회원가입이 완료되었습니다.");
			location.href = "/auth/loginForm";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},


	loginCheck: function() {
		var id = $("#id").val();
		var password = $("#password").val();
		if (id == "") {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return false;
		}
		if(password ==""){
			alert("비밀번호를 입력해주세요.");
			$("#id").focus();
			return false;
		}
	
		return true;
	}



}

index.init();








function change() {
	let sel = document.getElementById("sel");
	let email2 = document.getElementById("email2");
	email2.value = sel.options[sel.selectedIndex].value;
}