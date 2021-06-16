<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog My Pet</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
	border: 0;
	background: transparent;
	color: white;
	font-family: "Haas Grot Text R Web", "Helvetica Neue", Helvetica, Arial,
		sans-serif;
	cursor: default;
}

input {
	cursor: text;
}

body {
	background: rgba(47, 47, 47, 0.98);
}

html, body {
	width: 100%;
	height: 100%;
}

h1 {
	font-weight: 800;
	font-size: 40px;
	transition: opacity 0.2s;
}

h1:hover {
	cursor: pointer;
	opacity: 0.7;
}

h2 {
	color: #999;
	transition: opacity 0.7s;
}

h4 {
	text-align: center;
	font-weight: 400;
	color: #999;
	font-size: 14px;
	padding-bottom: 20px;
}

h6 {
	color: #999;
	font-size: 13px;
	padding-top: 20px;
	font-weight: 400;
	text-align: center;
}

h6 a {
	margin-left: 7px;
	font-size: 12px;
	text-decoration: underline;
	color: #999;
	font-weight: 400;
}

h6 a:hover {
	cursor: pointer;
	color: #aaa;
}

#signIn {
	display: flex;
	justify-content: center;
	flex-direction: column;
	align-items: center;
	min-width: 800px;
	width: 100%;
	height: calc(100% - 60px);
	padding: 30px 0;
}

form {
	padding-top: 20px;
	width: 30%;
	height: calc(320px - 3%);
}

form div {
	display: flex;
	flex-direction: column;
	width: 100%;
}

#signInForm {
	transition: opacity 0.7s;
}

#signInForm>div:first-child {
	padding-bottom: 15px;
}

label {
	font-weight: 500;
	padding-bottom: 2px;
	color: rgba(255, 255, 255, 0.8);
}

label>a {
	margin-left: 7px;
	font-size: 14px;
	text-decoration: underline;
	color: #999;
	font-weight: 400;
}

label>a:hover {
	cursor: pointer;
	color: #aaa;
}

input {
	border-radius: 6px;
	padding: 8px 10px;
	color: #444;
	outline: none;
	font-size: 18px;
	background: white;
}

.btn {
	padding-top: 20px;
}

.btn a {
	text-align: center;
	border-radius: 4px;
	padding: 11px 12px 9px;
	color: #fff;
	cursor: pointer;
	text-shadow: 1px 1px 1px rgb(0 0 0/ 15%);
}

#signInBtn>a, #findBtn>a, #checkBtn>a {
	background: #ea4c88;
}

#signInBtn>a:hover, #findBtn>a:hover, #checkBtn>a:hover {
	background-color: #df3e7b;
}

#google>a {
	background: #4285f4;
}

#google>a:hover {
	background: #2a75f3;
}

#findPwForm {
	display: none;
	opacity: 0;
	transition: opacity 1.4s;
}

#checkForm {
	display: none;
	opacity: 0;
	transition: opacity 1.4s;
}
</style>
</head>
<body>
	<div id="signIn">
		<h1>Blog My Pet</h1>
		<h2>Sign In</h2>
		<form id="signInForm" method="POST" action="signIn">
			<div>
				<h4 id="msg"></h4>
				<div>
					<label>Email</label> <input type="email" name="email"
						id="signIn-email">
				</div>
			</div>
			<div>
				<div>
					<label> Password<a id="findPw">Forgot?</a>
					</label> <input type="password" name="password" id="signIn-password">
				</div>
			</div>
			<div id="signInBtn" class="btn">
				<a>로그인</a>
			</div>
			<div id="google" class="btn">
				<a>Google 계정으로 로그인하기</a>
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
		<form id="checkForm" method="POST">
			<div>
				<h4>
					인증 메일이 발송되었습니다.<br>메일함을 확인하여 이메일 인증코드를 입력해주세요.
				</h4>
				<div>
					<label>Authentication Code</label> <input type="text" name="code">
				</div>
				<div id="checkBtn" class="btn">
					<a>확인</a>
				</div>
			</div>
		</form>

	</div>
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
				} else
					location.href = data;
			}
		});
	});
</script>
</html>