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
		<h4 id="msg"></h4>
		<div>
			<label>Email</label> <input type="email" id="signIn-email">
		</div>
		<div>
			<label> Password<a id="findPw">Forgot?</a>
			</label> <input type="password" id="signIn-password">
		</div>
		<div id="signInBtn" class="btn">
			<a>로그인</a>
		</div>
		<div id="google" class="btn">
			<a>Google 계정으로 로그인</a>
		</div>
		<h6>
			아직 회원이 아니신가요?<a href="signUp">지금 가입하기</a>
		</h6>
	</form>
	<form id="findPwForm" method="POST">
		<div>
			<h4>
				가입 시 사용한 이메일을 입력해주세요.<br>입력하신 메일로 인증메일을 보내드립니다.
			</h4>
			<div>
				<label>Email</label> <input type="email" name="email">
			</div>
			<div id="findBtn" class="btn">
				<a>이메일 전송</a>
			</div>
		</div>
	</form>
</body>
<script>
	$(document).on('click', '#findPw', function() {
		$('h2').css('opacity', '0');
		$('#signInForm').css('opacity', '0');
		setTimeout(function() {
			$('#findPwForm').css('display', 'flex');
			$('#signInForm').css('display', 'none');
			$('h2').text('Forgot Password?');
			$('h2').css('transition', 'opacity 1.4s');
		}, 420);
		setTimeout(function() {
			$('h2').css('opacity', '100');
			$('#findPwForm').css('opacity', '100');
		}, 450);
	});

	$(document).on('click', '#findBtn', function() {
		$('#findPwForm').css('transition', 'opacity 0.7s');
		setTimeout(function() {
			$('#findPwForm').css('opacity', '0');
		}, 100);
		setTimeout(function() {
			$('#findPwForm').css('display', 'none');
			$('#checkForm').css('display', 'flex');
		}, 420);
		setTimeout(function() {
			$('#checkForm').css('opacity', '100');
		}, 450);
	});

	$('#signInBtn a').on('click', function() {
		$.ajax({
			type : 'post',
			url : 'signIn.do',
			dataType : 'json',
			data : {
				email : $('#signIn-email').val(),
				password : $('#signIn-password').val()
			},
			success : function(data) {
				if (data == 'error') {
					$('#msg').text('이메일 또는 비밀번호를 확인해주세요.');
					$('#signIn-email').focus();
				} else if (data == 'admin' || data == 'explorer')
					location.href = 'explorer';
				else {
					$('#authKey').val(data);
					$('#sign-email').val($('#signIn-email').val());
					checkForm('#signInForm');
				}
			}
		});
	});
</script>
</html>