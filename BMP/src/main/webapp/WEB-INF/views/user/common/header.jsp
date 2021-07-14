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
	font-family: sans-serif;
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
	font-size: 21px;
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
	font-size: 16px;
	height: 56px;
	line-height: 56px;
	padding: 0 10px;
	text-decoration: none;
}

#nav>li>a:hover {
	color: #e1e1e1;
}

#nav li#t-search {
	padding-top: 13px;
	padding-left: 10px;
	position: relative;
}

input.search-text {
	background-color: #fff;
	border: none;
	border-radius: 4px;
	color: #444;
	font-size: 13px;
	padding: 5.5px 15px 4.5px;
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
	padding: 5px 10px;
	font-size: 13px;
	font-weight: bold;
	margin: 1px 50px;
	border-radius: 4px;
	font-weight: bold;
	margin: 1px 50px;
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
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 5.5px 12px 4.5px;
	font-size: 13px;
}

#post-btn:hover {
	background: #dd417c;
	cursor: pointer;
}

#write-btn {
	background: rgb(125, 186, 99);
	border-radius: 4px;
	color: #fff;
	font-weight: bold;
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 5.5px 12px 4.5px;
	font-size: 13px;
}

#write-btn:hover {
	background: #6cb14f;
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
	background: rgba(58, 139, 187, 0.15) !important;
	color: #3a8bbb !important;
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
									<li>설정</li>
									<li>로그아웃</li>
								</ol>
							</div></li>
					</c:otherwise>
				</c:choose>
				<li id="t-search" role="search">
					<form id="search" action="explorer" method="get">
						<input class="search-text" type="search" placeholder="Search "
							value="" name="keyword">
					</form>
					<ul id="search-result">
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<div class="filter">
		<div id="filter-inner">
			<c:if test="${accessor != null and listInfo.blogNo == accessor.no}">
				<ul id="blog-tab">
					<li>포스트</li>
					<li>좋아요</li>
					<li>보관함</li>
				</ul>
			</c:if>
			<div class="filter-right">
				<c:choose>
					<c:when test="${dList ne null or room ne null }">
						<a id="write-btn" href="messagewrite">✎&nbsp;DM&nbsp;</a>
					</c:when>
					<c:otherwise>
						<a id="post-btn" href="postwrite">✎&nbsp;Post&nbsp;</a>
					</c:otherwise>
				</c:choose>
				<c:if test="${listInfo ne null }">
					<div class="select">
						<p id="sort">${listInfo.sort }</p>
						<p id="sort-menu">⌵</p>
						<ul id="sort-dropdown">
							<li id="Like">인기순</li>
							<li id="View">조회순</li>
							<li id="New">최신순</li>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).on('click', '#blog-tab li', function() {
		var text = $(this).text();
		var url = 'blog?blog=${listInfo.blogNo}';
		if (text == '보관함')
			url += '&tab=hide';
		else if (text == '좋아요')
			url += '&tab=like';
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
		var blog = '${listInfo.blogNo}';
		var post = '${postNo}';
		var sort = $(this).text();
		var keyword = '${listInfo.keyword}';
		var url = '${loc}?sort=' + sort;
		if (blog != null && blog != '' && blog > 0)
			url += '&blog=' + blog;
		if (post != null & post != '')
			url += '&post=' + post;
		if (keyword != '')
			url += '&keyword=' + keyword;
		location.href = url;
	});

	$(document).on('click', '#profile-dropdown li', function() {
		if ($(this).text() == '내 블로그')
			location.href = 'blog?blog=${accessor.no}';
		else if ($(this).text() == '설정')
			location.href = 'profile';
		else
			location.href = 'signOut';
	});

	$(document).on('click', '#t-profile>img', function() {
		location.href = 'blog?blog=${accessor.no}';
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

		var tab = '${listInfo.tab}';
		var menu = $('#blog-tab li').eq(0);
		if (tab == 'like')
			menu = $('#blog-tab li').eq(1);
		else if (tab == 'hide')
			menu = $('#blog-tab li').eq(2);

		menu.attr('class', 'tab-selected');
	}
</script>
</html>