<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<style>
.follower a {
	color: unset;
}

.follower img {
	border-radius: 50%;
	width: 70px;
	height: 70px;
}

.follower li {
	display: flex;
	background: white;
	flex-direction: column;
	align-items: center;
	padding: 40px;
	box-shadow: 0 1px 2px rgb(0 0 0/ 7%);
	border-radius: 8px;
}

.follower {
	grid-template-columns: repeat(4, auto) !important;
}

.nickname {
	font-weight: 700;
	font-size: 16px;
	padding: 20px 0 10px 0;
}

#list {
	background: white;
	border-radius: 8px;
	padding: 10px 20px;
	box-shadow: 0 1px 2px rgb(0 0 0/ 7%);
}

#list img {
	width: 30px;
	height: 30px;
	border-radius: 50%;
}

#list li {
	padding: 15px 20px;
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid rgb(221, 221, 221);
}

#list li:first-child {
	padding: 15px 20px !important;
}

#list li:last-child {
	border-color: transparent !important;
	padding: 15px 20px 20px !important;
}

#list li>div {
	display: flex;
	align-items: center;
}

#list p {
	padding: 0 10px;
	font-weight: 700;
}
</style>
</head>
<body>
	<div id="list">
		<ul>
			<c:forEach items="${fList }" var="list">
				<li><div>
						<img src="${list.fileName }">
						<p>${list.nickname }</p>
					</div>
					<div no="${list.no }" >
						<c:choose>
							<c:when test="${list.no eq accessor.no }"></c:when>
							<c:when
								test="${list.followInfo eq null or list.followInfo.no eq null}">
								<a class="follow-btn">Follow</a>
							</c:when>
							<c:otherwise>
								<a class="follow-btn followed">Following</a>
							</c:otherwise>
						</c:choose>
					</div></li>
			</c:forEach>
		</ul>
	</div>
</body>
<script>
	$(document).on('click', '#list .follow-btn', function() {
		var div = $(this).parent();
		var no = div.attr('no');
		if ('${accessor}' != null && '${accessor}' != '') {
			$.ajax({
				type : 'post',
				url : 'follow.do',
				Type : 'json',
				data : {
					toUser : no,
					fromUser : '${accessor.no}'
				},
				success : function(data) {
					div.attr('followed', data);
				}
			});
		} else {
			location.href = 'signIn';
		}
	});
</script>
</html>