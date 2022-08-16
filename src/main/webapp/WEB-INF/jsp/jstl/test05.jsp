<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종합문제 1</title>
<!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>

<style type="text/css">
	#wrap {
		width:1200px;
		margin:auto;
	}
	
	
	.main-logo {
		width:20%;
		height:80px;
		background-color:#87CEFA;
	}
	
	.logo {
		color:white;
		font-weight:bold;
		font-size:x-large;
	}
	
	
	.out-center {
		display:table;
	}
	
	.inner-center {
		display:table-cell;
		vertical-align:middle;
		text-align:center;
	}
	
	
	.sub-logo {
		width:80%;
		height:80px;
		display:table;
		padding-left:10px;
	}
	
	.sub-logoText {
		display:table-cell;
		vertical-align:middle;
		
	}

	.main-menu {
		width:20%;
		height:600px;
		background-color:#87CEFA;
	}
	
	.main-content {
		width:80%;
		height:600px;
	}
	
	#nav {
		list-style-type:none;
		margin:0;
		padding:0;
		margin-left:15px;
	}
	
	.nav-items {
		color:white;
		font-size:large;
		margin-top:40px;
	}
	
	.li {
		margin-top:30px;
	}
</style>
<body>

	<div id="wrap">
		<header class="d-flex">
			<div class="main-logo out-center">
				
				<div class="inner-center">
					<img width=40; src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2F20100201_49%2Ffuddkdi_1265016788801zYqCq_png%2F%25B1%25E2%25BB%25F3%25C3%25BB_fuddkdi.png&type=a340" alt="기상청 로고">
					<span class="logo">기상청</span>				
				</div>
			</div>
			<div class="sub-logo">
				<h3 class="sub-logoText">과거 날씨</h3>
			</div>
		</header>
		<div class="d-flex">
			<div class="main-menu">
				<ul id="nav">
					<li class="li"><a class="nav-items" href="#">날씨</a></li>
					<li class="li"><a class="nav-items" href="#">날씨입력</a></li>
					<li class="li"><a class="nav-items" href="#">테마날씨</a></li>
					<li class="li"><a class="nav-items" href="#">관측기후</a></li>
				</ul>
			
			</div>
			<section class="main-content">
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2015년 7월 1일</td>
							<td><img src="http://marondal.com/material/images/dulumary/web/jstl/rainy.jpg" alt="비"></td>
							<td>21.9</td>
							<td>83.5mm</td>
							<td>보통</td>
							<td>2.9km/h</td>
						</tr>
					</tbody>
				</table>
			
			</section>
		</div>
		<footer id="footer">
			
			<div class="d-flex pt-3 ml-3">
				<div>
					<img width=80px; src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2F20100201_49%2Ffuddkdi_1265016788801zYqCq_png%2F%25B1%25E2%25BB%25F3%25C3%25BB_fuddkdi.png&type=a340" alt="기상청 로고">
				</div>
				<div class="ml-3 text-secondary">
					(07062) 서울시 동작구 여의대방로16길 61 <br>
					Copyright2020 KMA. ALL Rights RESERVED.
				</div>
			</div>
		</footer>
	
	
	</div>	


</body>
</html>