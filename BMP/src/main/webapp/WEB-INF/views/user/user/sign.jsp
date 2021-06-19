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

body {
	background: rgba(47, 47, 47, 0.98);
    text-align: center;
    display: flex;
}

html, body {
	width: 100%;
	height: 100%;
}

input {
	border-radius: 6px;
	padding: 8px 10px;
	color: #444;
	outline: none;
	font-size: 18px;
	background: white;
	cursor: text;
	transition: background 0.3s;
}

input::placeholder {
	color: #a5a5a5;
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

#sign {
	display: inline-block;
    min-width: 300px;
    margin: auto;
}

form {
	padding-top: 20px;
	text-align: left;
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
	padding-top: 10px;
}

label>a {
	margin-left: 7px;
	font-size: 14px;
	color: #999;
	font-weight: 400;
}

label>a:hover {
	cursor: pointer;
	color: #aaa;
}

#findPw {
	text-decoration: underline;
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

#signInBtn>a, #signUpBtn>a, #findBtn>a, #checkBtn>a {
	background: #ea4c88;
}

#signInBtn>a:hover, #signUpBtn>a:hover, #findBtn>a:hover, #checkBtn>a:hover
	{
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
	<div id="sign">
		<h1>Blog My Pet</h1>
		<c:choose>
			<c:when test="${view ne null }">
				<c:import url="signUp.jsp" />
			</c:when>
			<c:otherwise>
				<c:import url="signIn.jsp" />
			</c:otherwise>
		</c:choose>
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
	var gauth;

	$('#google a')
			.on(
					'click',
					function() {
						if ($(this).text() == 'Google 계정으로 로그인')
							gauth
									.signIn()
									.then(
											function() {
												var googleUser = gauth.currentUser
														.get();
												var profile = googleUser
														.getBasicProfile();
												var idtoken = googleUser
														.getAuthResponse().id_token;
												$
														.ajax({
															url : 'googleSign.do',
															type : 'POST',
															data : {
																idtoken : idtoken
															},
															dataType : 'json',
															beforeSend : function(
																	xhr) {
																xhr
																		.setRequestHeader(
																				"Content-type",
																				"application/x-www-form-urlencoded");
															},
															success : function(
																	data) {
																if (data == 'success')
																	location.href = "explorer";
															}
														});
											});
						else
							gauth.signOut().then(function() {
								console.log('gauth.signOut()실행됨 ');
								checkSignInStatus();
							});
					});

	function checkSignInStatus() {
		if (gauth.isSignedIn.get()) {
			$('#google a').text('Google 계정에서 로그아웃');
		} else {
			$('#google a').text('Google 계정으로 로그인');
		}
	}

	function init() {
		gapi
				.load(
						'auth2',
						function() {
							gauth = gapi.auth2
									.init({
										client_id : '777761637670-4aqnu191aitl31nh79q0gv5hpg6cvs0r.apps.googleusercontent.com'
									})
							gauth.then(function() {
								console.log('googleAuth success');
							}, function() {
								console.log('googleAuth fail');
							});
						});
	}
</script>
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer></script>
</html>