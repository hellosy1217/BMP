<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<style>
.post {
	position: relative;
}

.post>div:first-child {
	background: #fff;
	padding: 12px 12px 12px 12px;
	box-shadow: 0 1px 2px rgb(0 0 0/ 7%);
	height: calc(100% - 24px);
}

.post .thumbnail {
	width: 100%;
	height: 100%;
}

.post-content {
	position: absolute;
	display: flex;
	align-items: flex-end;
	height: -webkit-fill-available;
	top: 0;
	color: #888;
	overflow: hidden;
	transition: opacity 0.3s;
	font-size: 13px;
	opacity: 0;
	width: -webkit-fill-available;
}

.post-content:hover {
	opacity: unset;
}

.post-content>div {
	background: #fff;
	padding: 0 12px;
	display: flex;
	width: inherit;
	cursor: pointer;
}

.post-content>div>div:first-child {
	width: 100%;
}

.post-content>div>div:last-child {
	padding: 12.5px 0;
	display: flex;
	width: max-content;
	display: flex;
}

.post-content div>p {
	display: flex;
}

.post-content img {
	width: 16px;
	height: 16px;
	border-radius: 50%;
	margin-top: 1px;
}

.post-content a {
	background: #fff;
	border-radius: 4px;
	font-weight: bold;
	line-height: 17px;
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 5px 12px;
	font-size: 13px;
	box-shadow: 0 1px 2px rgb(0 0 0/ 7%);
	width: max-content;
	border: 1px solid rgb(236, 236, 236);
	transition: color 0.1s, border 0.1s;
}

.post-content a:hover {
	border: 1px solid rgb(187, 187, 187);
	color: rbg(68, 68, 68) !important;
}

.post-content span {
	display: inline-flex;
	padding-right: 5px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12px;
}

.post-content .nickname {
	font-size: 15px;
	font-weight: 600;
	padding-left: 5px;
}

.post-content .date {
	font-size: 11px;
	color: #777;
	padding: 5px 0 10px;
}

.post-content .post-title {
	font-weight: 600;
	color: #333;
	padding-top: 10px;
	text-overflow: ellipsis;
}

.liked {
	color: #ea4c89;
}
</style>
</head>
<body>
	<ol>
		<c:forEach items="${list }" var="post">
			<li class="post">
				<div>
					<img class="thumbnail"
						src="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg">
				</div>
				<div class="post-content">
					<div no="${post.no }" blog="${post.userNo }">
						<div>
							<p class="post-title">${post.title }</p>
							<p class="date">${post.regDate }</p>
						</div>
						<c:choose>
							<c:when test="${post.like eq 0 }">
								<div class="likeBtn" like="${post.like }">
									<a><span>♥︎</span>Like</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="likeBtn liked" like="${post.like }">
									<a><span>♥︎</span>Like</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</li>
		</c:forEach>
	</ol>
</body>
<script>
	$(document).on('click', '.likeBtn', function() {
		var div = $(this);
		var no = $(this).attr('like');
		var postNo = $(this).parent().attr('no');

		console.log('test:' + no);
		if ('${accessor}' != '') {
			$.ajax({
				url : 'like.do',
				data : {
					no : no,
					postNo : postNo
				},
				success : function(data) {
					console.log("data: "+data);
					if (data == 2) {
						div.attr({
							'class' : 'likeBtn liked',
							'like' : '1'
						});
					} else if (data == 1) {
						div.attr({
							'class' : 'likeBtn',
							'like' : '0'
						});
					}
				}
			});
		} else {
			location.href = 'signIn';
		}
	});
</script>
</html>