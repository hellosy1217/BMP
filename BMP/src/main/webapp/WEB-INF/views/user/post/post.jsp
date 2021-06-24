<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.post {
	padding: 50px;
	background: white;
}
</style>
</head>
<body>
	<div class="post">
	<h2>${post.title }</h2>
	<div id="post-content"></div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$('#post-content').html('${post.content}');
	
});
</script>
</html>