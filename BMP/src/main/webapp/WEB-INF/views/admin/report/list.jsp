<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog My Pet</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
html, body {
	height: 100%;
}

#body {
	display: flex;
	padding-left: 291.36px;
	background: #f4f4f4;
}

#container {
	width: 100%;
	height: max-content;
	display: flex;
	padding: 40px 30px 30px 30px;
	flex-direction: column;
}

.filter {
	display: flex;
	justify-content: flex-end;
	padding-bottom: 10px;
}

.filter>#form {
	display: inline-flex;
	justify-content: flex-end;
	float: right;
}

#filter-left {
	display: flex;
}

#filter-left #changeBtn>div {
	display: inline-flex;
	border-radius: 4px;
	position: relative;
	justify-content: space-between;
	padding: 7px 11px 4px 9px;
	font-size: 12px;
	background: white;
	border: 1px solid #e0e0e0;
	min-width: 36px;
}

#filter-left #changeBtn>div:hover {
	cursor: pointer;
}

#filter-left #changeBtn p {
	margin: 0 auto;
}

.select {
	display: inline-flex;
	border-radius: 4px;
	position: relative;
	justify-content: space-between;
	padding: 7px 10px 4px;
	font-size: 12px;
	background: white;
	border: 1px solid #e0e0e0;
	margin-left: 5px;
	min-width: 52px;
}

.select:hover {
	cursor: pointer;
}

.select>p:nth-child(2) {
	margin-top: -2px;
	padding-left: 8px;
}

.select ul, #search_result {
	display: none;
	flex-direction: column;
	background: white;
	border-radius: 4px;
	position: absolute;
	z-index: 2;
	width: fit-content;
	padding: 5px 0;
	color: #a8aebb;
	border: 1px solid #f0f3f6;
}

.select ul>li:hover, #search_result>li:hover {
	cursor: pointer;
}

.selected {
	color: rgb(63, 140, 185);
	background: #f4f4f4;
}

.nonehover:hover {
	background: unset !important;
	cursor: unset !important;
}

#sort-dropdown {
	position: absolute;
	left: 0px;
	top: 30px;
	background: white;
	border: 1px solid #e0e0e0;
	border-radius: 4px;
	width: -webkit-fill-available;
	padding: 5px 0;
	z-index: 3;
	display: none;
}

#sort-dropdown li {
	padding: 4px 10px 2px 10px;
}

#sort-dropdown li:hover {
	cursor: pointer;
	background: #f4f4f4;
}


#search input {
	background-color: #fff;
	border: none;
	border-radius: 4px;
	color: #444;
	font-size: 13px;
	padding: 5.5px 15px 4.5px;
	width: 150px;
	outline: none;
	border: 1px solid #e0e0e0;
}

#search input:focus, #search input:hover {
	outline: none;
}

#search_result {
	opacity: 0;
	top: 45px;
	display: none;
	transition: display 200ms, opacity 500ms;
	background: rgb(251, 252, 253);
}

#search_result>li {
	display: flex;
	min-width: 148px;
	align-items: flex-start;
}

#search_result p {
	display: flex;
	align-items: center;
	font-size: 13px;
	color: #6d6d7f;
}

.search_pr {
	padding-right: 10px;
}

#list {
	width: 100%;
	height: 100%;
	padding-bottom: 10px;
}

#list>#table {
	background: white;
	border-radius: 4px;
	padding: 0 20px 15px 20px;
	border: 1px solid #e0e0e0;
	font-size: 13px;
}

#list>#table table {
	padding: 10px 0px;
	width: 100%;
	border-collapse: collapse;
	text-align: center;
}

#list>#table tr {
	padding: 0 30px;
}

#list>#table tr:first-child td {
	border-right: 1px solid transparent !important;
}

#list>#table tr:last-child td {
	border-bottom: 1px solid transparent !important;
}

#list>#table td {
	padding: 10px 10px 9px;
}

