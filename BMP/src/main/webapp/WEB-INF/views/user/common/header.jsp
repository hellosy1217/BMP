<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	font-family: "Haas Grot Text R Web", "Helvetica Neue", Helvetica, Arial,
		sans-serif;
}

::selection {
	background: #ea4c89;
	color: rgba(255, 255, 255, 0.85);
}

body {
	color: #444;
}

img {
	object-fit: cover;
}

#header-inner {
	background: rgba(47, 47, 47, 0.98);
	margin: 0 auto;
	padding: 0 30px;
	display: flex;
	justify-content: space-between;
}

#logo {
	float: left;
	margin: 15px 0;
	width: 130px;
}

#logo a {
	color: #fff;
	font-weight: 800;
	font-size: 19px;
}

#logo a:hover {
	cursor: pointer;
	color: #e1e1e1;
}

#nav {
	display: flex;
	color: #777;
	width: calc(100% - 130px);
	display: flex;
	justify-content: flex-end;
	display: flex;
}

#nav>li>a {
	color: #999;
	display: block;
	font-size: 15px;
	height: 56px;
	line-height: 56px;
	padding: 0 10px;
	text-decoration: none;
}

#nav>li>a:hover {
	color: #e1e1e1;
}

#nav li#t-search {
	padding-top: 15px;
	padding-left: 10px;
	position: relative;
}

input.search-text {
	background-color: #fff;
	border: none;
	border-radius: 4px;
	color: #444;
	font-size: 13px;
	padding: 5px 15px;
	width: 190px;
	outline: none;
}

input::-ms-reveal {
	display: none;
	width: 0;
	height: 0;
}

input::-webkit-search-decoration, input::-webkit-search-cancel-button,
	input::-webkit-search-results-button, input::-webkit-search-results-decoration
	{
	display: none;
}

#search-result {
	position: absolute;
	top: 45px;
	background: white;
	border-radius: 4px;
	width: calc(100% - 10px);
	z-index: 4;
	box-shadow: 0 1px 2px rgb(0 0 0/ 7%);
	font-size: 13px;
	padding: 5px 0;
	display: none;
}

#search-result li {
	display: flex;
	min-width: 148px;
	align-items: center;
	padding: 3px 10px;
}

#search-result li:hover {
	background: #f4f4f4;
	cursor: pointer;
}

#search_result p {
	display: flex;
	align-items: center;
	font-size: 12px;
	color: #6d6d7f;
}

.search-pr {
	padding-right: 10px;
	display: flex;
}

#search-result img {
	width: 20px;
	height: 20px;
	border-radius: 50%;
}

.noneover {
	padding: 4px 10px 4px 10px !important;
}

.nonehover:hover {
	background: unset !important;
	cursor: unset !important;
}

.filter {
	background: #fbfbfb;
	border-bottom: 1px solid #e5e5e5;
	position: relative;
	width: 100%;
	display: flex;
	justify-content: center;
	height: 51px;
}

#filter-inner {
	padding: 12px 30px;
	display: flex;
	position: relative;
	width: 100%;
	justify-content: center;
}

#filter-inner>ul {
	display: flex;
}

#filter-inner>ul:first-child li {
	padding: 5px 70px;
	font-size: 13px;
	font-weight: bold;
}

#filter-inner>ul:first-child li:hover {
	cursor: pointer;
	color: #444c;
}

.filter-right {
	display: inline-flex;
	height: fit-content;
	position: absolute;
	right: 0;
	padding-right: 30px;
}

#post-btn {
	background: #ea4c89;
	border-radius: 4px;
	color: #fff;
	font-weight: bold;
	line-height: 17px;
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 5px 12px;
	font-size: 13px;
}

#post-btn:hover {
	background: #dd417c;
	cursor: pointer;
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
	margin-left: 10px;
	min-width: 52px;
}

.select:hover {
	cursor: pointer;
}

.select>p:nth-child(2) {
	margin-top: -2px;
	padding-left: 8px;
}

.selected {
	color: #ea4c89;
	background: #f4f4f4;
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

#t-profile {
	padding: 14px 5px 0px 50px;
	position: relative;
}

#t-profile img {
	width: 26px;
	height: 26px;
	border-radius: 50%;
}

#t-profile img:hover {
	cursor: pointer;
	filter: brightness(0.95);
}

#profile-dropdown {
	position: absolute;
	width: calc(100% - 10px);
	z-index: 4;
	display: none;
	padding: 5px 0;
	top: 40px;
}

#profile-dropdown ol {
	background: white;
	border-radius: 4px;
	box-shadow: 0 1px 2px rgb(0 0 0/ 7%);
	font-size: 13px;
	padding: 6px 0 4px 0;
	flex-direction: column;
}

#profile-dropdown li {
	align-items: center;
	padding: 3px 10px;
}

#profile-dropdown li:hover {
	background: #f4f4f4;
	cursor: pointer;
}

