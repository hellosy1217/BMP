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
	height: 100%;
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

.nonehover:hover {
	background: unset !important;
	cursor: unset !important;
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

.reportInfo:hover {
	cursor: pointer;
}

.reportInfo span {
	display: flex;
	align-items: center;
	justify-content: center;
}

.reportInfo span>a {
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

.notice a, .dialog a {
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

#delete-cancel, #mail-cancel {
	background: #ddd;
	color: #929292;
}

#delete-submit, #mail-submit {
	background: rgb(63, 140, 185);
	color: #fff;
}

.dialog {
	position: fixed;
	background: white;
	color: #333;
	border-radius: 4px;
	left: calc(50% - 281px);
	top: calc(50% - 210.5px);
	box-shadow: 0px 10px 70px rgb(0 0 0/ 15%);
	font-size: 10px;
	padding: 21px 20px 19px;
	transition: opacity 2000ms;
	flex-direction: column;
	align-items: center;
	display: none;
	opacity: 0;
	z-index: 5;
}

.dialog input, .dialog textarea {
	outline: none;
	border-radius: 6px;
	padding: 8.5px 10px 7.5px;
	outline: none;
	font-size: 12px;
	background: #fff;
	border: 1px solid #e0e0e0;
	cursor: text;
	width: 500px;
	transition: background 0.3s;
	resize: none;
	margin-bottom: 10px;
}

.dialog textarea {
	height: 100px;
}

.dialog>div:first-child, .dialog p {
	display: flex;
	flex-direction: column;
}

.dialog>div:last-child {
	display: flex;
	justify-content: flex-end;
	width: 100%;
}

.dialog p>label {
	font-weight: 500;
	padding-bottom: 2px;
	font-size: 12px;
}
</style>
</head>
<body>
	<c:import url="../common/navigation.jsp" />
	<div id="body">
		<div id="container">
			<div class="filter">
				<form action="/bmp/admin/report" method="get">
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
							<td>이메일</td>
							<td>상태</td>
							<td>등록일</td>
						</tr>
						<c:forEach items="${list }" var="report">
							<tr class="reportInfo" no="${report.no }">
								<td id="checkBox">
									<div>
										<input type="checkbox" id="checkbox${report.no }"
											value="${report.no }"><label class=""
											for="checkbox${report.no }"></label>
									</div>
								</td>
								<td class="nickname"><p>${report.title }</p></td>
								<td>${report.nickname }</td>
								<td>${report.email }</td>
								<c:choose>
									<c:when test="${report.commDate eq null }">
										<td>답변대기</td>
									</c:when>
									<c:otherwise>
										<td>답변완료</td>
									</c:otherwise>
								</c:choose>
								<td>${report.regDate }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="bottom-btns">
				<div>
					<a class="btns" id="checkAllBtn">전체 선택</a><a class="btns"
						id="deleteBtn">선택 삭제</a>
				</div>
				<div>
					<c:import url="../../common/paging.jsp" />
				</div>
			</div>
		</div>
	</div>
	<div class="notice">
		<h4>선택한 문의글을 삭제하시겠습니까?</h4>
		<div>
			<a id="delete-cancel">취소</a><a id="delete-submit">확인</a>
		</div>
	</div>
	<div class="dialog">
		<div>
			<p>
				<label>제목</label><input type="text" id="mail-title"
					readonly="readonly">
			</p>
			<p>
				<label>내용</label>
				<textarea id="mail-content" readonly="readonly"></textarea>
			</p>
			<p>
				<label>답변</label>
				<textarea id="mail-comment"></textarea>
			</p>
		</div>
		<div>
			<a id="mail-cancel">취소</a><a id="mail-submit">전송</a>
		</div>
	</div>
</body>
<script>
	var email = '';
	var no = 0;

	$(document).on('change', 'input[type=checkbox]', function() {
		var id = 'label[for="' + $(this).attr('id') + '"]';
		if ($(this).prop('checked'))
			$(id).text('✓');
		else
			$(id).text('');
	});

	$('.reportInfo').on('click', function() {
		no = $(this).attr('no');
		$.ajax({
			url : 'report.do',
			dataType : 'json',
			data : {
				no : no
			},
			success : function(data) {
				$('#mail-title').val(data.title);
				$('#mail-content').val(data.content);
				email = data.email;
				setTimeout(function() {
					$('.dialog').css({
						'display' : 'flex',
						'opacity' : '100'
					});
				}, 100);
			}
		});
	});

	$('#checkAllBtn').on('click', function() {
		var id = $('input[type=checkbox]');
		var checked = $('input[type=checkbox]:checked').length;
		if (checked == '${fn:length(list)}') {
			id.prop('checked', false);
			$('#table label').text('');
		} else {
			id.prop('checked', true);
			$('#table label').text('✓');
		}
	});

	$('#paging p').on('click', function() {
		var classname = $(this).attr('class');

		if (classname != 'numBtn noneselect') {
			var page = $(this).attr('no');
			var url = '/bmp/admin/report?page=' + page;

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
			var report = $(this).val();
			reports.push(report);
		});
		$.ajax({
			type : 'post',
			url : 'delReports.do',
			data : {
				reports : reports
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				location.reload(true);
			}
		});
	});

	$('#mailBtn').on('click', function() {
		if ($('input[type=checkbox]:checked').length > 0) {
			$('.dialog').css({
				'display' : 'flex',
				'opacity' : '100'
			});
		}
	});

	$('#mail-cancel').on('click', function() {
		$('.dialog').css('opacity', '0');
		setTimeout(function() {
			$('.dialog').css('display', 'none');
			$('#mail-comment').val('');
		}, 2000);
	});

	$('#mail-submit').on('click', function() {
		var title = $('#mail-title').val().trim();
		var comment = $('#mail-comment').val().trim();
		if (comment == '') {
			$('#mail-comment').focus();
		} else {
			$.ajax({
				type : 'post',
				url : 'comment.do',
				dataType : 'json',
				data : {
					no : no,
					title : title,
					comment : comment,
					email : email
				},
				success : function(data) {
					console.log(data);
					location.reload(true);
				}
			});

		}
	});
</script>
</html>