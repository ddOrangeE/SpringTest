<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL fmt 라이브러리</title>

<!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body>
	
	<div class="container mt-2">
	
		<%-- 1번 --%>
		<h1>1.후보자 득표율</h1>
		<table class="table text-center mt-2">
			<thead>
				<tr>
					<th>기호</th>
					<th>득표 수</th>
					<th>득표 율</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="candidate" items="${candidates }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td><fmt:formatNumber value="${candidate }" /></td>
					
					<%-- 원래같으면 ${candidate / 1000000 * 100} 까지 해주어야 percent 완성인데 *100 은 format라이브러리가 알아서 해준다 --%>
					<td><fmt:formatNumber value="${candidate / 1000000 }" type="percent" /></td>
				</tr>				
				</c:forEach>
				
			</tbody>
		</table>
		
		<%-- 2번 --%>
		<h1 class="mt-2">2.카드명세서</h1>
		<table class="table text-center mt-2">
			<thead>
				<tr>
					<th>사용처</th>
					<th>가격</th>
					<th>사용 날짜</th>
					<th>할부</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach var="cardBill" items="${cardBills }">
				<tr>
					<td>${cardBill.store }</td>
					<td><fmt:formatNumber value="${cardBill.pay }" type="currency" /></td>
					<fmt:parseDate value="${cardBill.date }" pattern="yyyy-MM-dd" var="date" />
					
					<%-- formatDate 가 해주는 일은 date 객체를 우리가 원하는 형식으로 바꾸어주는 일, 주어진 문자열을 date객체로 만들어내고 만들어낸 date객체를 formatDate 로 표현 --%>
					<td><fmt:formatDate value="${date }" pattern="yyyy년 M월 d일" /></td>
					<td>${cardBill.installment }</td>
				</tr>
			</c:forEach>	
			</tbody>
		
		</table>
		
		
		
	</div>
		






</body>
</html>