<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form id="findPwForm" method="POST">
		<div>
			<h4>
				가입 시 사용한 이메일을 입력해주세요.<br>입력하신 메일로 인증메일을 보내드립니다.
			</h4>
			<div>
				<label>Email</label> <input type="email" id="findPw-email">
			</div>
			<div id="findBtn" class="btn pink">
				<a>이메일 전송</a>
			</div>
		</div>
	</form>
	<form id="newPwForm" method="POST" action="updatePw">
		<input type="hidden" name="email" id="updatePw-email">
		<div>
			<div>
				<label> Password </label> <input type="password" id="form-password"
					placeholder="6+ characters" useable="0" name="password">
			</div>
			<div>
				<label> Confirm Password </label> <input type="password"
					id="form-cPassword" useable="0">
			</div>
			<div id="updatePwBtn" class="btn pink">
				<a>비밀번호 변경</a>
			</div>
		</div>
	</form>
</body>
<script>
	// 이메일 확인하기
	$(document).on('click', '#findBtn', function() {
		email = $('#findPw-email').val();
		if (validateEmail(email)) {
			$.ajax({
				url : 'checkUser.do',
				dataType : 'json',
				data : {
					email : email,
					send : 1
				},
				success : function(data) {
					if (data != '0') {
						authKey = data;
						checkForm('#findPwForm', '#checkForm');
						act = 'find';
					} else {
						$('#findPw-email').css('background', '#ffe2ed');
					}
				}
			});
		} else {
			$('#findPw-email').css('background', '#ffe2ed');
			$(this).attr('useable', '0');
		}
	});

	// 비밀번호 변경하기
	$(document).on('click', '#updatePwBtn', function() {
		var pw = $('#form-password');
		var npw = $('#form-cPassword');
		if (pw.attr('useable') == '1' && npw.attr('useable') == '1') {
			$.ajax({
				url : 'updatePw.do',
				dataType : 'json',
				data : {
					email : email,
					password : pw.val()
				},
				success : function(data) {
					if (data != null)
						location.href = data;
				}
			});
		}
	});
</script>
</html>