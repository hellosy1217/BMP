<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<style>
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

.followBrn
</style>
</head>
<body>
	<ol class="follower">
		<c:forEach items="${fList }" var="list">
			<li>
				<div>
					<img
						src="https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg">
				</div>
				<div class="nickname">
					<a href="blog?blog=${list.no }">${list.nickname }</a>
				</div>
				<div>
					<c:choose>
						<c:when test="${list.followInfo.no eq 0}">
							<a class="follow-btn" no="${list.followInfo.no}">Follow</a>
						</c:when>
						<c:otherwise>
							<a class="follow-btn followed" no="${list.followInfo.no}">Following</a>
						</c:otherwise>
					</c:choose>
				</div>
				${list.followInfo.permission }
			</li>
		</c:forEach>
	</ol>
</body>
<script>
$(document).on('click', '.follow-btn', function() {
	var id = $(this).attr('id');
	if(id==null)
		console.log('hi..');
	else
		console.log('bye..');
	var list = $(this).attr('list');
	alert(list);
	
	/* if ('${accessor}' != null && '${accessor}' != '') {
		var text = $(this).text();
		var pms = 'Y';
		if ('${profile.userPrivate}' == 'Y')
			pms = 'N';
		$.ajax({
			type : 'post',
			url : 'follow.do',
			dataType : 'json',
			data : {
				no : followed,
				permission : pms,
				toUser : '${profile.no}',
				fromUser : '${accessor.no}'
			},
			success : function(data) {
				console.log(followed);
				followed = data;
				location.reload(true);
			}
		});
	} else {
		location.href = 'signIn';
	} */
});
</script>
</html>