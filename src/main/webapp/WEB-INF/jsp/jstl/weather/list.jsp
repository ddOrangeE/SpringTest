<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 리스트</title>

<!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

	<style>
		<%-- 높이 지워주면 컨텐츠 높이에 따라 자동으로 채워진다 (컨텐츠 높이는 지정해주지 않는 게 편함) --%>
	
		.main-menu {
			background-color:cornflowerblue;
		}
		
		
		footer {
			height:100px
		}
	</style>
</head>
<body>

	<div class="container">
		
		<div class="d-flex">
			<nav class="main-menu col-3">
			<div class="d-flex mt-2">
				<div class="col-2">
				<img width="25" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2F20100201_49%2Ffuddkdi_1265016788801zYqCq_png%2F%25B1%25E2%25BB%25F3%25C3%25BB_fuddkdi.png&type=a340">
				</div>
				<h3 class="text-white col-10">기상청</h3>
			</div>
			
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link text-white" href="#">날씨</a></li>
					<li class="nav-item"><a class="nav-link text-white" href="#">날씨입력</a></li>
					<li class="nav-item"><a class="nav-link text-white" href="#">테마날씨</a></li>
					<li class="nav-item"><a class="nav-link text-white" href="#">관측기후</a></li>
				</ul>
			
			</nav>
			<section class="content col-9">
				<h1>과거 날씨</h1>
				
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
						<c:forEach var="weather" items="${weathers }">
						<tr>
							<td><fmt:formatDate value="${weather.date }" pattern="yyyy년 M월 d일" /></td>
							<c:choose>
								<c:when test="${weather.weather eq '맑음' }">
									<td><img src="http://marondal.com/material/images/dulumary/web/jstl/sunny.jpg"></td>								
								</c:when>
								
								<c:when test="${weather.weather eq '구름조금' }">
									<td><img src="http://marondal.com/material/images/dulumary/web/jstl/partlyCloudy.jpg"></td>								
								</c:when>
								
								<c:when test="${weather.weather eq '흐림' }">
									<td><img src="http://marondal.com/material/images/dulumary/web/jstl/cloudy.jpg"></td>								
								</c:when>
								
								<c:when test="${weather.weather eq '비' }">
									<td><img src="http://marondal.com/material/images/dulumary/web/jstl/rainy.jpg"></td>								
								</c:when>
								<%-- 나중에 다른 정보가 추가되었을 때 글씨라도 보여주어야 좋으니까 --%>
								<c:otherwise>
									<td>${weather.weather }</td>
								</c:otherwise>
								
							</c:choose>
							
							<td>${weather.temperatures }°C</td>
							<td>${weather.precipitation }mm</td>
							<td>${weather.microDust }</td>
							<td>${weather.windSpeed }km/h</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
		<footer class="bg-danger d-flex">
			<div class="mt-3 ml-4">
				<img width="120" src="">
			</div>
		</footer>
	</div>
	
</body>
</html>