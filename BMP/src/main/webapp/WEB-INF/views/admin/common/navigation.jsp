<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
	border: 0;
	background: transparent;
	font-family: sans-serif;
}

img {
	object-fit: cover;
}

#navigation {
	display: inline-flex;
	justify-content: center;
	padding: 0 30px;
	background: white;
	position: fixed;
	z-index: 2;
	height: 100%;
}

#navigation-inner {
	display: flex;
	padding: 40px 0;
	flex-direction: column;
	justify-content: space-between;
}

#logo {
	font-size: 20px;
	font-weight: 700;
}

#profile {
	display: flex;
	padding: 40px 0px 30px 0px;
	margin-left: -1px;
}

#profile>div {
	display: flex;
	background: #f9f9f9;
	padding: 15px;
	width: 180px;
	border-radius: 4px;
}

#profile>div>div {
	justify-content: center;
	display: flex;
}

#profile_img img {
	width: 40px;
	height: 40px;
	object-fit: cover;
	border-radius: 50%;
}

#profile_info {
	flex-direction: column;
	padding-left: 15px;
}

#profile_info>p:first-child {
	font-weight: 600;
	font-size: 14px;
}

#profile_info>p:last-child {
	font-size: 11px;
	color: #6d6d7f;
}

#menu ul>li {
	padding-bottom: 20px;
	font-weight: 600;
	font-size: 15px;
}

#menu ol {
	padding-left: 20px;
	padding-top: 10px;
}

#menu ol>li {
	font-size: 14px;
	font-weight: 400;
}

#menu ol>li:first-child {
	padding-bottom: 5px;
}

#navigation_bottom {
	background: rgb(63, 140, 185);
	border-radius: 4px;
	width: max-content;
	text-align: center;
	color: #fff;
	font-weight: bold;
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 5px 12px;
	font-size: 14px;
	width: max-content;
}

#navigation_bottom:hover {
	background: #33769c;
	cursor: pointer;
}

.click, .toggle {
	transition: opacity 300ms;
}

.click:hover, .toggle:hover {
	cursor: pointer;
}

.toggle {
	font-weight: 600;
}

.toggle-dropdown {
	display: none;
}
</style>
</head>
<body>
	<div id="navigation">
		<div id="navigation-inner">
			<div id="navigation_top">
				<div id="logo" class="click" link="/bmp/admin">Blog My Pet</div>
				<div id="profile">
					<div>
						<div id="profile_img">
							<img
								src="https://i.pinimg.com/236x/f7/0b/b1/f70bb194ab10d7c51ef0cc26d8760e8b.jpg">
						</div>
						<div id="profile_info">
							<p>${accessor.nickname }</p>
							<p>${accessor.email }</p>
						</div>
					</div>
				</div>
				<div id="menu">
					<ul>
						<li class="click" link="/bmp/admin">Dashboard</li>
						<li class="click" link="/bmp/admin/user">User</li>
						<li>
							<p class="toggle">Post</p>
							<ol class="toggle-dropdown">
								<li class="click" link="/bmp/admin/post">신고 게시글 목록</li>
							</ol>
						</li>
						<li><p class="click" link="/bmp/admin/report">Report</p>
						<li class="click" link="/bmp/admin/setting">Setting</li>
					</ul>
				</div>
			</div>
			<div id="navigation_bottom" class="click" link="/bmp/signOut">Log
				Out</div>
		</div>
	</div>
</body>
<script>
	$(document).on('click', '.click', function() {
		var link = $(this).attr('link');
		location.href = link;
	});

	$(document).on('click', '.toggle', function() {
		var ol = $(this).parent('li').children('ol');
		if (ol.css('display') == 'none') {
			$('.toggle-dropdown').hide();
			ol.show();
		} else {
			ol.hide();
		}
	});
</script>
</html>