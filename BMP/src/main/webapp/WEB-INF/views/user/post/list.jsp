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
						src="${post.fileName }">
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
	
	$(document).on('click', '.post-content>div>div:first-child', function(e) {
		var post = $(this).parent().attr('no');
		location.href = "${pageContext.request.contextPath}/post?no=" + post;
	});
	
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