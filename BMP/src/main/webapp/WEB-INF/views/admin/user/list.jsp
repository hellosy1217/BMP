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
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
	border: 0;
	background: transparent;
	font-size: 15px;
	font-weight: 500;
	font-family: 'Noto Sans KR', sans-serif;
}

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

input::placeholder {
	color: #a8aebb;
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

#filter-left #changeBtn>div {
	display: inline-flex;
	border-radius: 4px;
	position: relative;
	justify-content: space-between;
	padding: 6px 11px 5px 9px;
	font-size: 12px;
	background: white;
	border: 1px solid #e0e0e0;
	min-width: 36px;
}

#filter-left #changeBtn>div:hover {
	cursor: pointer;
}

#filter-left #changeBtn p {
	font-size: 13px;
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

.select p {
	font-size: 13px;
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

.select ul>li, #search_result>li {
	padding: 5px 16px;
	font-size: 13px;
}

.select ul>li:hover, #search_result>li:hover {
	cursor: pointer;
}

.selected {
	background: #f0e3fe;
	color: #19345e;
}

.nonehover:hover {
	background: unset !important;
	cursor: unset !important;
}

#sort-dropdown, #searchFilter-dropdown {
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

#sort-dropdown li, #searchFilter-dropdown li {
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
	width: 190px;
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
	padding: 15px 10px !important;
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
				<div id="filter-left">
					<div id="changeBtn">
						<div><p>회원</p></div>
					</div>
					<div class="select">
						<p id="sort">${listInfo.sort }</p>
						<p>⌵</p>
						<ul id="sort-dropdown">
							<li id="New">가입순</li>
							<li id="Name">이름순</li>
							<li id="Like">인기순</li>
						</ul>
					</div>
				</div>
				<form  action="/bmp/admin/user" method="get">
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
							<td>닉네임</td>
							<td>이메일</td>
							<td>팔로워</td>
							<td>팔로우</td>
							<td>포스트</td>
							<td>구독</td>
							<td>가입일</td>
						</tr>
						<c:forEach items="${uList }" var="user">
							<tr class="check" no="${user.no }">
								<td class="nickname"><p>${user.nickname }</p></td>
								<td><p>
										<c:choose>
											<c:when test="${user.confirm eq 'N'.charAt(0) }">
												<span class="confirm_none">${user.email }</span>
											</c:when>
											<c:otherwise>
												<span>${user.email }</span>
											</c:otherwise>
										</c:choose>
									</p></td>
								<td>${user.follower }</td>
								<td>${user.follow }</td>
								<td>${user.post }</td>
								<td>${user.sub }</td>
								<td>${user.regDate }</td>
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
	$(document).on('click', '.select', function() {
		if ($(this).children('ul').css('display') == 'none') {
			$(this).children('ul').show();
		} else {
			$(this).children('ul').hide();
		}
	});

	$(document).on('click', '#searchFilter_dropdown li', function() {
		var filter = $(this).text();
		$('#searchFilter').text(filter);
		$('#form_filter').val(filter);

		selectbox();
	});

	$(document).on('click', '#changeBtn>div', function() {
		var text = $('#changeBtn>div p').text();
		var sort = $('#sort').text();
		var keyword = '${keyword}';
		var filter = '${filter}';

		var url = null;

		if (text == '관리자') {
			url = 'uList.admin';
		} else {
			url = 'aList.admin';
		}

		location.href = url;
	});

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

	$('.check').on('mouseover', function() {
		$(this).children('td').css('background', '#f0e3fe91');
	}).on('mouseout', function() {
		$(this).children('td').css('background', '');
	}).on('click', function() {
		var td = $(this).children('td');
		if ($(this).attr('class') == 'check')
			$(this).attr('class', 'check checked');
		else
			$(this).attr('class', 'check');
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

	$(function() {
		selectbox();

		/* $(document).contextmenu(
				function(e) {
					var selectCount = $('.checked').length;
					if (selectCount > 0) {
						//Get window size:
						var winWidth = $(document).width();
						var winHeight = $(document).height();
						//Get pointer position:
						var posX = e.pageX;
						var posY = e.pageY;
						//Get contextmenu size:
						var menuWidth = $(".contextmenu").width();
						var menuHeight = $(".contextmenu").height();
						//Security margin:
						var secMargin = 10;
						//Prevent page overflow:
						if (posX + menuWidth + secMargin >= winWidth
								&& posY + menuHeight + secMargin >= winHeight) {
							//Case 1: right-bottom overflow:
							posLeft = posX - menuWidth - secMargin + "px";
							posTop = posY - menuHeight - secMargin + "px";
						} else if (posX + menuWidth + secMargin >= winWidth) {
							//Case 2: right overflow:
							posLeft = posX - menuWidth - secMargin + "px";
							posTop = posY + secMargin + "px";
						} else if (posY + menuHeight + secMargin >= winHeight) {
							//Case 3: bottom overflow:
							posLeft = posX + secMargin + "px";
							posTop = posY - menuHeight - secMargin + "px";
						} else {
							//Case 4: default values:
							posLeft = posX + secMargin + "px";
							posTop = posY + secMargin + "px";
						}
						//Display contextmenu:
						$(".contextmenu").css({
							"left" : posLeft,
							"top" : posTop
						}).show();
						//Prevent browser default contextmenu.
						return false;
					}
				});
		//Hide contextmenu:
		$(document).click(
				function(e) {
					$('.contextmenu').hide();
					if ($(e.target).parent('div').attr('class') != 'select'
							&& $(e.target).attr('class') != 'select')
						$('.select').children('ul').hide();
				});*/
	});

	function selectbox() {
		var sort = $('#sort').text();

		if (sort == '가입순')
			$('#New').attr('class', 'selected');
		else if (sort == '이름순')
			$('#Name').attr('class', 'selected');
		else
			$('#Like').attr('class', 'selected');

		var searchFilter = $('#searchFilter').text();
		if (searchFilter == '닉네임') {
			$('#Nickname').attr('class', 'selected');
			$('#Email').attr('class', '');
		} else {
			$('#Email').attr('class', 'selected');
			$('#Nickname').attr('class', '');
		}

		$('#form_sort').val(sort);
		$('#form_filter').val(searchFilter);
	}
</script>
</html>