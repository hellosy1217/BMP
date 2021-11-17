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
#more-btn {
	padding: 5px 10px;
	font-size: 14px;
	position: absolute;
	top: 0;
	right: 0;
	margin-right: -25px;
	margin-top: 12px;
	color: rgb(221, 221, 221);
	transition: color 0.2s;
}

#more-btn:hover {
	cursor: pointer;
	color: rgb(146, 146, 146);
}

#dm-btn, #block-btn {
	border-radius: 4px;
	color: white;
	font-weight: bold;
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 5px 12px;
	font-size: 14px;
	min-width: 63px;
	text-align: center;
	cursor: pointer;
}

#dm-btn {
	background: rgb(125, 186, 99);
}

#dm-btn:hover {
	background: #6cb14f;
}

#block-btn {
	background: #c1c1c1;
}

#user-profile {
	background: white;
	padding-top: 40px;
	border-radius: 8px;
	position: fixed;
	z-index: 4;
	width: 230px;
	box-shadow: 0 1px 2px rgb(0 0 0/ 7%);
}

#profile img {
	width: 50px;
	height: 50px;
	border-radius: 8px;
}

#profile {
	padding: 0 40px;
	/* border-bottom: 1px solid #e5e5e5; */
}

#profile>div {
	display: flex;
	justify-content: center;
}

#profile>div:nth-child(2) {
	font-weight: 800;
	font-size: 17px;
	padding: 20px 0 10px 0;
}

#profile-comment {
	font-size: 13px;
	text-align: center;
	padding: 5px 0;
}

#profile-btns {
	position: relative;
	flex-direction: column;
	padding-top: 15px;
	align-items: center;
}

#profile-btns>p:first-child {
	display: flex;
}

#dm-p, #block-p, #setting-p {
	padding-top: 8px;
	display: none;
	transition: display 0.3s;
}

.follow {
	padding: 20px 20px 30px 20px;
}

.follow>div {
	display: flex;
	justify-content: center;
}

.follow>div p:nth-child(odd) {
	padding-right: 3px;
	font-weight: 700;
	font-size: 15px;
}

.follow>div p:nth-child(odd):hover {
	color: #444c;
	cursor: pointer;
}

.follow>div p:nth-child(even) {
	font-size: 12px;
	margin-top: 2px;
	padding-left: 3px;
}

.follow>div p:nth-child(3) {
	padding-left: 12px;
}

.font-rotate {
	-webkit-transform: rotate(180deg);
	margin-top: 17px !important;
}

.follow-btn, #setting-btn {
	background: rgb(63, 140, 185);
	border-radius: 4px;
	color: #fff;
	font-weight: bold;
	letter-spacing: .02em;
	-webkit-appearance: none;
	padding: 5px 12px;
	font-size: 14px;
	min-width: 63px;
	text-align: center;
}

.follow-btn:hover, #setting-btn:hover {
	background: #33769c;
	cursor: pointer;
}

.followed {
	background: #ddd !important;
	color: #929292 !important;
}

.follow a, #blog-btn {
	color: unset;
}
</style>
</head>
<body>
	<div id="user-profile">
		<div id="profile">
			<div>
				<img src="${profile.fileName }">
			</div>
			<div>
				<a href="blog?blog=${profile.no }" id="blog-btn">${profile.nickname }</a>
			</div>
			<c:if test="${profile.comment ne null and profile.comment ne '' }">
				<div id="profile-comment">${profile.comment }</div>
			</c:if>
			<div id="profile-btns">
				<c:choose>
					<c:when test="${accessor ne null && accessor.no eq profile.no }">
						<p id="dmList-p">
							<a id="dm-btn">Message</a>
						</p>
						<p>
							<a id="more-btn">⌵</a>
						</p>
						<p id="setting-p">
							<a id="setting-btn" href="setting">Setting</a>
						</p>
					</c:when>
					<c:when
						test="${profile.blockInfo != null and profile.blockInfo.no != 0}">
						<p id="blocked-p">
							<a class="block-btn blocked" id="block-btn">Blocked</a>
						</p>
					</c:when>
					<c:when test="${profile.blocked == 0 }">
						<p>
							<c:choose>
								<c:when
									test="${profile.followInfo != null and profile.followInfo.no != 0}">
									<a class="follow-btn followed" id="follow-btn">Following</a>
								</c:when>
								<c:otherwise>
									<a class="follow-btn" id="follow-btn">Follow</a>
								</c:otherwise>
							</c:choose>
						</p>
						<p>
							<a id="more-btn">⌵</a>
						</p>
						<p id="dm-p">
							<a id="dm-btn">Message</a>
						</p>
						<p id="block-p">
							<a class="block-btn" id="block-btn">Block</a>
						</p>
					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="follow">
			<div>
				<p>
					<a href="follow?no=${profile.no }">${profile.follow }</a>
				</p>
				<p>팔로잉</p>
				<p>
					<a href="follower?no=${profile.no }">${profile.follower }</a>
				</p>
				<p>팔로워</p>
			</div>

		</div>
	</div>
</body>
<script>
	var followed = '${profile.followInfo.no}';
	var blocked = '${profile.blockInfo.no}';

	if (followed == '')
		followed = 0;
	if (blocked == '')
		blocked = 0;

	$(document).on('click', function(e) {
		var id = $(e.target).attr('id');

		if (id == 'more-btn')
			moreBtn();
		else if ('${accessor}' != '') {
			switch (id) {
			case 'dm-btn':
				dm();
				break;
			case 'follow-btn':
				follow();
				break;
			case 'block-btn':
				block();
				break;
			}
		} else {
			if (id.indexOf('btn') > -1)
				location.href = 'signIn';
		}
	});

	function moreBtn() {
		if ($('#more-btn').attr('class') != 'font-rotate') {
			$('#block-p').css('display', 'flex');
			$('#dm-p').css('display', 'flex');
			$('#setting-p').css('display', 'flex');
			$('#more-btn').attr('class', 'font-rotate');
		} else {
			$('#block-p').css('display', 'none');
			$('#dm-p').css('display', 'none');
			$('#setting-p').css('display', 'none');
			$('#more-btn').attr('class', '');
		}
	}

	function dm() {
		if ('${accessor.no}' == '${profile.no}')
			location.href = 'messages';
		else {
			$.ajax({
				type : 'post',
				url : 'findRoom.do',
				dataType : 'json',
				data : {
					userNo : '${profile.no}',
					userNo2 : '${accessor.no}'
				},
				success : function(data) {
					alert(data);
					location.href = 'message?no=' + data;
				}
			});
		}
	}

	function follow() {
		var text = $('#follow-btn').text();
		var pms = 'Y';
		if ('${profile.userPrivate}' == 'Y')
			pms = 'N';
		$.ajax({
			type : 'post',
			url : 'follow.do',
			dataType : 'json',
			data : {
				no : followed,
				permission : pms,
				toUser : '${profile.no}',
				fromUser : '${accessor.no}'
			},
			success : function(data) {
				followed = data;
				location.reload(true);
			}
		});
	}

	function block() {
		$.ajax({
			type : 'post',
			url : 'block.do',
			dataType : 'json',
			data : {
				followNo : followed,
				no : blocked,
				toUser : '${profile.no}',
				fromUser : '${accessor.no}'
			},
			success : function(data) {
				blocked = data;
				location.reload(true);
			}
		});
	}
</script>
</html>