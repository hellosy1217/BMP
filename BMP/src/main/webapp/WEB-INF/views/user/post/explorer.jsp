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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
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
	grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
}

.post {
	position: relative;
}

.post>div:first-child {
	background: #fff;
	padding: 12px 12px 30px 12px;
	box-shadow: 0 1px 2px rgb(0 0 0/ 7%);
	height: calc(100% - 42px);
}

.post .thumbnail {
	width: 100%;
	height: 100%;
}

.post-content {
	position: absolute;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: -webkit-fill-available;
	top: 0;
	color: #888;
	background: rgba(255, 255, 255, 0.96);
	overflow: hidden;
	padding: 20px;
	transition: opacity 0.3s;
	font-size: 13px;
	opacity: 0;
	width: -webkit-fill-available;
}

.post-content:hover {
	opacity: unset;
	cursor: pointer;
}

.post-content>div>p {
	display: flex;
}

.post-content>div>p:first-child {
	padding-bottom: 10px;
}

.post-content img {
	width: 16px;
	height: 16px;
	border-radius: 50%;
	margin-top: 1px;
}

.post-content span {
	display: inline-flex;
}

.post-content .nickname {
	font-size: 15px;
	font-weight: 600;
	padding-left: 5px;
}

.post-content>.date {
	font-size: 11px;
	color: #777;
}

</style>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<div id="container">
		<input type="hidden" id="page" value="${listInfo.paging.currentPage }">
		<div class="blog">
			<ol>
				<c:forEach items="${list }" var="post">
					<li class="post">
						<div>
							<img class="thumbnail"
								src="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg">
						</div>
						<div class="post-content" no="${post.no }">
							<div>
								<p>
									<span><img
										src="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg">
									</span><span class="nickname">${post.nickname }</span>
								</p>
								<p>${post.content }</p>
								<p class="tags">${post.tag }</p>
							</div>
							<p class="date">${post.regDate }</p>
						</div>
					</li>
				</c:forEach>
			</ol>
		</div>
	</div>
	<%-- <c:import url="detail.jsp"/> --%>
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
						console.log(data);
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
			} else {
				$('#dialog').css({
					'display':'flex',
					'opacity':'100'
				});
				setTimeout(function(){
					$('#dialog').css({
						'opacity':'0'
					});
				}, 2000);
				setTimeout(function(){
					$('#dialog').css({
						'display':'none'
					});
				}, 4000);
			}
		}
	});
</script>
</html>