let index = {

	init: function() {
		$("#product_image").on("change", () => {
			this.theimage();
		});
		$("#btn-save").on("click", () => {
			this.saveCheck();
		});
		$("#btn-delete").on("click", () => {
			this.deleteCheck();
		});
		$('input[type="radio"][id="cat"]').on('click', function() {
			var chkValue = $('input[type=radio][id="cat"]:checked').val();
			if (chkValue) {
				$('#dog_pop').css('display', 'none');
				$('#cat_pop').css('display', 'block');
			} else {
				$('#dog_pop').css('display', 'block');
				$('#cat_pop').css('display', 'none');
			}
		});
		$('input[type="radio"][id="dog"]').on('click', function() {
			var chkValue = $('input[type=radio][id="dog"]:checked').val();
			if (chkValue) {
				$('#dog_pop').css('display', 'block');
				$('#cat_pop').css('display', 'none');
			} else {
				$('#dog_pop').css('display', 'none');
				$('#cat_pop').css('display', 'block');
			}
		});

		$("#product_name_selected").on("change", () => {
			this.findById();
		});

	
		$("#btn-update").on("click", () => {
			this.updateCheck();
			this.save2();
		});
		$("#product_number").on("keyup", () => {
			this.pronumchk();
		});




	},
	findById: function() {
		let id = $("#product_name_selected").val();
		$.ajax({
			type: "POST",
			url: "/product/updateForm/" + id,
			data: JSON.stringify(id),
			contentType: "application/json; charset=utf-8"
		}).done(function(resp) {
			$('#product_name').val(resp.data.productName);
			$('#product_price').val(resp.data.price);
			$('#product_content').val(resp.data.content);
			$('#product_category').val(resp.data.category);
			$('#product_number').val(resp.data.pronum);

			if (resp.data.pet == 'cat') {
				$("#cat").prop('checked', true);
			} else if (resp.data.pet == 'dog') {
				$("#dog").prop('checked', true);
			}

		}).fail(function(error) {
			alert(JSON.stringify(error));
		});

	},
	saveCheck: function() {
		var productName = $("#product_name").val();
		var price = $("#product_price").val();
		var content = $("#product_content").val();
		var image = $("#file-path").val();
		var category = $("#product_category").val();
		var pronum = $("#pronumchk").val();
		if (productName == "") {
			alert("상품명을 입력해주세요.");
			$("#product_name").focus();
			return false;
		}
		else if (price == "") {
			alert("가격을 입력해주세요.");
			$("#product_price").focus();
			return false;
		}
		else if (content == "") {
			alert("상품설명을 입력해주세요.");
			$("#product_content").focus();
			return false;
		}
		else if (image == "") {
			alert("이미지를 선택해주세요.");
			$("#file-path").focus();
			return false;
		}
		else if (category == "") {
			alert("카테고리를 선택해주세요.");
			$("#product_category").focus();
			return false;
		}
		else if (pronum == "") {
			alert("일련번호를 입력해주세요");
			$("#product_number").focus();
			return false;
		}
		else if (pronum == "0000") {
			alert("일련번호는 0001 이상이어야합니다");
			$("#product_number").focus();
			return false;
		}
		else if ($("#product_number").val().length != 4) {
			alert("일련번호는 4자리로 입력해주세요");
			$("#product_number").focus();
			return false;
		}
		else this.save();
	},

	updateCheck: function() {
		if ($("#product_price").val() == "") {
			alert('가격을 입력해주세요');
			$("#product_price").focus();
			return false;
		}
		if ($("#product_content").val() == "") {
			alert('상품 설명을 입력해주세요');
			$("#product_content").focus();
			return false;
		}
		if ($("#file-path").val() == "") {
			alert('이미지를 등록해주세요');
			$("#product_price").focus();
			return false;
		}
		if ($("#product_category").val() == "") {
			alert('카테고리를 등록해주세요');
			$("#product_category").focus();
			return false;
		}
		return true;
	},

	theimage: function() {

		var filename = document.getElementById("product_image").files[0].name;
		document.getElementById('file-path').value = filename;

	},

	pronumchk: function() {
		let data = {
			pronum: $("#product_number").val()
		}
		$.ajax({
			type: "POST",
			async: false,
			url: "/product/pronumCheckProc",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function(data) {
				if ($("#product_number").val().length == 4) {
					if (data == true) {
						alert('해당일련번호가 이미 존재합니다');
						$("#pronumchk").val("");

					} else {
						$("#pronumchk").val($("#product_number").val());
					}
				} else {
					$("#pronumchk").val("");
				}
			},
			error: function() {
				alert('에러입니다.');
			}
		});
	},






	save: function() {
		let data = {
			productName: $("#product_name").val(),
			price: $("#product_price").val(),
			content: $("#product_content").val(),
			image: $("#file-path").val(),
			category: $("#product_category").val(),
			pet: $('input:radio[name="select_pet"]:checked').val(),
			pronum: $("#pronumchk").val()

		};

		if (confirm("상품을 등록하시겠습니까?") == true) {
			$.ajax({
				type: "POST",
				url: "api/product",
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function() {
				alert("상품이 등록되었습니다.");
				location.href = "/product/registerForm";
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});


		}
		else {
			return;
		}

	},

	deleteCheck: function() {
		var productName = $("#product_name").val();
		if (productName == "") {
			alert("상품을 선택해주세요.");
			$("#product_name").focus();
			return false;
		}
		else this.deleteById();
	},



	deleteById: function() {
		let id = $("#product_name_selected").val();
		if (confirm("상품을 삭제하시겠습니까?")) {
			$.ajax({
				type: "DELETE",
				url: "/api/product/" + id,
				dataType: "json"
			}).done(function(resp) {
				alert("해당 상품이 삭제되었습니다.");
				location.href = "/product/updateForm";
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		} else {
			return;
		}
	},


	save2: function() {
		if ($("#product_price").val() != "" &&
			$("#product_content").val() != "" &&
			$("#file-path").val() != "" &&
			$("#product_category").val() != ""
		) {
			this.update();
		}

	},


	update: function() {
		let id = $("#product_name_selected").val();
		let data = {
			productName: $("#product_name").val(),
			price: $("#product_price").val(),
			content: $("#product_content").val(),
			image: $("#file-path").val(),
			category: $("#product_category").val(),
			pet: $('input:radio[name="select_pet"]:checked').val()
		};
		console.log(data);
		if (confirm("해당 상품의 정보를 변경하시겠습니까?") == true) {
			$.ajax({
				type: "POST",
				url: "/api/product/" + id,
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(resp) {
				alert("상품정보가 수정되었습니다.");
				location.href = "/product/updateForm";
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		} else {
			return;
		}
	}





}


index.init();