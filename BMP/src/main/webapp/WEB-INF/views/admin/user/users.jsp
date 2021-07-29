<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	padding-left: 269px;
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
	justify-content: space-between;
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

.btns {
	display: inline-flex;
	border-radius: 4px;
	position: relative;
	justify-content: space-between;
	padding: 7px 11px 4px 9px;
	font-size: 12px;
	background: white;
	border: 1px solid #e0e0e0;
	min-width: 36px;
	justify-content: center;
	cursor: pointer;
	margin-right: 5px;
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

#search {
	padding-left: 5px;
	position: relative;
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

.confirm-none {
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

.userInfo:hover {
	cursor: pointer;
}

.userInfo span {
	display: flex;
	align-items: center;
	justify-content: center;
}

.userInfo span>a {
	background: #4285f4;
	color: #fff;
	padding: 0 5.3px 2px;
	border-radius: 4px;
	margin-right: 5px;
}

#checkBox>div {
	display: flex;
	align-items: center;
}

#checkBox input {
	display: none;
}

#checkBox label {
	padding: 9px;
	background: #fff;
	border-radius: 4px;
	cursor: pointer;
	border: 1px solid #e0e0e0;
}

#checkBox p {
	margin-left: 7px;
	font-size: 15px;
	margin-top: 3px;
}

#checkBox input[type="checkbox"]:checked+label {
	padding: 3px 5.15px 0px !important;
	font-family: serif;
	color: #b9b9b9;
}

#bottom-btns {
	display: flex;
	justify-content: space-between;
}

.notice {
	position: fixed;
	background: white;
	color: #333;
	border-radius: 4px;
	left: calc(50% - 60px);
	top: calc(50% - 100px);
	box-shadow: 0px 10px 70px rgb(0 0 0/ 15%);
	font-size: 10px;
	padding: 21px 20px 19px;
	display: none;
	transition: opacity 2000ms;
	opacity: 0;
	flex-direction: column;
	align-items: center
}

.notice h4 {
	font-weight: 500;
	font-size: 14px;
}

.notice div {
	display: flex;
	padding-top: 10px;
}

.notice a {
	border-radius: 4px;
	width: max-content;
	text-align: center;
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 4px 12px 3px;
	font-size: 12px;
	width: max-content;
	margin: 0 2.5px;
	cursor: pointer;
}

#delete-cancel {
	background: #ddd;
	color: #929292;
}

#delete-submit {
	background: rgb(63, 140, 185);
	color: #fff;
}
</style>
</head>
<body>
	<c:import url="../common/navigation.jsp" />
	<div id="body">
		<div id="container">
			<div class="filter">
				<div id="filter-left">
					<div id="changeBtn">
						<c:choose>
							<c:when test="${listInfo.sort eq 'admin' }">
								<a class="btns">회원</a>
							</c:when>
							<c:otherwise>
								<a class="btns">관리자</a>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="select">
						<c:choose>
							<c:when test="${listInfo.sort eq 'admin' }">
								<p id="sort">인기순</p>
							</c:when>
							<c:otherwise>
								<p id="sort">${listInfo.sort }</p>
							</c:otherwise>
						</c:choose>
						<p>⌵</p>
						<ul id="sort-dropdown">
							<li id="New">가입순</li>
							<li id="Name">이름순</li>
							<li id="Follow">인기순</li>
						</ul>
					</div>
				</div>
				<form action="/bmp/admin/users" method="get">
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
							<td>닉네임</td>
							<td>이메일</td>
							<td>팔로우</td>
							<td>팔로워</td>
							<td>포스트</td>
							<td>구독</td>
							<td>가입일</td>
						</tr>
						<c:forEach items="${list }" var="user">
							<tr class="userInfo" no="${user.no }">
								<td id="checkBox">
									<div>
										<input type="checkbox" id="checkbox${user.no }"
											value="${user.no }"><label class=""
											for="checkbox${user.no }"></label>
									</div>
								</td>
								<td class="nickname"><p>${user.nickname }</p></td>
								<td><p>
										<c:choose>
											<c:when test="${fn:contains(user.email,'google:')}">
												<span><a>g</a> <c:out
														value="${fn:substring(user.email,7,fn:length(user.email)) }" /></span>
											</c:when>
											<c:otherwise>
												<span>${user.email }</span>
											</c:otherwise>
										</c:choose>
									</p></td>
								<td>${user.follow }</td>
								<td>${user.follower }</td>
								<td>${user.post }</td>
								<td>${user.sub }</td>
								<td>${user.regDate }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="bottom-btns">
				<div>
					<a class="btns" id="checkAllBtn">전체 선택</a><a class="btns"
						id="deleteBtn">선택 삭제</a><a class="btns" id="mailBtn">메일 전송</a>
				</div>
				<div>
					<c:import url="../../common/paging.jsp" />
				</div>
			</div>
		</div>
	</div>
	<div class="notice">
		<h4>선택한 회원을 삭제하시겠습니까?</h4>
		<div>
			<a id="delete-cancel">취소</a><a id="delete-submit">확인</a>
		</div>
	</div>
