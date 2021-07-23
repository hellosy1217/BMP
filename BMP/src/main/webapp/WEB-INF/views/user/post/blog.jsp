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
<script src="<c:url value="/resources/js/CommonJS.js"/>"></script>
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

#body {
	display: flex;
}

.filter {
	background: #fbfbfb;
	border-bottom: 1px solid #e5e5e5;
	position: relative;
	width: 100%;
	display: flex;
	justify-content: center;
}

.blog {
	background-color: #f4f4f4;
	min-height: 500px;
	display: flex;
}

.blog-right {
	padding: 30px 40px 30px 270px;
	width: calc(100% - 350px);
}

.blog-right ol {
	display: grid;
	grid-gap: 30px;
	grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
}

.blog-left {
	padding: 30px 0 30px 40px;
}

#notice {
	text-align: center;
	padding-top: 100px;
}

#notice p {
	font-size: 15px;
}

#notice p:first-child {
	font-size: 20px !important;
	font-weight: 700;
	padding-bottom: 10px;
}

#reportForm {
	position: fixed;
	background: white;
	flex-direction: column;
	top: 50%;
	left: 50%;
	z-index: 6;
	border-radius: 4px;
	box-shadow: 0 1px 2px rgb(0 0 0/ 7%);
	width: 432.73px;
	height: 355px;
	margin: -177.5px 0 0 -216.365px;
	display: none;
}

#reportForm textarea {
	resize: none;
}

#reportForm>div:first-child {
	background: #333;
	color: white;
	border-radius: 4px 4px 0 0;
	padding: 6px 10px 4px;
}

#reportForm form {
	padding: 10px;
	display: flex;
	flex-direction: column;
}

#reportForm textarea, #reportForm input {
	outline: none;
	background: #fff;
	border: 1px solid #e0e0e0;
	width: calc(100% - 10px);
	padding: 6px 5px 4px;
	font-size: 13px;
	width: calc(100% - 10px);
}

#reportForm textarea {
	min-height: 80px;
}

#reportForm p {
	padding: 3px 0;
	font-size: 14px;
}

#reportForm span {
	font-size: 11px;
	opacity: 90%;
}

#reportForm form>div {
	padding-bottom: 5px;
}

#form-btn {
	display: flex;
	justify-content: flex-end;
}

#form-btn a {
	border-radius: 4px;
	color: #fff;
	font-weight: bold;
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 5.5px 12px 4.5px;
	font-size: 13px;
	cursor: pointer;
}

#form-btn #cancelBtn {
	background: #c1c1c1;
	margin-right: 10px;
}

#form-btn #cancelBtn:hover {
	background: #b1b1b1;
}

#form-btn #submitBtn {
	background: #ea4c89;
}

#form-btn #submitBtn:hover {
	background: #dd417c;
}

.notice {
	position: fixed;
	background: white;
	color: #333;
	border-radius: 4px;
	left: calc(50% - 60px);
	top: calc(50% - 100px);
	box-shadow: 0 1px 2px rgb(0 0 0 / 7%);
	font-size: 10px;
	padding: 21px 20px 19px;
	display: none;
	transition: opacity 2000ms;
	opacity: 0;
	z-index: 10;
}

.notice h4 {
	font-weight: 500;
	font-size: 14px;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<div id="container">
		<input type="hidden" id="page" value="${paging.currentPage }">
		<div class="blog">
			<div class="blog-left">
				<c:import url="../user/profile.jsp" />
			</div>
			<div class="blog-right">
				<c:choose>
					<c:when
						test="${profile.blockInfo!=null and profile.blockInfo.no>0 }">
						<div id="notice">
							<p>${profile.nickname }님은차단되어있습니다.</p>
							<p>차단을 해제해야 ${profile.nickname } 님의 포스트를 볼 수 있습니다.</p>
							<p>"Blocked" 버튼을 탭해 차단을 해제해주세요.</p>
						</div>
					</c:when>
					<c:when test="${profile.blocked > 0}">
						<div id="notice">
							<p>${profile.nickname }님이나를차단했습니다.</p>
							<p>${profile.nickname }님을팔로우하거나</p>
							<p>${profile.nickname }님의포스트를볼수없습니다.</p>
						</div>
					</c:when>
					<c:when
						test="${profile.userPrivate=='Y'.charAt(0) and profile.followInfo==null and (accessor==null||profile.no!=accessor.no)}">
						<div id="notice">
							<p>이 블로그는 비공개 설정 되어 있습니다.</p>
							<p>승인된 팔로워만 ${profile.nickname } 님의 포스트를 볼 수 있습니다.</p>
							<p>"Follow" 버튼을 탭해 팔로우 요청을 보내세요.</p>
						</div>
					</c:when>
					<c:when test="${list != null }">
						<c:import url="list.jsp" />
					</c:when>
					<c:when test="${fList != null }">
						<c:import url="../user/follow.jsp" />
					</c:when>
					<c:otherwise>
						<c:import url="post.jsp" />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<c:if test="${post ne null and accessor ne null}">
			<div id="reportForm">
				<div>report</div>
				<form>
					<div>
						<p>제목</p>
						<input type="text" name="title" value="포스트 신고합니다."
							id="report-title">
					</div>
					<div>
						<p>설명</p>
						<textarea name="content" id="report-content"></textarea>
						<span>*위의 항목은 필수 사항입니다. 꼭! 모든 항목을 작성해주세요.</span>
					</div>
					<div>
						<p>이메일</p>
						<input type="email" name="email" value="${accessor.email }"
							id="report-email"> <span>답변 받으실 이메일을 입력해주세요.</span>
					</div>
					<div id="form-btn">
						<a id="cancelBtn">취소</a> <a id="submitBtn">전송</a>
					</div>
				</form>
			</div>
		</c:if>
		<div class="notice">
			<h4></h4>
		</div>
	</div>
</body>
<script>
	$(document).on('mouseover', '.contents', function() {
		$(this).children('.post_content').css({
			'opacity' : '100',
			'visibility' : 'visible'
		});
	}).on('mouseout', '.contents', function() {
		$(this).children('.post_content').css('opacity', '0');
		setTimeout(function() {
			$(this).children('.post_content').css('visibility', 'hidden');
		}, 300);
	});

	$('#cancelBtn').on('click', function() {
		$('#reportForm').attr('display', 'none');
	});

	$(function() {
		setTimeout(function() {
			scrollTo(0, 0);
		}, 100);
	});
	
	function resetReportForm(){
		$('#report-title').val('포스트 신고합니다.');
		$('#report-content').val('');
		$('#report-email').val('${accessor.email}');
	}
</script>
</html>