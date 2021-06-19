<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h2>Sign Up</h2>
	<form id="signUpForm">
		<div>
			<h4 id="msg"></h4>
			<div>
				<label>Email</label> <input type="email" name="email"
					id="signUp-email">
			</div>
			<div>
				<label>Nickname</label> <input type="text" name="nickname"
					id="signUp-nickname">
			</div>
			<div>
				<label> Password </label> <input type="password" name="password"
					id="signUp-password" placeholder="6+ characters">
			</div>
			<div>
				<label> Confirm Password </label> <input type="password"
					name="signUp-cPassword" id="signUp-cPassword">
			</div>
		</div>
		<div id="signUpBtn" class="btn">
			<a>가입</a>
		</div>
		<div id="google" class="btn">
			<a>Google 계정으로 가입하기</a>
		</div>
		<h6>
			이미 아이디가 있으신가요?<a>로그인하기</a>
		</h6>
		<input type="hidden" id="btnUseable">
	</form>
</body>
<script>
	$(document).on('keyup paste change', '#signUp-email', function() {
		var email = $(this).val().trim();
		if (validateEmail(email)) {
			$(this).css('background', 'white');
		} else {
			$(this).css('background', '#ffe2ed');
		}
	});

	$(document).on('keyup paste change', '#signUp-password', function() {
		var password = $(this).val().trim();
		if (password.length > 5) {
			$(this).css('background', 'white');
		} else {
			$(this).css('background', '#ffe2ed');
		}
	});

	$(document).on('keyup paste change', '#signUp-cPassword', function() {
		var password = $('#signUp-password').val().trim();
		var cpassword = $(this).val().trim();
		if (password == cpassword) {
			$(this).css('background', 'white');
		} else {
			$(this).css('background', '#ffe2ed');
		}
	});

	$('#signUpBtn a').on('click', function() {
		/* $.ajax({
			type : 'post',
			url : 'signUp.do',
			dataType : 'json',
			data : {
				email : $('#signUp-email').val(),
				password : $('#signUp-password').val(),
				nickname : $('#signUp-nickname').val()
			},
			success : function(data) {
				if (data == 'success') {
					checkForm();
				}
			}
		}); */
		checkForm();
	});

	function checkForm() {
		$('#signUpForm').css('transition', 'opacity 0.7s');
		setTimeout(function() {
			$('#signUpForm').css('opacity', '0');
		}, 100);
		setTimeout(function() {
			$('#signUpForm').css('display', 'none');
			$('#checkForm').css('display', 'flex');
		}, 420);
		setTimeout(function() {
			$('#checkForm').css('opacity', '100');
		}, 450);
	}

	function validateEmail(email) {
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (filter.test(email))
			return true;
		else
			return false;
	}
</script>
</html>