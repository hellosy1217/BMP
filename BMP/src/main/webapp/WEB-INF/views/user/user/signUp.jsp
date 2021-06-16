<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog My Pet</title>
<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
	border: 0;
	background: transparent;
	font-family: "Haas Grot Text R Web", "Helvetica Neue", Helvetica, Arial,
		sans-serif;
}

h1 {
	color: #fff;
	font-size: 78px;
	font-weight: 800;
}

#signUp {
	display: flex;
	justify-content: center;
	flex-direction: column;
	align-items: center;
	min-width: 800px;
	width: 100%;
}

#signUp>div {
	display: flex;
	width: calc(100% - 100px);
	display: flex;
}

#signUp>div:first-child {
	padding: 30px 50px;
	background: #9da3a5;
}

form {
	padding-top: 3%;
	width: 30%;
	height: calc(320px - 3%);
}

form div {
	display: flex;
	flex-direction: column;
	width: 100%;
}

#signUpForm {
	transition: opacity 0.7s;
}

#signUpForm>div {
	padding-bottom: 15px;
}

label {
	font-weight: 500;
	padding-bottom: 2px;
}

label>a {
	margin-left: 7px;
	font-size: 14px;
	text-decoration: underline;
	color: #999;
	font-weight: 500;
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
	padding-top: 15px;
}

.btn a {
	text-align: center;
	border-radius: 4px;
	padding: 11px 12px 9px;
	color: #fff;
	cursor: pointer;
	text-shadow: 1px 1px 1px rgb(0 0 0/ 15%);
}

#signUpBtn>a {
	background: #ea4c88;
}

#signUpBtn>a:hover {
	background-color: #df3e7b;
}

#google {
	padding-top: 5px;
}

#google>a {
	background: #4285f4;
}

#google>a:hover {
	background: #2a75f3;
}

#report {
	position: fixed;
	z-index: 5;
	background: skyblue;
}

#signUpForm input {
	background: #00000012;
	box-shadow: 0 1px 2px #00000026 inset;
}

#signUpForm input::placeholder {
	font-size: 15px;
	color: #999;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<div id="signUp">
		<div>
			<h1>Sign Up</h1>
		</div>
		<div>
			<form id="signUpForm" method="POST">
				<div>
					<div>
						<label>Email</label> <input type="email" name="email">
					</div>
				</div>
				<div>
					<div>
						<label>Nickname</label> <input type="text" name="nickname">
					</div>
				</div>
				<div>
					<div>
						<label>Password</label> <input type="password" name="password"
							placeholder="Minimum 6 characters">
					</div>
				</div>
				<div>
					<div>
						<label>Confirm Password</label> <input type="password"
							name="confirmPassword">
					</div>
				</div>
				<div id="signUpBtn" class="btn">
					<a>가입</a>
				</div>
				<div id="google" class="btn">
					<a>Google 계정으로 가입하기</a>
				</div>
			</form>
		</div>
	</div>
	<div id="report">
		<form>
			<div>문의글...</div>
			<textarea rows="3" cols="3"></textarea>
		</form>

	</div>
</body>
<script>
	
</script>
</html>