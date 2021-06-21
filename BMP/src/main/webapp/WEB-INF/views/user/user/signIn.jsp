<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h2>Sign In</h2>
	<form id="signInForm">
		<h4 class="msg"></h4>
		<div>
			<label>Email</label> <input type="email" id="signIn-email">
		</div>
		<div>
			<label> Password<a id="findPw" href="find">Forgot?</a>
			</label> <input type="password" id="signIn-password">
		</div>
		<div id="signInBtn" class="btn pink">
			<a>로그인</a>
		</div>
		<div id="google" class="btn">
			<a>Google 계정으로 로그인</a>
		</div>
		<h6>
			아직 회원이 아니신가요?<a href="signUp">지금 가입하기</a>
		</h6>
	</form>
</body>
<script>
	$('#signInBtn a').on('click', function() {
		email = $('#signIn-email').val();
		$.ajax({
			type : 'post',
			url : 'signIn.do',
			dataType : 'json',
			data : {
				email : email,
				password : $('#signIn-password').val()
			},
			success : function(data) {
				if (data == 'error') {
					$('.msg').text('이메일 또는 비밀번호를 확인해주세요.');
					$('#signIn-email').focus();
				} else if (data == 'explorer')
					location.href = 'explorer';
				else {
					authKey = data;
					checkForm('#signInForm','#checkForm');
				}
			}
		});
	});
</script>
</html>