.tab-selected {
	background: rgba(58, 139, 187, 0.15);
	color: #3a8bbb;
}
</style>
</head>
<body>
	<div id="header">
		<div id="header-inner">
			<div id="logo">
				<a href="explorer">Blog My Pet</a>
			</div>
			<ul id="nav" role="navigation">
				<c:choose>
					<c:when test="${accessor eq null }">
						<li id="t-signup"><a href="signUp">Sign up</a></li>
						<li id="t-signin"><a href="signIn">Sign in</a></li>
					</c:when>
					<c:otherwise>
						<li id="t-profile"><img
							src="https://i.pinimg.com/736x/63/a1/e8/63a1e82490841a1022595197bd7ac835.jpg">
							<div id="profile-dropdown">
								<ol>
									<li>내 블로그</li>
									<li>로그아웃</li>
								</ol>
							</div></li>
					</c:otherwise>
				</c:choose>
				<li id="t-search" role="search">
					<div id="search">
						<input class="search-text" type="search" placeholder="Search "
							value="">
					</div>
					<ul id="search-result">
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<c:if test="${listInfo.paging ne null}">
		<div class="filter">
			<div id="filter-inner">
				<c:if test="${isBlog ne null and accessor.no eq no}">
					<ul id="blog-tab">
						<li>포스트</li>
						<li>좋아요</li>
						<li>보관함</li>
					</ul>
				</c:if>
				<div class="filter-right">
					<a id="post-btn" href="write">✎&nbsp;Post&nbsp;</a>
					<div class="select">
						<p id="sort">${listInfo.sort }</p>
						<p id="sort-menu">⌵</p>
						<ul id="sort-dropdown">
							<li id="Like">인기순</li>
							<li id="View">조회순</li>
							<li id="New">최신순</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</body>
<script>
	$(document)
			.on(
					'keyup paste change',
					'.search-text',
					function() {
						var keyword = $('.search-text').val();
						if (keyword != null && keyword != '') {
							var filter = '닉네임';
							if (keyword.charAt(0) == '#')
								filter = '태그';
							$
									.ajax({
										url : 'search',
										data : {
											filter : filter,
											keyword : keyword
										},
										success : function(data) {
											var str = '';
											if (data == null
													|| data.length == 0) {
												str += ('<li class="nonehover"><p>검색 결과가 없습니다.</p></li>');
											} else {
												if (keyword.charAt(0) == '#') {
													for (var i = 0; i < data.length; i++) {
														str += ('<li><p>'
																+ data[i] + '</p></li>');
													}
												} else {
													for (var i = 0; i < data.length; i++) {
														str += ('<li no="'+data[i].no+'"><p class="search-pr"><img src="https://t1.daumcdn.net/liveboard/holapet/7dd0ffdc19294528b5de0ffb31829366.JPG"></p><p>'
																+ data[i].nickname + '</p></li>');
													}
												}
											}
											$('#search-result').html(str);
											$('#search-result').show();
										}
									});
						} else {
							$('#search-result').hide();
							$('#search-result').html('');
						}
					});

	$(document).on('click', '#search-result li', function() {
		var text = $('.search-text').val();
		var keyword;
		var url;
		if (text.charAt(0) != '#') {
			keyword = $(this).attr('no');
			url = 'blog?no=' + keyword;
		} else {
			keyword = $(this).text();
			keyword = keyword.substring(1, keyword.length);
			url = 'explorer?keyword=' + keyword;
		}
		location.href = url;
	});

	$(document).on('click', '.select', function() {
		if ($(this).children('ul').css('display') == 'none') {
			$(this).children('ul').show();
		} else {
			$(this).children('ul').hide();
		}
	});

	$(document).on('click', '#sort-dropdown li', function() {
		var sort = $(this).text();
		var keyword = '${listInfo.keyword}';
		var url = '${loc}?sort=' + sort;
		if (keyword != '')
			url += '&keyword=' + keyword;
		location.href = url;
	});

	$(document).on('mouseover', '#t-profile img', function() {
		$('#profile-dropdown').show();
	});

	$(document).on('mouseout', '#t-profile img', function() {
		$('#profile-dropdown').hide();
	});

	$(document).on('mouseover', '#profile-dropdown', function() {
		$('#profile-dropdown').show();
	});

	$(document).on('mouseout', '#profile-dropdown', function() {
		$('#profile-dropdown').hide();
	});

	$(document)
			.ready(
					function(e) {
						selectbox();
						$(document)
								.click(
										function(e) {
											if ($(e.target).parent('div').attr(
													'class') != 'select'
													&& $(e.target)
															.attr('class') != 'select')
												$('.select').children('ul')
														.hide();
											$('#search-result').hide();

										});
					});

	function selectbox() {
		var sort = $('#sort').text();
		if (sort == '인기순')
			$('#Like').attr('class', 'selected');
		else if (sort == '조회순')
			$('#View').attr('class', 'selected');
		else
			$('#New').attr('class', 'selected');
		$('#form_sort').val(sort);
		var menu = $('#blog-tab li').eq(1).text();
		
		if('${blog-tab}'!=null){
			var menu = $('#blog-tab li').eq(${blog-tab});
			menu.attr('class','tab-selected');
		}
	}
</script>
</html>