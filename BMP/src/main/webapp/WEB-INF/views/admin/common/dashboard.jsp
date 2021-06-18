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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
}

#body {
	display: flex;
	padding-left: 291.36px;
	background: #f4f4f4;
}

#container {
	width: 100%;
	display: flex;
	padding: 40px 30px 20px 30px;
}

#container_inner {
	width: 100%;
	height: 100%;
}

#statistics {
	padding-bottom: 20px;
}

#statistics>ul, #popular>ul {
	display: flex;
	justify-content: space-around;
}

#statistics>ul>li {
	width: 100%;
}

#statistics>ul>li:nth-child(2) {
	padding: 0 20px;
}

#statistics>ul>li>div {
	background: white;
	border-radius: 4px;
	padding: 20px 20px 30px 20px;
	box-shadow: 0 1px 2px rgb(0 0 0 / 7%);
}

#statistics>ul>li>div>p:last-child {
	text-align: center;
	font-size: 30px;
	font-weight: 600;
	padding: 5px 0;
}

#chart {
	padding-bottom: 20px;
}

#chart>div {
	background: white;
	padding: 20px 30px;
	border-radius: 4px;
	box-shadow: 0 1px 2px rgb(0 0 0 / 7%);
}

#myChart {
	width: 100% !important;
}
</style>
</head>
<body>
	<c:import url="navigation.jsp"/>
	<div id="body">
		<div id="container">
			<div id="container_inner">
				<div id="statistics">
					<ul>
						<li><div>
								<p>Visit</p>
								<p>1000</p>
							</div></li>
						<li><div>
								<p>Post</p>
								<p>1000</p>
							</div></li>
						<li><div>
								<p>Comment</p>
								<p>1000</p>
							</div></li>
					</ul>
				</div>
				<div id="chart">
					<div>
						<canvas id="myChart"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	var today = new Date();

	var year = today.getFullYear();
	var month = today.getMonth() + 1;

	var months = [];

	for (var i = 0; i < 6; i++) {
		var m = month - 5 + i;
		if (m < 1)
			m = m + 12;
		months[i] = m;
	}
	
	const mydata = [ 100, 20, 30, 40, 300,20 ];
	const mydataHalf = [ 100, 10, 20, 7,100,90 ];

	var ctx = $('#myChart');
	var mixedChart = {
		type : 'bar',
		labels : months,
		datasets : [{
			label : '접속자',
			data : mydataHalf,
			backgroundColor : 'transparent',
			/* borderColor : '#ea4c89', */
			type : 'line'
		}, {
			label : '신규회원',
			data : mydata
			/* backgroundColor : 'skyblue' */
		} ]
	};
	var myChart = new Chart(ctx, {
		type : 'bar',
		data : mixedChart,
		options : {
			legend : {
				display : true
			}
		}
	});
</script>
</html>