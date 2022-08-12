<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리 2</title>

<!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body>
	
	<%-- 1번 --%>
	<div class="container mt-2">	
		<h1>HOT 5</h1>
		
		<table class="table text-center mt-2">
			<thead>
				<tr>
					<th>순위</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="music" items="${musicRanking }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${music }</td>
					</tr>				
				</c:forEach>
			</tbody>
		</table>


	<%-- 2번 --%>
		<h1 class="mt-2">멤버십</h1>
		
		<table class="table text-center mt-2">
			<thead>
				<tr>
					<th>이름</th>
					<th>전화 번호</th>
					<th>등급</th>
					<th>포인트</th>
				</tr>
			</thead>
			<tbody>
				
				<c:forEach var="member" items="${membership }">	
					
					<tr>
						<td>${member.name }</td>
						<td>${member.phoneNumber }</td>
				
					<%--
					<c:choose>
						<c:when test="${member.grade eq 'VIP' }">
							<c:set var="textColor" value="danger" />
						</c:when>
						
						<c:when test="${member.grade eq 'GOLD' }" >
							<c:set var="textColor" value="warning" />
						</c:when>
						
						<c:otherwise>
							<c:set var="textColor" value="dark" />
						</c:otherwise>	
					</c:choose>					
					<td class="text-${textColor }">${member.grade }</td>
					 --%>		
					 
					 <%-- 선생님 풀이 --%>		
					<c:choose>
						<c:when test="${member.grade eq 'VIP' }" >
							<td class="text-danger">${member.grade }</td>
						</c:when>
						
						<c:when test="${member.grade eq 'GOLD' }">
							<td class="text-warning">${member.grade }</td>
						</c:when>
						<c:otherwise>
								<td>${member.grade }</td>
						</c:otherwise>
						
					</c:choose>
					
					<%--
					<c:choose>
						<c:when test="${member.point >= 5000 }" >
							<c:set var="pointColor" value="primary" />
						</c:when>
					
						<c:otherwise>
							<c:set var="pointColor" value="dark" />
						</c:otherwise>					
					</c:choose>														
							<td class="text-${pointColor }">${member.point }P</td>
					 --%>
					
					<%-- 선생님 풀이 --%>
					<c:choose>
						<c:when test="${member.point >= 5000 }" >
							<td class="text-primary">${member.point }P</td>
						</c:when>
						
						<c:otherwise>
							<td>${member.point }P</td>
						</c:otherwise>
					</c:choose>				
					</tr>										
				</c:forEach>
			</tbody>
		</table>
			

	</div>
</body>
</html>