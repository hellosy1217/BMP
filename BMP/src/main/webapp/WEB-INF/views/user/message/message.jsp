<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	font-family: sans-serif;
	outline: none;
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

#msg-right>div {
	background: white;
	padding-top: 30px;
	box-shadow: 0 1px 2px rgb(0 0 0/ 7%);
	height: 480px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

#msg-right ol {
	display: flex;
	flex-direction: column;
	padding: 0 40px;
}

#msg-right li {
	display: flex;
}

#msg-right li>div {
	display: inline-flex;
	padding: 10px 10px 9px;
	font-size: 15px;
	box-shadow: 0 1px 2px rgb(0 0 0/ 7%);
}

.sendMessage {
	justify-content: flex-end;
}

.sendMessage>div {
	background: pink;
	border-radius: 8px;
}

.receiveMessage>div {
	background: #f4f4f4;
	border-radius: 8px;
}

#msg-right input {
	border: 1px solid;
	font-size: 16px;
	padding: 8px 10px 6px;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<div id="container">
		<input type="hidden" id="page" value="${paging.currentPage }">
		<div id="msg">
			<div id="msg-left">
				<c:import url="../user/profile.jsp" />
			</div>
			<div id="msg-right">
				<div>
					<div>
						<div></div>
						<ol>
							<c:forEach items="${room.dmList}" var="dms">
								<c:choose>
									<c:when test="${dms.userNo eq accessor.no }">
										<li class="sendMessage" no="${dms.no }"><div>${dms.content }</div></li>
									</c:when>
									<c:otherwise>
										<li class="receiveMessage" no="${dms.no }"><div>${dms.content }</div></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ol>
					</div>
					<div id="input">
						<input type="text" placeholder="Add Message..."
							id="message-content"><a id="sendBtn">Send</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	var roomNo = '${room.no}';
	var no = 0;
	$(document).keydown(function(e) {
		if (e.keyCode == 13) {
			send();
		}
	});

	$('#sendBtn').on('click', function() {
		send();
	});

	$(function() {
		setInterval(function() {
			update();
		}, 3000);
	});

	function send() {
		var userNo = '${accessor.no}';
		var content = $('#message-content').val().trim();
		$.ajax({
			url : 'sendMessage.do',
			dataType : 'json',
			data : {
				userNo : userNo,
				roomNo : roomNo,
				content : content
			},
			success : function(data) {
				console.log(data);
				if (data == 1) {
					$('#message-content').val('');
					$('#message-content').focus();
				} else {
					// 오류
				}
			}
		});
	}

	function update() {
		no = $('#msg-right li').last().attr('no');
		$.ajax({
			url : 'updateMessage.do',
			dataType : 'json',
			data : {
				no : no,
				roomNo : roomNo
			},
			success : function(data) {
				console.log(data);
			}
		});
	}
</script>
</html>