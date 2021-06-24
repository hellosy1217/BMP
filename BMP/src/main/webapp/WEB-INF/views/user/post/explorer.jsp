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

.blog {
	background-color: #f4f4f4;
	padding: 30px 40px;
}

.blog ol {
	display: grid;
	grid-gap: 30px;
	grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<div id="container">
		<input type="hidden" id="page" value="${listInfo.paging.currentPage }">
		<div class="blog">
			<c:import url="list.jsp" />
		</div>
	</div>
</body>
</html>