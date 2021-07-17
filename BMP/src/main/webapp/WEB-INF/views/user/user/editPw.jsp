<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog My Pet</title>
<style>
.setting {
	display: flex;
	padding: 30px 0;
	justify-content: center;
}

.setting input[type="text"], .setting input[type="email"], .setting input[type="password"],
	.setting textarea {
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

.setting textarea {
	resize: none;
}

.setting .btns {
	border-radius: 4px;
	font-weight: bold;
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 6px 12px 4px;
	font-size: 15px;
	cursor: pointer;
	background: #ea4c89;
	color: #fff;
}

.setting li {
	font-size: 16px;
	padding: 5px 0;
	font-weight: 600;
	color: #6e6d7a;
}

.setting li:hover {
	color: #333;
	cursor: pointer;
}

#editPw {
	padding-left: 50px;
}

#editPw>div {
	padding-bottom: 10px;
}

#editPw>div:last-child {
	display: flex;
	margin-top: 10px;
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
	<c:import url="../common/header.jsp" />
	<div class="setting">
		<div class="notice">
			<h4></h4>
		</div>
		<ol>
			<li id="editProfile">Profile</li>
			<li id="edit">Password</li>
		</ol>
		<div id="editPw">
			<div>
				<p>
					<label>Password</label>
				</p>
				<p>
					<input type="password" id="password">
				</p>
			</div>
			<div>
				<p>
					<label>New Password</label>
				</p>
				<p>
					<input type="password" id="newPassword">
				</p>
			</div>
			<div>
				<p>
					<label>Confirm New Password</label>
				</p>
				<p>
					<input type="password" id="cnPassword">
				</p>
			</div>
			<div>
				<a class="btns" id="saveBtn">Save</a>
			</div>
		</div>
	</div>
</body>
<script>
	var p = '';
	var np = '';
	var cp = '';

	$('#editProfile').on('click', function() {
		location.href = 'profile';
	});

	$('#saveBtn').on('click', function() {
		if (p == '')
			$('#password').focus();
		else if (np == '')
			$('#newPassword').focus();
		else if (cp == '')
			$('#cnPassword').focus();
		else {
			$.ajax({
				url : 'editPw.do',
				type : 'post',
				dataType : 'json',
				data : {
					pw : p,
					newPw : np
				},
				success : function(data) {
					if (data == 'success')
						$('.notice h4').text('비밀번호가 수정되었습니다.');
					else if (data == 'checkPw') {
						$('.notice h4').text('비밀번호를 확인해주세요.');
						$('#password').focus();
					} else {
						$('.notice h4').text('error!');
					}
					notice();
				}
			});
		}
	});

	$(document).on('keyup paste change', '#password', function() {
		var password = $(this).val().trim();
		if (password.length > 3) {
			$(this).css('background', 'white');
			p = password;
		} else {
			$(this).css('background', '#ffe2ed');
			p = '';
		}
	});

	$(document).on('keyup paste change', '#newPassword', function() {
		var password = $(this).val().trim();
		if (password.length > 5) {
			$(this).css('background', 'white');
			np = password;
		} else {
			$(this).css('background', '#ffe2ed');
			np = '';
		}
	});

	$(document).on('keyup paste change', '#cnPassword', function() {
		var password = $('#newPassword').val().trim();
		var cpassword = $(this).val().trim();
		if (password == cpassword) {
			$(this).css('background', 'white');
			cp = cpassword;
		} else {
			$(this).css('background', '#ffe2ed');
			cp = '';
		}
	});

	function notice() {
		setTimeout(function() {
			$('.notice').css({
				'display' : 'flex',
				'opacity' : '100'
			});
		}, 100);
		setTimeout(function() {
			$('.notice').css({
				'opacity' : '0'
			});
		}, 1000);
		setTimeout(function() {
			$('.notice').css({
				'display' : 'none'
			});
		}, 2000);
	}
</script>
</html>