#list>#table tr:first-child td {
	background: none !important;
	border-bottom: 1px solid #e5e5e5;
	padding: 16px 10px 14px !important;
}

#list>#table tr:nth-child(odd) td {
	background: #f9f9f9;
}

#list>#table td:first-child {
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
}

#list>#table td:last-child {
	border-right: 1px solid transparent !important;
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
}

#list>#table p {
	display: flex;
	flex-direction: column;
}

.confirm_none {
	color: rgb(240, 115, 110);
}

.check td {
	transition: background 100ms;
}

.checked td {
	background: #f0e3fec4 !important;
}

#dialog {
	position: fixed;
	background: pink;
	left: calc(50% - 60px);
	top: calc(50% - 60px);
	width: unset !important;
	z-index: 2;
	border-radius: 4px;
	background: white;
	box-shadow: 0px 10px 70px rgb(0 0 0/ 15%);
	padding: 20px;
	display: none;
	transition: opacity 2000ms;
	opacity: 0;
	flex-direction: column;
	align-items: center;
}

.contextmenu {
	display: none;
	flex-direction: column;
	position: absolute;
	margin: 0;
	background: white;
	border-radius: 4px;
	overflow: hidden;
	z-index: 3;
	border: 1px solid #f0f3f6;
}

.contextmenu ul {
	color: #a8aebb;
	width: fit-content;
	padding: 5px 0;
}

.contextmenu li {
	padding: 5px 16px;
	font-size: 13px;
}
</style>
</head>
<body>
	<c:import url="../common/navigation.jsp" />
	<div id="body">
		<div id="container">
			<div class="filter">
				<form action="/bmp/admin/user" method="get">
					<div id="search">
						<input placeholder="검색" value="${keyword }" id="keyword"
							name="keyword">
						<ul id="search-result">
						</ul>
					</div>
				</form>
			</div>
			<div id="list">
				<div id="table">
					<table>
						<tr>
							<td></td>
							<td>제목</td>
							<td>작성자</td>
							<td>상태</td>
							<td>등록일</td>
						</tr>
						<c:forEach items="${rList }" var="list">
							<tr no="${list.no }">
								<td><input type="checkbox"></td>
								<td><p>${list.title }</p></td>
								<td>${list.nickname }</td>
								<c:choose>
									<c:when test="${list.commDate eq null }">
										<td>답변대기</td>
									</c:when>
									<c:otherwise>
										<td>답변완료</td>
									</c:otherwise>
								</c:choose>
								<td>${list.regDate }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="contextmenu">
					<ul>
						<li><a href="#">상세보기</a></li>
						<li><a href="#">삭제</a></li>
					</ul>
				</div>
			</div>
			<c:import url="../../common/paging.jsp" />
		</div>
	</div>
	<div id="dialog"></div>
</body>
<script>
	$(document).on('click', '#paging p', function() {
		var classname = $(this).attr('class');

		if (classname != 'numBtn noneselect') {
			var page = $(this).attr('no');
			var sort = $('#sort').text();
			var keyword = '${keyword}';
			var filter = '${filter}';

			var url = '/bmp/admin/user?page=' + page;
			if (keyword != null && keyword != '')
				url += ('&keyword=' + keyword);

			location.href = url;
		}
	});

	$(document)
			.on(
					'click',
					'#btn button',
					function() {
						var selectCount = $('.checked').length;
						if (selectCount > 0) {
							var str = "";
							var userNo = new Array(selectCount);
							for (var i = 0; i < selectCount; i++) {
								str += ('<p>'
										+ $('.checked .nickname>p').eq(i)
												.text() + '</p>')
								userNo[i] = $('.checked').eq(i).attr('no');
							}
							str += '<p>회원을 삭제하시겠습니까?</p>'
							$('#dialog').css({
								'display' : 'flex',
								'opacity' : '100'
							});

							$('#dialog').html(str);
							// ajax 회원 삭제 만들기
						}
					});
</script>
</html>