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
<script
	src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>
<style>
.blog-right {
	display: flex;
}

.post {
	padding: 30px;
	background: white;
	width: 100%;
	box-shadow: 0 1px 2px rgb(0 0 0/ 7%);
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.post h5 {
	padding: 0 10px 2px 10px;
	font-size: 20px;
	font-weight: 700;
	color: #777;
}

.post h2 {
	padding: 0 10px 10px;
	font-size: 30px;
	font-weight: 800;
}

.post-bd {
	display: flex;
	justify-content: space-between;
}

.post-bd p {
	padding-right: 10px;
}

.post-bd a, .post-btns a {
	background: #fff;
	border-radius: 4px;
	font-weight: bold;
	padding: 4.5px 12px 4px;
	font-size: 13px;
	width: max-content;
	color: #777;
	border: 1px solid #e0e0e0;
	transition: color 0.1s, border 0.1s;
}

.post-bd a:hover {
	border: 1px solid rgb(187, 187, 187);
	color: rgb(68, 68, 68) !important;
	cursor: pointer;
}

.post-bd a:first-child {
	margin-right: 10px;
}

.post-bottom {
	padding: 0 10px;
}

.ck-content {
	border-color: transparent !important;
}

.ck-editor__top {
	display: none !important;
}

.post-bottom {
	display: flex;
	justify-content: space-between;
}

.post-bottom>div:nth-child(2) {
	display: flex;
}

.post-bottom .select {
	margin-left: 0 !important;
}

#post-comment {
	display: none;
	margin-top: 10px;
	margin: 10px 10px 0 10px;
	background: #f4f4f4;
}

.post-top {
	min-height: 255px;
}

#ht {
	padding: 3.5px 6px;
	border: 1px solid #e0e0e0;
	border-radius: 50%;
	margin-left: 5px;
	margin-top: 1.5px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12px;
	color: #e0e0e0;
	cursor: pointer;
}

.post-bottom a {
	border-radius: 4px;
	padding: 7px 10px 4px;
	font-size: 12px;
	background: white;
	border: 1px solid #e0e0e0;
	margin-left: 10px;
}

#post-comment>ul {
	padding: 13px 15px 0;
}

#post-comment>ul>li {
	border-bottom: 1px solid #e0e0e0;
	padding: 5px;
}

#post-comment>ul>li:last-child {
	border-color: transparent !important;
}

#post-comment>ul>li>div>p:first-child {
	display: flex;
	font-size: 15px;
	font-weight: 700;
	padding-top: 2px;
}

#post-comment>ul>li>div>p:last-child {
	font-size: 13px;
}

#post-comment img {
	width: 17px;
	height: 17px;
	border-radius: 50%;
	margin-right: 5px;
}

#paging {
	padding-bottom: 15px;
	padding-right: 15px;
}
</style>
</head>
<body>
	<div class="post">
		<div class="post-top">
			<div class="post-bd">
				<h5>${post.regDate }</h5>

			</div>
			<h2>${post.title }</h2>
			<div id="editor">${post.content }</div>
		</div>
		<div class="post-bottom">
			<div>
				<div class="select" id="commentBtn">
					<p>댓글 ${post.countComment }</p>
					<p>⌵</p>
				</div>
				<span id="ht">♥︎</span>
			</div>
			<div>
				<a>수정</a><a id="delBtn">삭제</a>
			</div>
		</div>
		<div id="post-comment">
			<ul id="commetList">
			</ul>
			<c:import url="../../common/paging.jsp"></c:import>
		</div>
	</div>
</body>
<script type="text/javascript">
	$('#delBtn').on('click', function() {
		$.ajax({
			type : 'post',
			url : 'delete.do',
			dataType : 'json',
			data : {
				no : '${post.no}'
			},
			success : function(data) {
				if (data == null)
					location.href = "blog?blog=${accessor.no}"

			}
		});
	})

	$(document)
			.on(
					'click',
					'#commentBtn',
					function() {
						var cArea = $('#commetList');
						if (cArea.text().trim() == '') {
							getComment(${paging.currentPage});
						}
						if ($('#post-comment').css('display') == 'none')
							$('#post-comment').show();
						else
							$('#post-comment').hide();
					});
	
	$(document).on('click','#numBtn',function(){
		var no = $(this).attr('no');
		getComment(no);
	});
	
	 ClassicEditor
	 .create(document.getElementById("editor"), {
	 language: 'ko',
	 })
	 .then(newEditor => {
	 editor = newEditor;
	 editor.isReadOnly = true;
	 });
	 
	 function getComment(page){
		 $
			.ajax({
				url : 'comment.do',
				dataType : 'json',
				data : {
					no : '${post.no}',
					page : page,
					countComment : '${post.countComment}'
				},
				success : function(data) {
					var str='';
					for (var i=0;i<data.length;i++) {
						str += '<li><div><p><span><img src="'
							+ data[i].fileName
							+'"></span>'
							+ data[i].nickname
							+ '</p><p>'
							+ data[i].content
							+ '</p></div></li>';
					}
					console.log(str);
					cArea.html(str);
				}
			});
	 }
</script>
</html>