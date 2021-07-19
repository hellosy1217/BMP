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
	font-size: 15px;
	font-weight: 500;
	color: #333;
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
	font-weight: 600;
	color: rgb(240, 115, 110);
}

.click, .toggle {
	transition: opacity 300ms;
}

.click:hover, .toggle:hover {
	cursor: pointer;
	opacity: 50%;
}

.toggle {
	font-weight: 600;
}

.toggle_dropdown {
	display: none;
	color: #19345e;
}
</style>
</head>
<body>
	<div id="navigation">
		<div id="navigation-inner">
			<div id="navigation_top">
				<div id="logo" class="click" link="admin">Blog My Pet</div>
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
						<li class="click" link="admin">Dashboard</li>
						<li>
							<p class="toggle">User</p>
							<ol class="toggle_dropdown">
								<li class="click" link="admin/user">사용자 목록</li>
							</ol>
						</li>
						<li><p class="toggle">Post</p>
							<ol class="toggle_dropdown">
								<li class="click" link="admin/post">게시글 목록</li>
								<li>신고된 게시글</li>
							</ol></li>
						<li class="click" link="admin/report">Question</li>
						<li class="click" link="admin/setting">Setting</li>
					</ul>
				</div>
			</div>
			<div id="navigation_bottom" class="click" link="logout">Log Out</div>
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
			$('.toggle_dropdown').hide();
			ol.show();
		} else {
			ol.hide();
		}
	});
</script>
</html>