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
}

img {
	object-fit: cover;
}

#body {
	display: flex;
}

.filter {
	background: #fbfbfb;
	border-bottom: 1px solid #e5e5e5;
	position: relative;
	width: 100%;
	display: flex;
	justify-content: center;
}

.blog {
	background-color: #f4f4f4;
	min-height: 400px;
	display: flex;
}

.blog-right {
	padding: 30px 40px 30px 270px;
	width: calc(100% - 350px);
}

.blog-right ol {
	display: grid;
	grid-gap: 30px;
	grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
}

.blog-left {
	padding: 30px 0 30px 40px;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<div id="container">
		<input type="hidden" id="page" value="${paging.currentPage }">
		<div class="blog">
			<div class="blog-left">
				<c:import url="../user/profile.jsp" />
			</div>
			<div class="blog-right">
				<c:choose>
					<c:when test="${list != null }">
						<c:import url="list.jsp" />
					</c:when>
					<c:otherwise>
						<c:import url="post.jsp" />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<%-- <c:import url="detail.jsp" /> --%>
</body>
<script>
	$(document).on('mouseover', '.contents', function() {
		$(this).children('.post_content').css({
			'opacity' : '100',
			'visibility' : 'visible'
		});
	}).on('mouseout', '.contents', function() {
		$(this).children('.post_content').css('opacity', '0');
		setTimeout(function() {
			$(this).children('.post_content').css('visibility', 'hidden');
		}, 300);
	});

	$(function() {
		setTimeout(function() {
			scrollTo(0, 0);
		}, 100);
	});
</script>
</html>