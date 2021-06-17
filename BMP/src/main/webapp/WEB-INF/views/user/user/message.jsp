<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Blog My Pet</title>
<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
	border: 0;
	background: transparent;
}

::selection {
	background: #ea4c89;
	color: rgba(255, 255, 255, 0.85);
}

table {
	border-collapse: collapse;
	width: 100%;
}

#msg {
	display: flex;
	background: #f4f4f4;
}

#msg-left {
	padding: 30px 0 30px 40px;
}

#msg-right {
	padding: 30px 40px 30px 270px;
	width: 100%;
}

#pageInfo span:last-child {
	padding-left: 5px;
}

.msg-old {
	background: #f4f4f4;
}

.msg-old .content span:first-child {
	background: transparent !important;
}

.msg-old:hover {
	background: #efefef;
}

.msg-new {
	background: white;
}

.msg-new:hover {
	background: #fdfdfd;
}

#list {
	padding-bottom: 10px;
}

#list img {
	width: 40px;
	height: 40px;
	border-radius: 50%;
}

#list tr {
	border-top: 1px solid #e5e5e5;
}

#list tr:hover {
	cursor: pointer;
}

#list tr>td {
	font-size: 15px;
	display: inline-flex;
	padding: 10px;
}

#list td:first-child {
	padding: 10px 10px 10px 30px;
}

#list tr:last-child {
	border-bottom: 1px solid #e5e5e5;
}

#list .nickname {
	font-weight: 600;
	font-size: 15px;
	width: 12.5%;
}

#list .time {
	padding: 10px 30px 10px 0;
	width: 80px;
	display: inline-flex;
	justify-content: flex-end;
	color: #888;
}

#list .content {
	width: calc(87.5% - 230px);
}

#list .content p {
	display: inline-flex;
}

#list .content p:first-child {
	padding: 6px 10px 5px 0;
}

#list .content span:first-child {
	border-radius: 50%;
	background: #ea4c89;
	padding: 4px;
}

#msg #title {
	font-size: 20px;
	font-weight: 700;
}

#msg #pageInfo {
	display: flex;
	justify-content: flex-end;
	font-size: 13px;
	font-weight: 500;
	padding-bottom: 5px;
}

#msg #pageInfo>span:last-child {
	font-weight: 600 !important;
}

.follow-btn {
	background: rgb(63, 140, 185);
	border-radius: 4px;
	color: #fff;
	font-weight: bold;
	line-height: 17px;
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 6px 12px 4px 12px;
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
	<c:import url="../common/header.jsp" />

	<div id="container">
		<input type="hidden" id="page" value="${paging.currentPage }">
		<div id="msg">
			<div id="msg-left">
				<c:import url="profile.jsp" />
			</div>
			<div id="msg-right">
				<div id="title">Messages</div>
				<div id="pageInfo">
					<span>1 - 10 of 21</span> <span>Messages</span>
				</div>
				<div id="list">
					<table>
						<tr class="msg-new" no="1">
							<td><img
								src="https://i.pinimg.com/564x/fa/41/ac/fa41ace1ab4cde11018a9b224e488806.jpg">
							</td>
							<td class="nickname">username</td>
							<td class="content"><p>
									<span></span>
								</p>
								<p>내용...ASDASFSAFSADIAOSPDIASOID</p></td>
							<td class="time">7분 전</td>
						</tr>
						<c:forEach begin="1" end="9">
							<tr class="msg-old" no="1">
								<td><img
									src="https://i.pinimg.com/564x/fa/41/ac/fa41ace1ab4cde11018a9b224e488806.jpg">
								</td>
								<td class="nickname">username</td>
								<td class="content"><p>
										<span></span>
									</p>
									<p>내용...ASDASFSAFSADIAOSPDIASOID</p></td>
								<td class="time">7분 전</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<c:import url="../../common/paging.jsp" />
			</div>
		</div>
	</div>
</body>
<script>
	$(document).on('click', '.follow-btn', function() {
		var text = $(this).text();
		if (text == 'Follow') {
			$(this).text('Following');
			$(this).css({
				'background' : '#ddd',
				'color' : '#929292'
			});
		} else {
			$(this).text('Follow');
			$(this).css({
				'background' : '',
				'color' : ''
			});
		}
	});

	$(document).on('click', '#list tr', function() {
		var no = $(this).attr('no');
	});
</script>
</html>