<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#paging {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

#paging ul {
	display: flex;
}

#paging li {
	padding: 0 5px;
}

#paging li>p {
	font-size: 13px;
	padding: 5px 0;
	border-radius: 8px;
}

#paging li>p:hover {
	cursor: pointer;
	opacity: 80%;
}

.numBtn {
	padding: 5px 10px !important;
}

.arrowBtn {
	padding: 5px 5px !important;
}

.noneselect {
	color: #6d6d7f;
	opacity: 80%;
}

.noneselect:hover {
	cursor: default !important;
}
</style>
</head>
<body>
	<div id="paging">
		<div>
			<ul>
				<li><p no="1">〈</p></li>
				<li><p class="arrowBtn" no="${paging.currentPage-1 }">Prev</p></li>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="i">
					<li><p class="numBtn" no="${i}">${i }</p></li>
				</c:forEach>
				<li><p class="arrowBtn" no="${paging.currentPage+1 }">Next</p></li>
				<li><p no="${paging.maxPage }">〉</p></li>
			</ul>
		</div>
	</div>
</body>
<script>
	$(function() {
		var currentPage = '${paging.currentPage}';
		var maxPage = '${paging.maxPage}';
		if (currentPage == 1) {
			$('#paging p[no="0"]').attr('class', 'numBtn noneselect');
			$('#paging p[no="1"]').attr('class', 'numBtn noneselect');
		}

		if (currentPage == maxPage) {
			$('#paging p[no="' + maxPage + '"]').attr('class',
					'numBtn noneselect');
			$('#paging p[no="' + (Number(maxPage) + 1) + '"]').attr('class',
					'numBtn noneselect');
		}

		$('#paging p[no="' + currentPage + '"]').attr('class',
				'numBtn noneselect');
	});
</script>
</html>