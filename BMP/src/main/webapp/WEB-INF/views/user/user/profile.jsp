<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#more-btn {
	padding: 5px 10px;
	font-size: 14px;
	position: absolute;
	top: 0;
	right: 0;
	margin-right: -25px;
	margin-top: 12px;
	color: rgb(221, 221, 221);
	transition: color 0.2s;
}

#more-btn:hover {
	cursor: pointer;
	color: rgb(146, 146, 146);
}

#dm-btn {
	background: rgb(125, 186, 99);
	border-radius: 4px;
	color: white;
	font-weight: bold;
	line-height: 17px;
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 5px 12px;
	font-size: 14px;
	min-width: 63px;
	text-align: center;
}

#dm-btn:hover {
	background: #6cb14f;
	cursor: pointer;
}

#user-profile {
	background: white;
	padding-top: 40px;
	border-radius: 8px;
	position: fixed;
	z-index: 4;
	width: 230px;
	box-shadow: 0 1px 2px rgb(0 0 0/ 7%);
}

#profile img {
	width: 50px;
	height: 50px;
	border-radius: 8px;
}

#profile {
	padding: 0 40px;
	/* border-bottom: 1px solid #e5e5e5; */
}

#profile>div {
	display: flex;
	justify-content: center;
}

#profile>div:nth-child(2) {
	font-weight: 800;
	font-size: 17px;
	padding: 20px 0 10px 0;
}

#profile-comment {
	font-size: 13px;
	text-align: center;
	padding: 5px 0;
}

#profile-btns {
	position: relative;
	flex-direction: column;
	padding-top: 15px;
	align-items: center;
}

#profile-btns>p:first-child {
	display: flex;
}

#dm-p {
	padding-top: 8px;
	display: none;
	transition: display 0.3s;
}

.follow {
	padding: 20px 20px 30px 20px;
}

.follow>div {
	display: flex;
	justify-content: center;
}

.follow>div p:nth-child(odd) {
	padding-right: 3px;
	font-weight: 700;
	font-size: 15px;
}

.follow>div p:nth-child(odd):hover {
	color: #444c;
	cursor: pointer;
}

.follow>div p:nth-child(even) {
	font-size: 12px;
	margin-top: 2.7px;
	padding-left: 3px;
}

.follow>div p:nth-child(3) {
	padding-left: 12px;
}

.font-rotate {
	-webkit-transform: rotate(180deg);
	margin-top: 17px !important;
}

.follow-btn {
	background: rgb(63, 140, 185);
	border-radius: 4px;
	color: #fff;
	font-weight: bold;
	line-height: 17px;
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 5px 12px;
	font-size: 14px;
	min-width: 63px;
	text-align: center;
}

.follow-btn:hover {
	background: #33769c;
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="user-profile">
		<div id="profile">
			<div>
				<img
					src="https://www.unboxingdeals.com/wp-content/uploads/2018/08/Dogs.jpg">
			</div>
			<div>${profile.nickname }</div>
			<c:if test="${profile.comment ne null and profile.comment ne '' }">
				<div id="profile-comment">${profile.comment }</div>
			</c:if>
			<div id="profile-btns">
				<p>
					<a class="follow-btn">Follow</a>
				</p>
				<p>
					<a id="more-btn">⌵</a>
				</p>
				<p id="dm-p">
					<a id="dm-btn">Message</a>
				</p>
			</div>
		</div>
		<div class="follow">
			<div>
				<p>${profile.follow }</p>
				<p>팔로잉</p>
				<p>${profile.follower }</p>
				<p>팔로워</p>
			</div>

		</div>
	</div>
</body>
<script>
	$(document).on('click', '#more-btn', function() {
		if ($(this).attr('class') != 'font-rotate') {
			$('#dm-p').css('display', 'flex');
			$(this).attr('class', 'font-rotate');
		} else {
			$('#dm-p').css('display', 'none');
			$(this).attr('class', '');
		}
	});

	$(document).on('click', '#dm-btn', function() {
		if('${accessor.no}'=='${profile.no}')
			location.href='message';
		else
			console.log('hi');
	});
</script>
</html>