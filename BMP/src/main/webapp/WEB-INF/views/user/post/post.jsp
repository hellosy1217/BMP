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

.post-bottom a {
	border-radius: 4px;
	padding: 7px 10px 4px;
	font-size: 12px;
	background: white;
	border: 1px solid #e0e0e0;
	margin-left: 10px;
}

.post-bottom>div {
	display: flex;
}

#post-comment>ul {
	padding: 0 15px;
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

.htBtn {
	padding: 3.5px 7px 1.5px;
	border: 1px solid #e0e0e0;
	border-radius: 50%;
	margin-left: 10px;
	line-height: 20px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12px;
	color: #e0e0e0;
	cursor: pointer;
}

.liked {
	color: #ea4c89;
	border-color: #ea4c89;
}

.post-bottom a {
	cursor: pointer;
}

#commentArea {
	display: flex;
	padding: 10px 15px 5px;
	justify-content: space-between;
}

#commentArea textarea {
	background: white;
	padding: 5px;
	resize: none;
	outline: none;
	width: calc(95% - 45px);
}

#commentArea a {
	background: #ea4c89;
	border-radius: 4px;
	color: #fff;
	font-weight: bold;
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 5.5px 12px 4.5px;
	font-size: 13px;
	width: 5%;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
}

#commentList a {
	font-weight: 400;
	font-size: 11px;
	height: fit-content;
	margin-top: 2px;
	padding-left: 5px;
	cursor: pointer;
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
				<div class="select commentBtn">
					<p class="commentBtn">댓글 ${post.countComment }</p>
					<p class="commentBtn">⌵</p>
				</div>
				<c:choose>
					<c:when test="${post.like > 0 }">
						<span class="htBtn liked" no="${post.like }">♥︎</span>
					</c:when>
					<c:otherwise>
						<span class="htBtn" no="${post.like }">♥︎</span>
					</c:otherwise>
				</c:choose>
			</div>
			<div>
				<c:choose>
					<c:when
						test="${accessor.no ne null and post.userNo eq accessor.no }">
						<a id="hideBtn">숨김<c:if test="${post.hideDate != null }"> 해제</c:if></a>
						<a id="editBtn">수정</a>
						<a id="delBtn">삭제</a>
					</c:when>
					<c:otherwise>
						<a id="reportBtn">신고</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="post-comment">
			<div id="commentArea">
				<textarea placeholder="Add Comment..." id="comment-content"></textarea>
				<a id="addCommentBtn" no="">등록</a>
			</div>
			<ul id="commentList">
				<c:forEach items="${cList }" var="list">
					<li><div>
							<p>
								<span><img src="${list.fileName }"></span>${list.nickname}
								<c:if test="${accessor!=null and accessor.no==list.userNo }">
									<a id="editCommentBtn" no="${list.no }">수정</a>
									<a id="delCommentBtn" no="${list.no }">삭제</a>
								</c:if>
							</p>
							<p id="content${list.no }">${list.content}</p>
						</div></li>
				</c:forEach>
			</ul>
			<c:import url="../../common/paging.jsp" />
			<form id="cPageForm" method="post">
				<input name="scroll" type="hidden" value="${scroll }">
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	var hideDate = '${post.hideDate}';
	
	$(document).on(
			'click',
			function(e) {
				var clicked = $(e.target).attr('id');
				if (typeof clicked == 'undefined' || clicked == '')
					clicked = $(e.target).attr('class');
				if (clicked == 'select commentBtn')
					clicked = 'commentBtn';

				if ('${accessor!=null}' || clicked == 'commentBtn'
						|| clicked == 'numBtn') {
					var no = $(e.target).attr('no');

					switch (clicked) {
					case 'commentBtn':
						showComment();
						break;
					case 'delBtn':
						deletePost();
						break;
					case 'hideBtn':
						hidePost();
						break;
					case 'editBtn':
						location.href = 'edit?no=${post.no}';
						break;
					case 'htBtn':
						ht();
						break;
					case 'numBtn':
						paging(no);
						break;
					case 'addCommentBtn':
						addComment();
						break;
					case 'editCommentBtn':
						edit(no);
						break;
					case 'delCommentBtn':
						delComment(no);
						break;
					case 'reportBtn':
						$('#reportForm').css('display', 'flex');
						break;
					case 'submitBtn':
						report();
						break;
					default:
						break;
					}
				} else {
					if (clicked.indexOf('Btn') > -1)
						location.href = 'signIn';
				}
			});

	$(window).on('load', function() {
		if ('${scroll}' != '') {
			showComment();
			$(document).scrollTop('${scroll}');
		}
	});

	function deletePost() {
		if ('${accessor.no}' == '${post.userNo}') {
			$.ajax({
				type : 'post',
				url : 'delPost.do',
				dataType : 'json',
				data : {
					no : '${post.no}'
				},
				success : function(data) {
					if (data == "success")
						location.href = "blog?blog=${accessor.no}";
				}
			});
		}
	}

	function showComment() {
		if ($('#post-comment').css('display') == 'none')
			$('#post-comment').show();
		else
			$('#post-comment').hide();
	}

	function hidePost() {
		$.ajax({
			url : 'hide.do',
			dataType : 'json',
			data : {
				no : '${post.no}',
				hide : hideDate
			},
			success : function(data) {
				if (hideDate == '') {
					hideDate = '1';
					$('#hideBtn').text('숨김 해제');
				} else {
					hideDate = '';
					$('#hideBtn').text('숨김');
				}
			}
		});
	}

	function addComment() {
		var content = $('#comment-content').val().trim();
		$.ajax({
			url : 'addComment.do',
			type : 'post',
			dataType : 'json',
			data : {
				userNo : '${accessor.no}',
				postNo : '${post.no}',
				content : content
			},
			success : function(data) {
				scrolled('#post-comment');
			}
		});
	}

	function edit(no) {
		var id = "#content" + no;
		var content = $(id).text();
		$('#comment-content').val(content);
		$('#addCommentBtn').attr({
			'no' : no,
			'class' : 'editCommentBtn'
		});
		$('#addCommentBtn').text('수정');
		$(document).scrollTop($('#comment-content').offset().top);
	}

	function editComment(no) {
		$.ajax({
			url : 'delComment.do',
			type : 'post',
			dataType : 'json',
			data : {
				no : no
			},
			success : function(data) {
				scrolled('#comment-content');
			}
		});
	}

	function delComment(no) {
		$.ajax({
			url : 'delComment.do',
			type : 'post',
			dataType : 'json',
			data : {
				no : no
			},
			success : function(data) {
				scrolled('#post-comment');
			}
		});
	}

	function ht() {
		$.ajax({
			url : 'like.do',
			dataType : 'json',
			data : {
				no : $(this).attr('no'),
				postNo : '${post.no}'
			},
			success : function(data) {
				if (data > 0)
					$('.htBtn').attr('class', 'ht liked');
				else
					$('.htBtn').attr('class', 'ht');
				$('.htBtn').attr('no', data);
			}
		});
	}

	function paging(no) {
		$('[name="scroll"]').val($('#post-comment').offset().top);
		$('#cPageForm').attr('action', 'post?no=${post.no }&page=' + no);
		$('#cPageForm').submit();
	}

	function scrolled(id) {
		location.reload();
		showComment();
		$(document).scrollTop($(id).offset().top);
	}

	function report() {
		var title = $('#report-title').val().trim();
		var content = $('#report-content').val().trim();
		var email = $('#report-email').val().trim();

		console.log(title);
		console.log(content);
		console.log(email);
		if (title == '') {
			$('#report-title').focus();
		} else if (content == '') {
			$('#report-content').focus();
		} else if (email == '') {
			$('#report-email').focus();
		} else if (!validateEmail(email)) {
			
		} else {
			$.ajax({
				type: 'post',
				url:'report.do',
				dataType: 'json',
				data:{
					title:title,
					content:content,
					email:email,
					postNo:'${post.no}',
					userNo:'${accessor.no}'
				},
				success:function(data){
					$('#reportForm').css('display', 'none');
					if(data=='success')
						$('.notice h4').text('접수되었습니다.');
					else
						$('.notice h4').text('접수 도중 오류가 발생했습니다.');
					notice('none');
					resetReportForm();
				}
			});
		}
	}

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