</body>
<script>
	$(document).on('change', 'input[type=checkbox]', function() {
		var id = 'label[for="' + $(this).attr('id') + '"]';
		if ($(this).prop('checked'))
			$(id).text('✓');
		else
			$(id).text('');
	});

	/* $('.userInfo').on('click', function() {
		var no = $(this).attr('no');
		console.log(no);

	});
	 */
	$('#checkAllBtn').on('click', function() {
		var id = $('input[type=checkbox]');
		var checked = $('input[type=checkbox]:checked').length;
		if (checked == 15) {
			id.prop('checked', false);
			$('#table label').text('');
		} else {
			id.prop('checked', true);
			$('#table label').text('✓');
		}
	});

	$('.select').on('click', function() {
		if ($(this).children('ul').css('display') == 'none') {
			$(this).children('ul').show();
		} else {
			$(this).children('ul').hide();
		}
	});

	$('#changeBtn>a').on('click', function() {
		console.log($(this).text());
		if ($(this).text() == '회원')
			location.href = '/bmp/admin/users';
		else
			location.href = '/bmp/admin/users?sort=admin'
	});

	$('#paging p').on('click', function() {
		var classname = $(this).attr('class');

		if (classname != 'numBtn noneselect') {
			var page = $(this).attr('no');
			var sort = $('#sort').text();
			var keyword = '${keyword}';
			var filter = '${filter}';

			var url = '/bmp/admin/users?page=' + page;
			if (keyword != null && keyword != '')
				url += ('&keyword=' + keyword);

			location.href = url;
		}
	});

	$('#deleteBtn').on('click', function() {
		if ($('input[type=checkbox]:checked').length > 0) {
			$('.notice').css({
				'display' : 'flex',
				'opacity' : '100'
			});
		}
	});

	$('#delete-cancel').on('click', function() {
		$('.notice').css('opacity', '0');
		setTimeout(function() {
			$('.notice').css('display', 'none');
		}, 2000);

	});

	$('#delete-submit').on('click', function() {
		var users = [];
		$('input[type=checkbox]:checked').each(function() {
			var user = $(this).val();
			users.push(user);
		});
		$.ajax({
			url : 'delUsers.do',
			data : {
				users : users
			},
			success : function(data) {
				console.log(data);
				location.reload(true);
			}
		});
	});

	$(document).on('click', '#sort-dropdown li', function() {
		var sort = $(this).text();
		var keyword = '${listInfo.keyword}';
		var url = '/bmp/admin/users?sort=' + sort;
		if (keyword != '')
			url += '&keyword=' + keyword;
		location.href = url;
	});

	$(function() {
		selectbox();
	});

	function selectbox() {
		var sort = $('#sort').text();

		if (sort == '가입순')
			$('#New').attr('class', 'selected');
		else if (sort == '이름순')
			$('#Name').attr('class', 'selected');
		else
			$('#Follow').attr('class', 'selected');

		$('#form_sort').val(sort);
	}
</script>
</html>