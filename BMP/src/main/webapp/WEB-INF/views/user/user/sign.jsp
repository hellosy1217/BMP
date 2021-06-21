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

.pink a {
	background: #ea4c88;
}

.pink a:hover {
	background-color: #df3e7b;
}

#google>a {
	background: #4285f4;
}

#google>a:hover {
	background: #2a75f3;
}
#checkForm, #newPwForm {
	display: none;
	opacity: 0;
	transition: opacity 1.4s;
}
</style>
</head>
<script>
	var authKey;
	var email;
	var act = 'sign';
</script>
<body>
	<div id="sign">
		<h1 onclick="location.href='explorer'">Blog My Pet</h1>
		<c:choose>
			<c:when test="${view eq 2 }">
				<c:import url="signUp.jsp" />
			</c:when>
			<c:when test="${view eq 1 }">
				<c:import url="find.jsp" />
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
					<label>Authentication Code</label> <input type="text" name="code"
						id="inputKey">
				</div>
				<div id="checkBtn" class="btn pink">
					<a>확인</a>
				</div>
			</div>
		</form>
	</div>
</body>
<script>
	var gauth;

	$(document).on('click', '#checkBtn a', function() {
		var inputKey = $('#inputKey').val();
		if (authKey != '' && authKey == inputKey) {
			$.ajax({
				url : 'updateConfirm.do',
				dataType : 'json',
				data : {
					email : email
				},
				success : function(data) {
					console.log(data);
					if (data == 'success') {
						if (act == 'sign') {
							location.href = 'explorer'
						} else {
							checkForm('#checkForm', '#newPwForm');
						}
					}
				}
			});
		} else {
			$('#inputKey').css('background', '#ffe2ed');
			$('#inputKey').focus();
		}
	});

	$(document).on('keyup paste change', '#form-password', function() {
		var password = $(this).val().trim();
		if (password.length > 5) {
			$(this).css('background', 'white');
			$(this).attr('useable', '1');
		} else {
			$(this).css('background', '#ffe2ed');
			$(this).attr('useable', '0');
		}
	});

	$(document).on('keyup paste change', '#form-cPassword', function() {
		var password = $('#form-password').val().trim();
		var cpassword = $(this).val().trim();
		if (password == cpassword) {
			$(this).css('background', 'white');
			$(this).attr('useable', '1');
		} else {
			$(this).css('background', '#ffe2ed');
			$(this).attr('useable', '0');
		}
	});

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
								if (gauth.isSignedIn.get()) {
									$('#google a').text('Google 계정에서 로그아웃');
								} else {
									$('#google a').text('Google 계정으로 로그인');
								}
							});
					});

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
							}, function() {
							});
						});
	}

	function checkForm(hide, show) {
		$(hide).css('transition', 'opacity 0.7s');
		setTimeout(function() {
			$(hide).css('opacity', '0');
		}, 100);
		setTimeout(function() {
			$(hide).css('display', 'none');
			$(show).css('display', 'flex');
		}, 420);
		setTimeout(function() {
			$(show).css('opacity', '100');
		}, 450);
	}

	function validateEmail(inputEmail) {
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (filter.test(inputEmail))
			return true;
		else
			return false;
	}
</script>
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer></script>
</html>