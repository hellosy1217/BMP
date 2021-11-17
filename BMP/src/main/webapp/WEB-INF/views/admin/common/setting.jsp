<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#body {
	display: flex;
	padding-left: 269px;
	background: #f4f4f4;
}

#container {
	width: 100%;
	display: flex;
	padding: 40px 30px 20px 30px;
}

#container_inner {
	width: 100%;
	height: 100%;
}


#container input[type="text"], #container input[type="email"], #container textarea
	{
	outline: none;
	border-radius: 6px;
	padding: 8.5px 10px 7.5px;
	outline: none;
	font-size: 15px;
	background: #fff;
	border: 1px solid #e0e0e0;
	cursor: text;
	width: 500px;
	transition: background 0.3s;
}

#container textarea {
	resize: none;
}

#container p>label {
	font-weight: 500;
	padding-bottom: 2px;
	padding-top: 10px;
	font-size: 15px;
}

#container img {
	border-radius: 50%;
	width: 80px;
	height: 80px;
}

#container .btns {
	border-radius: 4px;
	font-weight: bold;
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 6px 12px 4px;
	font-size: 15px;
	cursor: pointer;
}

#container li {
	font-size: 16px;
	padding: 5px 0;
	font-weight: 600;
	color: #6e6d7a;
}

#container li:hover {
	color: #333;
	cursor: pointer;
}

#uploadBtn {
	margin-left: 30px;
}

#uploadBtn, #saveBtn {
	color: #fff;
	background: rgb(63, 140, 185);
}

#delBtn {
	background: #ddd;
	color: #929292;
	margin-left: 20px;
}

#editProfile {
	padding-left: 40px;
}

#editProfile>div {
	padding-bottom: 10px;
}

#editProfile>div:first-child {
	display: flex;
	align-items: center;
	padding-bottom: 15px;
}

#editProfile>div:last-child {
	display: flex;
}

#checkBox {
	padding-top: 5px;
}

#checkBox>div {
	display: flex;
	align-items: center;
	padding-bottom: 10px;
}

#checkBox input {
	display: none;
}

#checkBox label {
	padding: 11px;
	background: #fff;
	border-radius: 4px;
	cursor: pointer;
	border: 1px solid #e0e0e0;
}

#checkBox p {
	margin-left: 7px;
	font-size: 15px;
	margin-top: 3px;
}

#checkBox input[type="checkbox"]:checked+label {
	padding: 3px 6.26px 0px !important;
	font-family: serif;
	color: #b9b9b9;
}

#edit {
	color: #333;
	font-weight: 700;
}

.notice {
	position: fixed;
	background: white;
	color: #333;
	border-radius: 4px;
	left: calc(50% - 60px);
	top: calc(50% - 100px);
	box-shadow: 0px 10px 70px rgb(0 0 0/ 15%);
	font-size: 10px;
	padding: 21px 20px 19px;
	display: none;
	transition: opacity 2000ms;
	opacity: 0;
}

.notice h4 {
	font-weight: 500;
	font-size: 14px;
}
</style>
</head>
<body>
	<c:import url="navigation.jsp" />
	<div id="body">
		<div id="container">
			<div id="container_inner">
			<form id="editProfile">
			<div>
				<img id="profileImg" src="${accessor.fileName }"> <label
					id="uploadBtn" class="btns" for="uploadImg">Upload</label>
				<c:if test="${accessor.fileName != '' }">
					<a id="delBtn" class="btns">Delete</a>
				</c:if>
				<input type="file" id="uploadImg" name="upload"
					style="display: none" value="${accessor.fileName }" /> <input
					type="hidden" name="fileName" id="fileName"
					value="${accessor.fileName }">
			</div>
			<div>
				<p>
					<label>Email</label>
				</p>
				<p>
					<c:choose>
						<c:when test="${fn:contains(accessor.email,'google:')}">
							<input type="email"
								value="${fn:substring(accessor.email,7,fn:length(accessor.email)) }"
								readonly="readonly">
						</c:when>
						<c:otherwise>
							<input type="email" value="${accessor.email }"
								readonly="readonly">
						</c:otherwise>
					</c:choose>
				</p>
			</div>
			<div>
				<p>
					<label>Nickname</label>
				</p>
				<p>
					<input type="text" name="nickname" value="${accessor.nickname }">
				</p>
			</div>
			<div>
				<p>
					<label>Bio</label>
				</p>
				<p>
					<textarea name="comment">${accessor.comment }</textarea>
				</p>
			</div>
			<div id="checkBox">
				<div>
					<input type="checkbox" id="sub" name="checkBox" value="sub">
					<label for="sub"></label>
					<p>구독</p>
				</div>
				<div>
					<input type="checkbox" id="alarm" name="checkBox" value="alarm">
					<label for="alarm"></label>
					<p>알림</p>
				</div>
				<div>
					<input type="checkbox" id="userPrivate" name="checkBox"
						value="userPrivate"> <label for="userPrivate"></label>
					<p>비공개</p>
				</div>
			</div>
			<div>
				<a class="btns" id="saveBtn">Save</a>
			</div>
		</form>
			</div>
		</div>
	</div>
</body>

<script>
	$(document).on('click', function(e) {
		var clicked = $(e.target).attr('id');

		switch (clicked) {
		case 'saveBtn':
			save();
			break;
		case 'delBtn':
			delImg();
			break;
		default:
			break;
		}
	});

	$('input[type=checkbox]').change(function() {
		var id = 'label[for="' + $(this).val() + '"]';
		if ($(id).text() == '')
			$(id).text('✓');
		else
			$(id).text('');
	});

	$("#uploadImg").change(function() {
		if (this.files && this.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#profileImg').attr('src', e.target.result);
				$('#fileName').val(e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});

	$(function() {
		if ('${accessor.sub}' == 'Y') {
			$('#sub').attr('checked', 'checked');
			$('label[for="sub"]').text('✓');
		}
		if ('${accessor.alarm}' == 'Y') {
			$('#alarm').attr('checked', 'checked');
			$('label[for="alarm"]').text('✓');
		}
		if ('${accessor.userPrivate}' == 'Y') {
			$('#userPrivate').attr('checked', 'checked');
			$('label[for="userPrivate"]').text('✓');
		}
	});

	function delImg() {
		$('#fileName').val('');
		$('#uploadImg').val('');
		$('#profileImg').attr('src', '');
	}

	function save() {
		var form = $('#editProfile')[0];
		var formData = new FormData(form);
		$.ajax({
			url : '/bmp/editProfile.do',
			type : 'post',
			dataType : 'json',
			processData : false,
			contentType : false,
			enctype : 'multipart/form-data',
			data : formData,
			success : function(data) {
				if (data == 'success')
					$('.notice h4').text('프로필이 수정되었습니다.');
				else
					$('.notice h4').text('error!');

				notice('reset');
			}
		});
	}

</script>
</html>