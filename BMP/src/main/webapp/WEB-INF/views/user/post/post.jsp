<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>
<style>
.blog-right {
	display: flex;
}

.post {
	padding: 20px 30px;
	background: white;
	width: 100%;
	box-shadow: 0 1px 2px rgb(0 0 0/ 7%);
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
	padding-top: 10px;
}

.post-bd a {
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

.ck-content {
	border-color: transparent !important;
}

.ck-editor__top {
	display: none !important;
}
</style>
</head>
<body>
	<div class="post">
		<div class="post-bd">
			<h5>${post.regDate }</h5>
			<p>
				<a>수정</a><a id="delBtn">삭제</a>
			</p>
		</div>
		<h2>${post.title }</h2>
		<div>
			<div id="editor">${post.content }</div>
		</div>
	</div>
</body>
<script type="text/javascript">

$('#delBtn').on('click',function(){
	$.ajax({
		type:'post',
		url:'delete.do',
		dataType:'json',
		data:{
			no:'${post.no}'
		},
		success:function(data){
			if(data==null)
				location.href="blog?blog=${accessor.no}"
			
		}
	});
})

ClassicEditor
.create(document.getElementById("editor"), {
	language: 'ko',
})
.then(newEditor => {
	editor = newEditor;
	editor.isReadOnly = true;
});

</script>
</html>