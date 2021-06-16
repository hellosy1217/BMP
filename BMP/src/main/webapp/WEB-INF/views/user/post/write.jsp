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
<script
	src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>
</head>
<style>
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

</style>
<body>
	<c:import url="../common/header.jsp" />
	<div>
		<form id="content" action="write.do">
			<div>
				<input type="text" id="title">
			</div>
			<div id="editor"></div>
			<div class="btns">
				<a id="writeBtn">등록</a>
			</div>
		</form>
	</div>
</body>
<script>
	var myEditor;
	 ClassicEditor
	 .create( document.querySelector( '#editor' ), {
	 ckfinder: {
	 uploadUrl: '/ck/fileupload' // 내가 지정한 업로드 url (post로 요청감)
	 },
	 alignment: {
	 options: [ 'left', 'center', 'right' ]
	 }
	 } )
	 .then( editor => {
	 console.log( 'Editor was initialized', editor );
	 myEditor = editor;
	 } )
	 .catch( error => {
	 console.error( error );
	 } );
	 
</script>
</html>