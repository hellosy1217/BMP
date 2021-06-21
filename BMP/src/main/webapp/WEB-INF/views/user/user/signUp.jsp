<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h2>Sign Up</h2>
	<form id="signUpForm">
		<h4 class="msg"></h4>
		<div>
			<div>
				<label>Email</label> <input type="email" id="signUp-email"
					useable="0">
			</div>
			<div>
				<label>Nickname</label> <input type="text" id="signUp-nickname"
					useable="0">
			</div>
			<div>
				<label> Password </label> <input type="password" id="form-password"
					placeholder="6+ characters" useable="0">
			</div>
			<div>
				<label> Confirm Password </label> <input type="password"
					id="form-cPassword" useable="0">
			</div>
		</div>
		<div id="signUpBtn" class="btn pink">
			<a>가입</a>
		</div>
		<div id="google" class="btn">
			<a>Google 계정으로 가입하기</a>
		</div>
		<h6>
			이미 아이디가 있으신가요?<a href="signIn">로그인하기</a>
		</h6>
	</form>
</body>
<script>
	// 회원가입 이메일 확인
	$(document).on('keyup paste change', '#signUp-email', function() {
		email = $(this).val().trim();
		if (validateEmail(email)) {
			$.ajax({
				url : 'checkUser.do',
				data : {
					email : email
				},
				success : function(data) {
					console.log(data);
					if (data < 1) {
						$('#signUp-email').css('background', 'white');
						$('#signUp-email').attr('useable', '1');
					} else {
						$('#signUp-email').css('background', '#ffe2ed');
						$('#signUp-email').attr('useable', '0');
					}
				}
			});
		} else {
			$(this).css('background', '#ffe2ed');
			$(this).attr('useable', '0');
		}
	});

	$(document).on('keyup paste change', '#signUp-nickname', function() {
		var nickname = $(this).val().trim();
		if (nickname.length > 1) {
			$(this).css('background', 'white');
			$(this).attr('useable', '1');
		} else {
			$(this).css('background', '#ffe2ed');
			$(this).attr('useable', '0');
		}
	});

	$('#signUpBtn a').on('click', function() {
		var input = $('input');
		var result = 0;
		email = $('#signUp-email').val();
		for (var i = 0; i < 5; i++)
			if (input.eq(i).attr('useable') == '1')
				result++;
		if (result == 4) {
			$.ajax({
				type : 'post',
				url : 'signUp.do',
				dataType : 'json',
				data : {
					email : email,
					password : $('#form-password').val(),
					nickname : $('#signUp-nickname').val()
				},
				success : function(data) {
					if (data != null) {
						checkForm('#signUpForm','#checkForm');
						authKey = data;
					}
				}
			});
		}
	});

</script>
</html>