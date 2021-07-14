<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog My Pet</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>
<script src="<c:url value="/resources/js/MyUploadAdapter.js"/>"></script>
</head>
<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
	border: 0;
	background: transparent;
	font-family: sans-serif;
	outline: none;
}

body {
	background: #f4f4f4;
}

form#content {
	padding: 0 30px;
}

form#content>div:first-child {
	padding: 30px 0 15px;
}

.ck-content {
	height: 600px;
}

#content input {
	background: white;
	border: 1px solid #c4c4c4;
	width: calc(100% - 22px);
	padding: 15px 10px;
	font-size: 16px;
	color: #444444;
}

.btns {
	display: flex;
	padding: 15px 0;
	justify-content: flex-end;
}

.btns a {
	text-align: center;
	border-radius: 4px;
	padding: 11px 50px 9px;
	color: #fff;
	cursor: pointer;
	text-shadow: 1px 1px 1px rgb(0 0 0/ 15%);
}

#writeBtn {
	background: #ea4c88;
}

#writeBtn:hover {
	background: #df3e7b;
}

#cancelBtn {
	margin-right: 20px;
}
</style>
<body>
	<c:import url="../common/header.jsp" />
	<div>
		<form id="content">
			<div>
				<input type="text" id="title" value="${post.title }">
			</div>
			<div id="editor">${post.content }</div>
			<div class="btns">
				<a id="cancelBtn">취소</a>
				<c:choose>
					<c:when test="${post eq null}">
						<a id="writeBtn" type="submit">등록</a>
					</c:when>
					<c:otherwise>
						<a id="editBtn" type="submit">수정</a>
					</c:otherwise>
				</c:choose>
			</div>
		</form>
	</div>
</body>
<c:forEach items="${fileNames }" var="f">
		<script>fileArr.push('${f}');</script>
</c:forEach>
<script>
	let editor;
	var checkUnload = true;
	
	$(document).on('click', '#writeBtn', function() {
		checkUnload = false;
		var title = $('#title').val().trim();
		var userNo = '${accessor.no}';
		$.ajax({
			type : 'post',
			url : 'postwrite.do',
			dataType : 'json',
			data : {
				title : title,
				content : editor.getData(),
				userNo : userNo,
				fileArr : fileArr
			},
			success : function(data) {
				if (data > 0)
					location.href = "post?no=" + data;
			}
		});
	});
	
	$(document).on('click','#editBtn',function(){
		var title = $('#title').val().trim();
		var userNo = '${accessor.no}';
		$.ajax({
			type : 'post',
			url : 'edit.do',
			dataType : 'json',
			data : {
				no: '${post.no}',
				title : title,
				content : editor.getData(),
				userNo : userNo,
				fileArr : fileArr
			},
			success : function(data) {
				if (data > 0)
					location.href = "post?no=" + data;
			}
		});
	});
	
	$(function(){
		if('${post}'!=''){
			$('#title').val('${post.title}');
			$('#editor').text('${post.content}');
			console.log(fileArr);
		}
	});
	
	ClassicEditor
	.create(document.getElementById("editor"), {
		language: 'ko',
		extraPlugins: [MyUploadAdapterPlugin]
	})
	.then(newEditor => {
		editor = newEditor;
	});

	function MyUploadAdapterPlugin(editor) {
		editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
			return new MyUploadAdapter(loader)
		}
	}
</script>
</html>