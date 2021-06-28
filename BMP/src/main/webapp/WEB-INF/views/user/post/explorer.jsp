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
<script>
$(window).scroll(function(){
	if($(document).height() <= $(window).scrollTop() + $(window).height()){
		var page = Number($('#page').val())+1;
		var keyword = '${keyword}';
		var sort = $('#sort').text();
		if($('#page').val()<${listInfo.paging.maxPage}){
			$.ajax({
				url:'morePost.do',
				dataType : 'json',
				data:{
					no:0,
					page:page,
					limit:${listInfo.paging.boardLimit},
					keyword:keyword,
					sort:sort
				},
				success:function(data){
					var str = '';
					for(var i=0; i < data.length; i++){
						str+='<li class="post"><div><img class="thumbnail" src="';
						str+='https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg';
						str+='"></div><div class="post-content"><div><p><span><img src="';
						str+='https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg';
						str+='"></span><span class="nickname">';
						str+=data[i].nickname;
						str+='</span></p><p>';
						str+=data[i].content;
						str+='</p><p class="tags">';
						str+=data[i].tag;
						str+='</p></div><p class="date">';
						str+=data[i].regDate;		
						str+='</p></div></li>';
					}
					$('.blog ol').append(str);
					$('#page').val(page);
				}
			});
		}
	}
});
</script>
</html>