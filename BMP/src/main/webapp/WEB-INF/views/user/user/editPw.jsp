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
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<div class="setting">
		<ol>
			<li id="editProfile">Profile</li>
			<li>Password</li>
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
	$('#editProfile').on('click', function() {
		location.href = 'setting';
	});

	$('#saveBtn').on('click', function() {
		var pw = $('#password').val();
		var newPw = $('#newPassword').val();
		// 유효성 검사

		$.ajax({
			url:'editPw.do',
			dataType:'json',
			data:{
				pw:pw,
				newPw:newPw
			},
			success:function(data){
				alert(data);
			}	
		});
	});
</script>
</html>